#!/bin/bash

#tiles a gif and then overlays it over a static image. Only tested with jpgs and pngs

#usage: ./sparkle.sh sparklegif.gif /directory/of/images/ (use the full location path)

sparklegif=$1
imagedirectory=$2

#create a large tile of the looping gif. It needs to be larger than the input static image, so "-scale" the $sparklegif if necessary or change the viewport value
convert $sparklegif -coalesce -virtual-pixel tile -set option:distort:viewport 1000x1000 -distort SRT 0 sparklegif_temp.gif

for image in "$imagedirectory"*.jpg
do
	#get path of file
	path=$( readlink -f "$( dirname "$image" )" )

	#get filename minus extension
	file=$(basename "$image")
	filename="${file%.*}"

	#get extension
	extension="${image##*.}"

	convert "$image" null: sparklegif_temp.gif -layers Composite "$path"/"$filename"_sparkle.gif

done

rm sparklegif_temp.gif
