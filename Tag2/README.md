# Tag 2 Räumliche Regression

Wir werden uns heute nocheinmal mit der räumlichen Regression beschäftigen. Diesmal wollen wir R benutzen.

Die Scripte gehen davon aus, dass es einen Ordner (z.B. Tag2/) gibt, in dem sich alle Scripte des Tages befinden sowie ein Unterordner *data*, in dem sich alle Daten befinden. Hierbei müssen die Zip-Archive mit den Shapefiles entpackt sein.

# Daten

* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/HH.gpkg">Geopackage mit den Ladestationen für Hamburg</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/chargingStations_berlin.zip">Zip Archiv mit dem Shapefile der Ladestationen für Berlin</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/popPoly.zip">Zip Archiv mit dem Shapefile der Bevölkerungsinformation für Hamburg</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/Berlin.gpkg">Geopackage mit den Bevölkerungsdaten für Berlin</a>

# Scripte

Ihr müsst wahrscheinlich die HTML Seiten zusammen mit den Scripten runterladen und dann im Webbrowser eurer Wahl öffnen.

## Laden der Daten über einen OGC WebFeatureService (WFS)
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_getDataFreomWFS_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_getDataFreomWFS_HH.html">HTML Notebook</a>


## Explorative Analyse
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_explorative_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_explorative_HH.html">HTML Notebook</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/plotLocalMoransI.r">Script zum Plotten von Local Moran's I</a>

## Nicht-räumliche und räumliche Regression
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_spatialReg_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_spatialReg_HH.html">HTML Notebook</a>
