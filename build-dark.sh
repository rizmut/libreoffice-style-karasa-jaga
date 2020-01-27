#!/bin/bash
# 2019 by Rizal Muttaqin

#echo "=> Remove old PNG both light and dark version"
#cp "images_karasa_jaga/links.txt" \
   #"images_karasa_jaga_svg"
#rm -Rf "images_karasa_jaga"
#rm -Rf "images_karasa_jaga_dark"

#cp -Rf "images_karasa_jaga_svg" \
   #"images_karasa_jaga"
#rm "images_karasa_jaga_svg/links.txt"
#cd "images_karasa_jaga"   

#echo "=> Export light SVG to light PNG ..."
#find -name "*.svg" -o -name "*.SVG" | while read i;
#do 
	#echo "This $i file is compressed"
	#fname=$( basename "$i")
##	echo "has the name: $fname"
	#fdir=$( dirname "$i")
##	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	#optipng -o7 "${i%.*}.png"
	##convert "$i" -quality 75 "$i"
#done

#echo "=> Delete duplicate SVG files ..."
#find -name "*.svg" -o -name "*.SVG" | while read i;
#do
    #fname=$( basename "$i")
    #fdir=$( dirname "$i")
    #rm "$i"
#done

echo "=> Convert light PNG to dark PNG ..."

cp -Rf "images_karasa_jaga" \
   "images_karasa_jaga_dark"
cd "images_karasa_jaga_dark"

find -name "*.png" -o -name "*.PNG" | while read i;
do 
	echo "This $i file will be Dark Theme"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	convert "$i" -negate "$i"
	#convert "$i" -quality 75 "$i"
done
