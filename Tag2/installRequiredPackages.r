# this script installs the required packages for the urban data lab 2020

# run only once
# the script assumes that R and afterwards RStudio have been installed properly
thePackages <- c("sf", "sp", "rgdal" ,"tidyverse", "corrplot", "ggplot2", "spdep", "spatialreg", "ncf", "pscl", "lmtest", "jtools", "tmap", "spgwr", "rosm", "osmdata", "gstat", "RColorBrewer", "viridisLite", "smerc", "vegan", "sandwich", "maptools", "tripack", "dbscan", "raster", "tidyverse", "remotes", "RCurl", "ows4R", "httr", "KernSmooth", "OpenStreetMap")
existingPackages <- installed.packages()               
idx <- which(!thePackages %in% existingPackages)
cat(paste("Installing the following packages: ", thePackages[idx], "\n"))
if(length(idx)>0)
{
  install.packages(thePackages[idx], dependencies=TRUE)  
}
idx <- which(existingPackages == "openrouteservice")
if(length(idx)==0)
{
  remotes::install_github("GIScience/openrouteservice-r")
}