if(!require(dplyr)){install.packages("dplyr");library(dplyr)}
if(!require(ggmap)){install.packages("ggmap");library(ggmap)}
if(!require(rgdal)){install.packages("rgdal");library(rgdal)}
if(!require(sf)){install.packages("sf");library(sf)}
if(!require(tmap)){install.packages("tmap");library(tmap)}
if(!require(leaflet)){install.packages("leaflet");library(leaflet)}

#####Exercise 1: Reading shp-files with rgdal and displaying with ggmap/ggplot#####
setwd("D:/Projekte/urbandatalab/data/export")

ka_rgdal <- readOGR(dsn = ".", layer = "ka_fr_00_link") %>%
  spTransform("+proj=longlat +ellps=WGS84")

ka_map <- get_map(location=ka_rgdal@bbox)

###shapefile has to be converted to a dataframe for use in ggplot2
ka_df <- fortify(ka_rgdal)

map <- ggmap(ka_map) +
  geom_path(data = ka_df, 
            aes(x = long, y = lat, group=group),
            color = 'red', size = 1)
map

#####Exercise 2: Reading shp-files with sf and displaying with tmap#####

ka_sf <- st_read(dsn = ".", layer = "ka_fr_00_link")

ka_sf <- st_transform(ka_sf, 4326)
tm_shape(ka_sf)+tm_lines(col="MEDIANSP.3", style = "equal", lwd="MEDIANSP.3", scale=5, legend.lwd.show = FALSE)

###Change between plot and view mode
tmap_mode("plot")
tmap_last()

#####Exercise 3: Displaying maps with leaflet#####
binpal <- colorBin("plasma", ka_sf$MEDIANSP.3, 5, pretty = FALSE)

int_map <- leaflet() %>%
  addTiles() %>%
  addPolylines(data=ka_sf, color = ~binpal(MEDIANSP.3))

int_map
#options = providerTileOptions(opacity = 0.35)
#####Batch Load Shps#####

shps <- list.files(,pattern = "*.SHP")
###shp load function
rgdal_batch_shp <- function(shp_list) {
  
  layer_name <- as.character(gsub(".SHP","",shp_list))
  
  shp_spdf <-readOGR(dsn = ".", stringsAsFactors = FALSE, verbose = TRUE, 
                     useC = TRUE, dropNULLGeometries = TRUE, addCommentsToPolygons = TRUE,
                     layer = layer_name, require_geomType = NULL,
                     p4s = NULL, encoding = 'ESRI Shapefile')
  shp_spdf <- spTransform(shp_spdf, CRS("+proj=longlat +datum=WGS84 +no_defs"))
}
###extract files
batch_shp_list <- lapply(shps, rgdal_batch_shp)

for (i in seq(batch_shp_list))
  assign(paste("ka", i-1, sep = ""), batch_shp_list[[i]])

######




