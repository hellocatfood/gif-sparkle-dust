#!/bin/bash

# overlays a gif X number of times onto a an image
# usage: ./sparkle.sh inputimage inputgif 10
# this would take an input image and overlay 10 copies of gif and otput
# the result as inputimage_sparkle.gif

#usage: ./sparkle.sh sparklegif.gif /directory/of/images/ (use the full location path)

# get width and height of the input image
width=`convert $1 -coalesce -flatten -format "%[fx:w]" info:`
height=`convert $1 -coalesce -flatten -format "%[fx:h]" info:`

inputfile=$(basename -- "$1")

# copy the file to avoid overwriting/corrupting the original
convert $1 ${inputfile%.*}_sparkle.miff

loop=1

while [ $loop -le $3 ] 
	do echo "loop $loop of $3"
	convert ${inputfile%.*}_sparkle.miff \
	null: \
	-gravity NorthWest \
	-geometry +"$(( $RANDOM % $width ))"+"$(( $RANDOM % $height ))" \
	$2 -compose over \
	-layers composite ${inputfile%.*}_sparkle.miff \

loop=$((loop +1))

done

# save the final version of the file
convert ${inputfile%.*}_sparkle.miff ${inputfile%.*}_sparkle.gif

# clean up temporary files
rm ${inputfile%.*}_sparkle.miff
