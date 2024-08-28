#!/bin/bash

#-------------------------------------------------------------------------------
# - Creates map database
# - Populates map database with map data
# - Sets up Geoserver
#-------------------------------------------------------------------------------

./uploadRNCCellSchema.sh $1
./setupRNCCellDatastore.sh $1
