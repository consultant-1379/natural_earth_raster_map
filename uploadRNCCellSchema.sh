#!/bin/bash

#-------------------------------------------------------------------------------
# usage : ./mapimport.sh regionimport.properties
#-------------------------------------------------------------------------------

# properties file
. $1

if [ -z "$PG_BIN_DIR" ]; then
	echo "Didn't find postgres bin directory, exiting"
	exit 0
fi

# Create the Map Database
if [ $CREATE_DATASTORE == "true" ]; then
	echo "Creating $RNC_CELL_DATASTORE"
	"$PG_BIN_DIR"/createdb -p $POSTGIS_PORT -U $POSTGIS_USER --template=$POSTGIS_TEMPLATE $RNC_CELL_DATASTORE
	if [ $? -ne 0 ]; then
	  echo "There was an error while creating the $RNC_CELL_DATASTORE database."
	  exit 0
	fi
fi

function runSql {
	echo "Creating : $1"
	"$PG_BIN_DIR"/psql -p $POSTGIS_PORT -U $POSTGIS_USER -f $1 -d $RNC_CELL_DATASTORE 
	if [ $? -ne 0 ]; then
		echo "There was an error while creating $1"
		exit 0
	fi
}
#----------------------------
# Create schemas
#----------------------------
for schemaFile in $RNC_CELL_SCHEMAS_DIR/*
do
runSql $schemaFile
done