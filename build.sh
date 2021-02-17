#!/bin/bash

SHA=f8948e68c3fff3831c7b8526902023a58ffc8121
SOURCES=./gargoyle-src

PADHDR_PATH=/usr/bin/uimage_padhdr

if [ ! -f $PADHDR_PATH ]; then
	echo "Copying padhdr executable..."
	sudo cp ./files/uimage_padhdr $PADHDR_PATH
	sudo chmod +x $PADHDR_PATH
else
	echo "Found padhdr in system"
fi


if [ -d $SOURCES ]; then
	echo "Deleting sources directory"
	rm -rf $SOURCES
fi

echo "Getting Gargoyle sources..."
mkdir $SOURCES
cd $SOURCES
git init
git remote add origin https://github.com/ericpaulbishop/gargoyle
git fetch origin $SHA
git reset --hard FETCH_HEAD

echo "Applying patches..."
git apply ../files/dir-2660.patch

echo "Starting the build process..."
make ramips.mt7621

if [ -d ./images/ramips/ ]; then
	cd ./images/ramips/
	if [ -f gargoyle_1.13.x-ramips-mt7621-dir-2660-a1-squashfs-factory.bin ]; then
		echo "Copying factory file..."
		cp gargoyle_1.13.x-ramips-mt7621-dir-2660-a1-squashfs-factory.bin ../../..
	else
		echo "Factory file does not exist, probably build process failed"
	fi

	if [ -f gargoyle_1.13.x-ramips-mt7621-dir-2660-a1-squashfs-sysupgrade.bin ]; then
                echo "Copying sysupgrade file..."
		cp gargoyle_1.13.x-ramips-mt7621-dir-2660-a1-squashfs-sysupgrade.bin ../../..
        else
                echo "Sysupgrade file does not exist, probably build process failed"
        fi
else
	echo "Bin directory does not exist, probably build process failed"
fi

