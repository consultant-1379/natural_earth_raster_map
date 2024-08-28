#!/bin/bash

GIT=/app/git/1.7.12.4/LMWP3/bin/git


if [ "$2" == "" ]; then
        echo usage: $0 \<Module\> \<Branch\> \<Workspace\>
        exit -1
else
        versionProperties=install/version.properties
        theDate=\#$(date +"%c")
        module=$1
        branch=$2
        workspace=$3
        pkgReleaseArea=/home/jkadm100/eniq_events_releases

fi

function getProductNumber {
        product=`cat $workspace/build.cfg | grep $module | grep $branch | awk -F " " '{print $3}'`
}


function setRstate {
        revision=`cat $workspace/build.cfg | grep $module | grep $branch | awk -F " " '{print $4}'`

        if $GIT tag | grep $product-$revision; then
                rstate=`$GIT tag | grep ${product}-${revision} | tail -1 | sed s/.*-// | perl -nle 'sub nxt{$_=shift;$l=length$_;sprintf"%0${l}d",++$_}print $1.nxt($2) if/^(.*?)(\d+$)/';`
        else
                ammendment_level=01
                rstate=$revision$ammendment_level
        fi
}


function cleanup {
  if [ -f $workspace/$pkgName ] ; then
    echo "removing $workspace/$pkgName"
    rm -rf $workspace/$pkgName
  fi
  if [ -f $workspace/tar ] ; then
    rm -rf $workspace/tar
  fi
}

function createTar {
    DestDir="tar/opengeo/map/natural_earth_raster_map"
    cd $workspace
    mkdir -p -m 775 $DestDir

    for f in $workspace/*
    do
      if [ "$f" != "$workspace/tar" ] ; then
        #echo "f=$f"
        echo ""
        echo "Trying to copy $f into $DestDir"
        cp -R $f $DestDir
      else
        echo "Skipping tar dir..."
      fi
    done

    rm $DestDir/git_deliver.sh
    rm $DestDir/git_build.sh
    rm $DestDir/exclude.txt
    rm $DestDir/build.cfg
    rm $DestDir/rstate.txt
    cd $workspace/tar
    #/proj/jkadm100/bin/lxbi rhel61 /bin/gtar -zvcf $workspace/$pkgName *
    tar -zvcf $workspace/$pkgName *
    if [ -f $workspace/$pkgName ]; then
        echo "Copying tar file into $pkgReleaseArea"
        cp $workspace/$pkgName $pkgReleaseArea
    else
        echo "$pkgName was not created successfully!"
        exit 0
    fi
 
}


getProductNumber
setRstate
pkgName="natural_earth_raster_map_${rstate}.tar.gz"
$GIT clean -df
$GIT checkout $branch
$GIT pull

echo "Creating tar file..."
createTar
cleanup

$GIT tag $product-$rstate
$GIT pull
$GIT push --tag origin $branch

touch $workspace/rstate.txt
echo $rstate >> $workspace/rstate.txt
