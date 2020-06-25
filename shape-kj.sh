#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Monoline style"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    sed -i -e 's/#7c9fcf/#b4b4b6/g' "$i" #
    sed -i -e 's/#7c9ece/#9c9ca1/g' "$i"
    sed -i -e 's/#7b9dcf/#cdcdd1/g' "$i" #grey
    #convert "$i" -quality 75 "$i"
done
