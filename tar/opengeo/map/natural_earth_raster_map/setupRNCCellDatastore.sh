#!/bin/bash

#----------------------------------
# Do NOT Modify These Variables
#----------------------------------

NATIVECRS="<nativeCRS>GEOGCS[&quot;WGS 84&quot;, \
	DATUM[&quot;World Geodetic System 1984&quot;, \
    SPHEROID[&quot;WGS 84&quot;, 6378137.0, 298.257223563, AUTHORITY[&quot;EPSG&quot;,&quot;7030&quot;]], \
    AUTHORITY[&quot;EPSG&quot;,&quot;6326&quot;]], \
  PRIMEM[&quot;Greenwich&quot;, 0.0, AUTHORITY[&quot;EPSG&quot;,&quot;8901&quot;]], \
  UNIT[&quot;degree&quot;, 0.017453292519943295], \
  AXIS[&quot;Geodetic longitude&quot;, EAST], \
  AXIS[&quot;Geodetic latitude&quot;, NORTH], \
  AUTHORITY[&quot;EPSG&quot;,&quot;4326&quot;]]</nativeCRS>"
  
WORKDIR=`dirname "$0"`
#CURL="curl"

#----------------------------------
# Import properties file
#----------------------------------

. $1

#----------------------------------
# Test if curl is on the system
#----------------------------------
hash $CURL 2>&- || { 
	echo "Didn't find built-in curl, using custom java curl script"
	CURL="java -jar ./jcurl.jar"	#use the curl jar in folder
}


#----------------------------------
# Expose PostGIS Store
#----------------------------------
echo "Creating PostGIS Store $RNC_CELL_DATASTORE"

XML="<dataStore><name>$RNC_CELL_DATASTORE</name><type>PostGIS</type><enabled>true</enabled><workspace><name>$WORKSPACE</name></workspace><connectionParameters><entry key=\"Connection timeout\">20</entry><entry key=\"port\">$POSTGIS_PORT</entry><entry key=\"passwd\">$POSTGIS_PASSWD</entry><entry key=\"dbtype\">postgis</entry><entry key=\"host\">$POSTGIS_HOST</entry><entry key=\"validate connections\">false</entry><entry key=\"max connections\">100</entry><entry key=\"database\">$RNC_CELL_DATASTORE</entry><entry key=\"namespace\">$WORKSPACE</entry><entry key=\"schema\">public</entry><entry key=\"Loose bbox\">true</entry><entry key=\"Expose primary keys\">false</entry><entry key=\"fetch size\">1000</entry><entry key=\"Max open prepared statements\">50</entry><entry key=\"preparedStatements\">false</entry><entry key=\"Estimated extends\">true</entry><entry key=\"user\">$POSTGIS_USER</entry><entry key=\"min connections\">10</entry></connectionParameters></dataStore>"
$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/datastores

#----------------------------------
# Create Rnc cell Layers
#----------------------------------
echo "Creating Layer RNC"

XML="<featureType><name>$POSTGIS_RNC_TABLE</name><nativeName>$POSTGIS_RNC_TABLE</nativeName><namespace><name>$WORKSPACE</name></namespace><title>$POSTGIS_RNC_TABLE</title>$NATIVECRS<srs>EPSG:4326</srs><nativeBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></nativeBoundingBox><latLonBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></latLonBoundingBox><projectionPolicy>FORCE_DECLARED</projectionPolicy><enabled>true</enabled></featureType>"
$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/datastores/$RNC_CELL_DATASTORE/featuretypes

echo "Creating Layer CELL"

XML="<featureType><name>$POSTGIS_CELL_TABLE</name><nativeName>$POSTGIS_CELL_TABLE</nativeName><namespace><name>$WORKSPACE</name></namespace><title>$POSTGIS_CELL_TABLE</title>$NATIVECRS<srs>EPSG:4326</srs><nativeBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></nativeBoundingBox><latLonBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></latLonBoundingBox><projectionPolicy>FORCE_DECLARED</projectionPolicy><enabled>true</enabled></featureType>"
$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/datastores/$RNC_CELL_DATASTORE/featuretypes
