# Tag 2 Räumliche Regression

Wir werden uns heute nocheinmal mit der räumlichen Regression beschäftigen. Diesmal wollen wir R und R-Studio benutzen.

## Installation
Zuerst muss <a href="https://cran.r-project.org/">R</a> installiert werden. Dann kann die kostenlose Version von <a href="https://rstudio.com/products/rstudio/download/">Rstudio</a> installiert werden.

Installationanleitungen für die gängigen Betriebssysteme sind auf den Seiten zu finden.

Bitte installiert auch die benötigten R-packages. Am einfachsten könnte ihr folgendes <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/installRequiredPackages.r">R-Script</a> herunterladen und dann in Rstudio öffen und ausführen. Falls es dabei zu Fehlermeldungen kommt, kopiert die bitte, damit wir das Morgen ggf. noch lösen können.



## Organisation des Workspace

Die Scripte gehen davon aus, dass es einen Ordner (z.B. Tag2/) gibt, in dem sich alle Scripte des Tages befinden sowie ein Unterordner *data*, in dem sich alle Daten befinden. Hierbei müssen die Zip-Archive mit den Shapefiles entpackt sein.

## Daten

* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/data/HH.gpkg">Geopackage mit den Ladestationen für Hamburg</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/data/chargingStations_berlin.zip">Zip Archiv mit dem Shapefile der Ladestationen für Berlin</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/data/popPoly.zip">Zip Archiv mit dem Shapefile der Bevölkerungsinformation für Hamburg</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/data/Berlin.gpkg">Geopackage mit den Bevölkerungsdaten für Berlin</a>

## Scripte

Ihr müsst wahrscheinlich die HTML Seiten zusammen mit den Scripten runterladen und dann im Webbrowser eurer Wahl öffnen.

### Laden der Daten über einen OGC WebFeatureService (WFS)
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_getDataFreomWFS_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_getDataFreomWFS_HH.html">HTML Notebook</a>


### Explorative Analyse
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_explorative_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_explorative_HH.html">HTML Notebook</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/plotLocalMoransI.r">Script zum Plotten von Local Moran's I</a>

### Nicht-räumliche und räumliche Regression
*  <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_spatialReg_HH.Rmd">Script</a>
* <a href="https://raw.githubusercontent.com/heikalab/urbandatascience/main/Tag2/udlDay2_spatialReg_HH.html">HTML Notebook</a>
