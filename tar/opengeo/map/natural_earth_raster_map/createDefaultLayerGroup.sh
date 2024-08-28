#!/bin/bash

#-------------------------------------------------------------------------------
# - Creates store for region
# - Creates the necessary layers for region
# - Creates a new layer group with NaturalEarth + Shoreline layers
# - Alternatively, can add new layers to an existing layer group
#-------------------------------------------------------------------------------

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
# Create the Layer Group
#----------------------------------
if [ $CREATE_NEW_LAYERGROUP == "true" ]; then 
	echo "Creating LayerGroup $LAYER_GROUP_NAME"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "<layerGroup><name>$LAYER_GROUP_NAME</name><layers><layer>$WORKSPACE:NaturalEarth</layer><layer>$WORKSPACE:shoreline</layer></layers><styles><defaultStyle><name>NaturalEarthFadeRasterStyle</name></defaultStyle><defaultStyle><name>ericsson_GoogleMercatorShoreline</name></defaultStyle></styles><bounds><minx>$MIN_X</minx><maxx>$MAX_X</maxx><miny>$MIN_Y</miny><maxy>$MAX_Y</maxy><crs>EPSG:4326</crs></bounds></layerGroup>" $SERVER_DIR/layergroups	
fi



