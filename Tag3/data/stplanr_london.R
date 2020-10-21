library(dplyr)
library(stplanr)
library(pct)
library(osrm)
# get nationwide OD data
od_all <- pct::get_od()
nrow(od_all)

od_all$Active <- (od_all$bicycle + od_all$foot) /
  od_all$all * 100

#####centroids
centroids_all <- pct::get_centroids_ew() %>% sf::st_transform(4326)
nrow(centroids_all)

#####london beispiel
london <- pct::pct_regions %>% filter(region_name == "london")
centroids_london <- centroids_all[london, ]

od_london <- od_all %>%
  filter(geo_code1 %in% centroids_london$msoa11cd) %>%
  filter(geo_code2 %in% centroids_london$msoa11cd)
od_london <- od_all[
  od_all$geo_code1 %in% centroids_london$msoa11cd &
    od_all$geo_code2 %in% centroids_london$msoa11cd,
  ]

desire_lines_london <- od2line(od_london, centroids_london)
nrow(desire_lines_london)

min_trips_threshold <- 20
desire_lines_inter <- desire_lines_london %>% filter(geo_code1 != geo_code2)
desire_lines_intra <- desire_lines_london %>% filter(geo_code1 == geo_code2)
desire_lines_top <- desire_lines_inter %>% filter(all >= min_trips_threshold)
nrow(desire_lines_top)

nrow(desire_lines_top) / nrow(desire_lines_london)
# > 0.08189046
sum(desire_lines_top$all) / sum(desire_lines_london$all)
# > 0.557343

######
plot(desire_lines_top["all"])
#####
lwd <- desire_lines_top$all / mean(desire_lines_top$all) / 10
desire_lines_top$percent_dont_drive <- 100 - desire_lines_top$car_driver / desire_lines_top$all * 100
plot(desire_lines_top["percent_dont_drive"], lwd = lwd, breaks = c(0, 50, 70, 80, 90, 95, 100))
######
library(tmap)
desire_lines_top <- desire_lines_top %>%
  arrange(Active)
tm_shape(london) + tm_borders() +
  tm_shape(desire_lines_top) +
  tm_lines(
    palette = "plasma", breaks = c(0, 5, 10, 20, 40, 100),
    lwd = "all",
    scale = 9,
    title.lwd = "Number of trips",
    alpha = 0.5,
    col = "Active",
    title = "Active travel (%)",
    legend.lwd.show = FALSE
  ) +
  tm_scale_bar() +
  tm_layout(
    legend.bg.alpha = 0.5,
    legend.bg.color = "white"
  )

#####summaries origin
zones_london <- pct::get_pct_zones("london") %>%
  select("geo_code")
origin_attributes <- desire_lines_top %>%
  sf::st_drop_geometry() %>%
  group_by(geo_code1) %>%
  summarize_if(is.numeric, sum) %>%
  dplyr::rename(geo_code = geo_code1)
# origin_attributes <-
zones_origins <- left_join(zones_london, origin_attributes, by = "geo_code")
plot(zones_origins, border = NA)

######summaries destination
destination_attributes <- desire_lines_top %>%
  sf::st_drop_geometry() %>%
  group_by(geo_code2) %>%
  summarize_if(is.numeric, sum) %>%
  dplyr::rename(geo_code = geo_code2) %>%
  mutate_at(vars(-matches("geo_|all")), funs(. / all)) %>%
  left_join(zones_london, ., by = "geo_code")

plot(destination_attributes, border = NA)

###############routing

travel_network <- od2line(flow = od_data_sample, zones = cents_sf)
w <- flow$all / max(flow$all) *10
plot(travel_network, lwd = w)

#> Data: (c) OpenStreetMap contributors, ODbL 1.0 - http://www.openstreetmap.org/copyright
#> Routing: OSRM - http://project-osrm.org/
trip <- route(
  from = c(-0.11, 51.514),
  to = c(-0.10, 51.506),
  route_fun = osrmRoute,
  returnclass = "sf"
)
#> Most common output is sf
mapview::mapview(trip)

