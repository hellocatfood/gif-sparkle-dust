# Gif Sparkle Dust

Gif Sparkle Dust is a simple script for overlaying many copies of a gif onto an image. It's inspired by the confetti that would rain down on early 90s websites.

The script works placing a gif onto a random position on the input image and then doing that repeatedly. For this reason the script is quite slow.

![example image](https://i.imgur.com/HxfGeDp.jpg) ![example image](https://media.giphy.com/media/Yo1zkCwLpCFY4EPeE2/giphy.gif)

## Dependencies
ImageMagick (version 6 used, not tested on 7)

# Usage
`/sparkle.sh inputimage inputgif 10`

Replace inputimage with your input image and replace inputgif with a gif of your choice. Using 10 will overlay 10 copies of gif onto the image. The file will be saved in the directory containing the script
