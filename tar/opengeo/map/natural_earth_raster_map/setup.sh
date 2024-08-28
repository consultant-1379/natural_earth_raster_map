#!/bin/bash

#-------------------------------------------------------------------------------
# - Creates map database
# - Populates map database with map data
# - Sets up Geoserver
#-------------------------------------------------------------------------------

./uploadSchemesAndShoreline.sh $1
./setupGeoServer.sh $1
./createDefaultLayerGroup.sh $1
