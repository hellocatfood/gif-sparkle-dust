#!/bin/bash

# overlays random gifs from a X number of times onto a an image
# usage: ./sparkle_sparkle.sh inputimage inputgif 10
# this would take an input image and overlay 10 copies of random gifs 
# and output the result as inputimage_sparkle_sparkle.gif

# get width and height of the input image
width=`convert $1 -coalesce -flatten -format "%[fx:w]" info:`
height=`convert $1 -coalesce -flatten -format "%[fx:h]" info:`

# change to point to a directory containing gifs
inputgifs=()

inputfile=$(basename -- "$1")

# copy the file to avoid overwriting/corrupting the original
convert $1 ${inputfile%.*}_sparkle.miff

loop=1

while [ $loop -le $2 ] 
	do echo "loop $loop of $2"
	inputgif=$(printf "%s\n" "${inputgifs[RANDOM % ${#inputgifs[@]}]}")
	convert ${inputfile%.*}_sparkle.miff \
	null: \
	-gravity NorthWest \
	-geometry +"$(( $RANDOM % $width ))"+"$(( $RANDOM % $height ))" \
	$inputgif -compose over \
	-layers composite ${inputfile%.*}_sparkle.miff \

loop=$((loop +1))

done

# save the final version of the file
convert ${inputfile%.*}_sparkle.miff ${inputfile%.*}_sparkle.gif

# clean up temporary files
rm ${inputfile%.*}_sparkle.miff
