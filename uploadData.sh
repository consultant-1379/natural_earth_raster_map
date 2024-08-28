#!/bin/bash



#-------------------------------------------------------------------------------

# usage :

# ./uploadData.sh <cells_csv_file> [rncids_csv_file] 

#-------------------------------------------------------------------------------



if [ -z "$1" ]; then

	echo "Usage : ./uploadData.sh <cells_csv_file> [rncids_csv_file]"

	exit 0

fi

# properties file

. $(dirname $0)/uploadData.properties



if [ -z "$PG_BIN_DIR" ]; then

	echo "Didn't find postgres bin directory, exiting"

	exit 0

fi



if [ -z "$OGR2OGR" ]; then

	echo "Didn't find ogr2ogr tool, exiting"

	exit 0

fi



function updateRncidsLocation {

if [ -f "$1" ]

then

echo "Updating rncids locations..."

		tail +2 "$1" | while read line

		    do

		        rncid=$(echo "$line" | awk -F, '{print $1}')

			sql="update rncids set wkb_geometry = (select st_centroid(ST_ConvexHull(ST_Collect(wkb_geometry))) as GeometryWKT from $CELLS_TABLENAME where rncid = '$rncid'), geometrywkt = (select st_astext(st_centroid(ST_ConvexHull(ST_Collect(wkb_geometry)))) as GeometryWKT from $CELLS_TABLENAME where rncid = '$rncid') where rncid='$rncid'"

			"$PG_BIN_DIR"/psql -p $POSTGIS_PORT -U $POSTGIS_USER -c "$sql" -d $RNC_CELL_DATASTORE

		done



fi

}



function uploadCells {

if [ -f "$1" ]

then

echo "Uploading cells..."

	CSV_FILE=$(basename $csvFile)

	LAYER_NAME="${1##*/}" 

		LAYER_NAME="${LAYER_NAME%.*}"



		echo "Uploading cells $LAYER_NAME"



		echo "<OGRVRTDataSource><OGRVRTLayer name="$LAYER_NAME"><SrcDataSource>"$1"</SrcDataSource><GeometryType>wkbPoint</GeometryType><LayerSRS>WGS84</LayerSRS><GeometryField encoding="WKT" field="CellLocation" /><Field name="rncid" src="ParentRnc"/><Field name="mnc"/><Field name="CellBoundary" src="CellLocation"/><Field name="mcc"/><Field name="cellid"/><Field name="cellname"/></OGRVRTLayer></OGRVRTDataSource>" > "$CELLS_VRT"



		"$OGR2OGR" -f "PostgreSQL" PG:"host=$POSTGIS_HOST port=$POSTGIS_PORT user=postgres dbname=$RNC_CELL_DATASTORE" $CELLS_VRT -nln $CELLS_TABLENAME -append

fi



}



function uploadRncids {

if [ -f "$1" ]

then

echo "Uploading rncids..."

		LAYER_NAME="${1##*/}" 

		LAYER_NAME="${LAYER_NAME%.*}"



		echo "Uploading Rncids $LAYER_NAME"



		echo "<OGRVRTDataSource><OGRVRTLayer name="$LAYER_NAME"><SrcDataSource>"$1"</SrcDataSource><GeometryType>wkbPoint</GeometryType><LayerSRS>WGS84</LayerSRS><GeometryField encoding="WKT" field="Location"/><Field name="geometrywkt" src="Location"/><Field name="rncid"/><Field name="mnc"/><Field name="mcc"/></OGRVRTLayer></OGRVRTDataSource>" > $RNCIDS_VRT



		"$OGR2OGR" -f "PostgreSQL" PG:"host=$POSTGIS_HOST port=$POSTGIS_PORT user=postgres dbname=$RNC_CELL_DATASTORE" $RNCIDS_VRT -nln $RNCIDS_TABLENAME -append 

fi



}



CELLS_VRT="$TEMP_DIR"/cells.vrt

RNCIDS_FILEPATH="$TEMP_DIR"/rncids_wkt.csv

RNCIDS_VRT="$TEMP_DIR"/rncids.vrt

touch "$RNCIDS_FILEPATH"

chmod 666 "$RNCIDS_FILEPATH"



uploadCells "$1"

uploadRncids "$2"

updateRncidsLocation "$2"

