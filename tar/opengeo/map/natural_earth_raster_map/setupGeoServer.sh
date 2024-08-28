#!/bin/bash

#-------------------------------------------------------------------------------
# - Copies over the raster
# - Copies over the SLD and images
# - Sets up GeoWebCache
# - Creates a Workspace
# - Creates styles
# - Creates NaturalEarth store + layer
# - Creates the shoreline store + layer
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
# Copy the SLDs and images and raster
#----------------------------------
if [ $UPLOADFILES == "true" ]; then 
	echo "Copying SLDs and images and raster..."
	cp -R $STYLES_DIR $GEOSERVER_DATA_DIR
	mkdir -p $GEOSERVER_DATA_DIR/data
	cp $NATURAL_EARTH $GEOSERVER_DATA_DIR/data/
fi
#----------------------------------
# Sort out GeoWebCache
#----------------------------------
if [ $SETUPCACHE == "true" ]; then 
	echo "Setting up GeoWebCache..."
	
	XML="<gwcQuotaConfiguration><enabled>true</enabled><diskBlockSize>4096</diskBlockSize><cacheCleanUpFrequency>10</cacheCleanUpFrequency><cacheCleanUpUnits>SECONDS</cacheCleanUpUnits><maxConcurrentCleanUps>2</maxConcurrentCleanUps><globalExpirationPolicyName>LFU</globalExpirationPolicyName><globalQuota><value>4</value><units>GiB</units></globalQuota><layerQuotas/></gwcQuotaConfiguration>"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPUT -H "Content-type: text/xml" -d "$XML" $CACHE_SERVER_DIR/diskquota.xml
fi

#----------------------------------
# Create the Workspace
#----------------------------------
if [ $CREATEWORKSPACE == "true" ]; then 
	echo "Creating workspace $WORKSPACE"
	XML="<workspace><name>$WORKSPACE</name></workspace>"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPUT -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/default
fi
#----------------------------------
# Create the Styles
#----------------------------------
function AddStyle
{
	echo "Creating Style $1"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H "Content-type: text/xml" -d "<style><name>$1</name><filename>$2</filename></style>" $SERVER_DIR/styles
}

if [ $CREATESTYLES == "true" ]; then 
	AddStyle "NaturalEarthFadeRasterStyle" "NaturalEarthFadeRasterStyle.sld"
	AddStyle "ericsson_GoogleMercatorShoreline" "ericsson_GoogleMercatorShoreline.sld"
	AddStyle "MapquestMapnikOSMLandmarkStyle" "MapquestMapnikOSMLandmarkStyle.sld"
	AddStyle "MapquestMapnikOSMBuildingStyle" "MapquestMapnikOSMBuildingStyle.sld"
	AddStyle "MapquestMapnikOSMCityStyle" "MapquestMapnikOSMCityStyle.sld"
	AddStyle "MapquestMapnikOSMCountryCountyBoundariesStyle" "MapquestMapnikOSMCountryCountyBoundariesStyle.sld"
	AddStyle "MapquestMapnikOSMDirectionArrowStyle" "MapquestMapnikOSMDirectionArrowStyle.sld"
	AddStyle "MapquestMapnikOSMPedestrianWalkwaysAlleysStyle" "MapquestMapnikOSMPedestrianWalkwaysAlleysStyle.sld"
	AddStyle "MapquestMapnikOSMRailStyle" "MapquestMapnikOSMRailStyle.sld"
	AddStyle "MapquestMapnikOSMOriginalRoadStyle" "MapquestMapnikOSMOriginalRoadStyle.sld"
	AddStyle "MapquestMapnikOSMWaterAreaStyle" "MapquestMapnikOSMWaterAreaStyle.sld"
	AddStyle "MapquestMapnikOSMOriginalWaterlineStyle" "MapquestMapnikOSMOriginalWaterlineStyle.sld"
fi

#----------------------------------
# Handle NaturalEarth Store
#----------------------------------
if [ $CREATENATURALEARTHSTORE == "true" ]; then 
	#----------------------------------
	# Expose NaturalEarth Store
	#----------------------------------
	echo "Creating Store NaturalEarth"
	NATURAL_EARTH_FILE=$(basename $NATURAL_EARTH)
        XML="<coverageStore><name>NaturalEarth</name><type>GeoTIFF</type><enabled>true</enabled><workspace><name>$WORKSPACE</name></workspace><url>file:data/$NATURAL_EARTH_FILE</url></coverageStore>"

	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/coveragestores

	#----------------------------------
	# Create NaturalEarth Layer
	#----------------------------------
	echo "Creating Layer NaturalEarth"

	XML="<coverage><name>NaturalEarth</name><nativeName>NaturalEarth</nativeName><namespace><name>$WORKSPACE</name></namespace><title>NaturalEarth</title><keywords><string>WCS</string><string>GeoTIFF</string><string>NaturalEarth</string></keywords>$NATIVECRS<srs>EPSG:4326</srs><nativeBoundingBox><minx>-180.0</minx><maxx>180.0</maxx><miny>-90.0</miny><maxy>90.0</maxy><crs>EPSG:4326</crs></nativeBoundingBox><latLonBoundingBox><minx>-180.0</minx><maxx>180.0</maxx><miny>-90.0</miny><maxy>90.0</maxy><crs>EPSG:4326</crs></latLonBoundingBox><projectionPolicy>FORCE_DECLARED</projectionPolicy><enabled>true</enabled><nativeFormat>GeoTIFF</nativeFormat><grid dimension=\"2\"><range><low>0 0</low><high>21600 10800</high></range><transform><scaleX>0.01666666666667</scaleX><scaleY>-0.01666666666667</scaleY><shearX>0.0</shearX><shearY>0.0</shearY><translateX>-179.99166666666667</translateX><translateY>89.99166666666667</translateY></transform><crs>EPSG:4326</crs></grid><supportedFormats><string>GEOTIFF</string><string>GIF</string><string>PNG</string><string>JPEG</string><string>TIFF</string></supportedFormats><interpolationMethods><string>bilinear</string><string>bicubic</string></interpolationMethods><dimensions><coverageDimension><name>RED_BAND</name><description>GridSampleDimension[-Infinity,Infinity]</description></coverageDimension><coverageDimension><name>GREEN_BAND</name><description>GridSampleDimension[-Infinity,Infinity]</description></coverageDimension><coverageDimension><name>BLUE_BAND</name><description>GridSampleDimension[-Infinity,Infinity]</description></coverageDimension></dimensions><requestSRS><string>EPSG:4326</string></requestSRS><responseSRS><string>EPSG:4326</string></responseSRS></coverage>"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/coveragestores/NaturalEarth/coverages

	#----------------------------------
	# Apply NaturalEarth Style
	#----------------------------------
	echo "Applying Style to Layer NaturalEarth"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPUT -H 'Content-type: text/xml' -d '<layer><name>NaturalEarth</name><type>RASTER</type><defaultStyle><name>NaturalEarthFadeRasterStyle</name></defaultStyle><enabled>true</enabled></layer>' $SERVER_DIR/layers/$WORKSPACE:NaturalEarth

fi	

#----------------------------------
# Handle Shoreline Store
#----------------------------------
if [ $CREATESHORELINESTORE == "true" ]; then 
	#----------------------------------
	# Expose PostGIS Store
	#----------------------------------
	echo "Creating PostGIS Store $POSTGIS_SHORELINE_TABLE"

	XML="<dataStore><name>$POSTGIS_SHORELINE_TABLE</name><type>PostGIS</type><enabled>true</enabled><workspace><name>$WORKSPACE</name></workspace><connectionParameters><entry key=\"Connection timeout\">20</entry><entry key=\"port\">$POSTGIS_PORT</entry><entry key=\"passwd\">$POSTGIS_PASSWD</entry><entry key=\"dbtype\">postgis</entry><entry key=\"host\">$POSTGIS_HOST</entry><entry key=\"validate connections\">false</entry><entry key=\"max connections\">100</entry><entry key=\"database\">$DATASTORE</entry><entry key=\"namespace\">$WORKSPACE</entry><entry key=\"schema\">public</entry><entry key=\"Loose bbox\">true</entry><entry key=\"Expose primary keys\">false</entry><entry key=\"fetch size\">1000</entry><entry key=\"Max open prepared statements\">50</entry><entry key=\"preparedStatements\">false</entry><entry key=\"Estimated extends\">true</entry><entry key=\"user\">$POSTGIS_USER</entry><entry key=\"min connections\">10</entry></connectionParameters></dataStore>"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/datastores

	#----------------------------------
	# Create Shoreline Layer
	#----------------------------------
	echo "Creating Layer Shoreline"

	XML="<featureType><name>$POSTGIS_SHORELINE_TABLE</name><nativeName>$POSTGIS_SHORELINE_TABLE</nativeName><namespace><name>$WORKSPACE</name></namespace><title>$POSTGIS_SHORELINE_TABLE</title>$NATIVECRS<srs>EPSG:4326</srs><nativeBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></nativeBoundingBox><latLonBoundingBox><minx>-177.423</minx><maxx>179.101</maxx><miny>-85.051</miny><maxy>83.515</maxy><crs>EPSG:4326</crs></latLonBoundingBox><projectionPolicy>FORCE_DECLARED</projectionPolicy><enabled>true</enabled></featureType>"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPOST -H 'Content-type: text/xml' -d "$XML" $SERVER_DIR/workspaces/$WORKSPACE/datastores/$POSTGIS_SHORELINE_TABLE/featuretypes

	#----------------------------------
	# Apply Shoreline Style
	#----------------------------------
	echo "Applying Style to Layer shoreline"
	$CURL -u $GEOSERVER_USERNAME:$GEOSERVER_PASSWORD -XPUT -H 'Content-type: text/xml' -d '<layer><defaultStyle><name>ericsson_GoogleMercatorShoreline</name></defaultStyle><enabled>true</enabled></layer>' $SERVER_DIR/layers/$WORKSPACE:$POSTGIS_SHORELINE_TABLE

fi

