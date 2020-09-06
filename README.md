# Gif Sparkle Dust

Gif Sparkle Dust is a collection of simple scripts for overlaying many copies of gifs onto an image. It's inspired by the confetti that would rain down on early 90s websites.

The scripts works placing gifs onto a random position on the input image and then doing that repeatedly. For this reason the script is quite slow.

`sparkle.sh` uses just one gif as the give to overlay.

`sparkle_sparkle.sh` picks a random gif from a directory of gifs. ImageMagick can't combine animations of different lengths ([see here](http://www.imagemagick.org/Usage/anim_mods/#merge)) and so, depending on the lenght of the first gif in the loop, you may find that your input gifs get cut off early or the play once and then disappear.

![example image](https://i.imgur.com/HxfGeDp.jpg) ![example image](https://media.giphy.com/media/Yo1zkCwLpCFY4EPeE2/giphy.gif) ![example image](https://media.giphy.com/media/lS1UAitXIzMwJarIM6/giphy.gif)

## Dependencies
ImageMagick (version 6 used, not tested on 7)

# Usage
`/sparkle.sh inputimage inputgif 10`

Replace inputimage with your input image and replace inputgif with a gif of your choice. Using 10 will overlay 10 copies of gif onto the image. The file will be saved in the directory containing the script
