#!/bin/bash

echo "Récupération de l'application .exe"
curl -O https://www.ter.ritmx.sncf.com/cache/installer/setup-rechargement-SNCF-TER-v1_9-x32.exe
echo "Extraction des assets"
/usr/local/Cellar/innoextract/1.6/bin/innoextract setup-rechargement-SNCF-TER-v1_9-x32.exe
echo "Lancement de l'application"
java -jar app/app/clientDomter-jfx.jar