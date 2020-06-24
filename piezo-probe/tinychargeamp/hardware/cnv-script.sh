#!/bin/bash

grid() {
    # Args: X Y IN OUT
    X=$1
    Y=$2
    IN="$3"
    OUT="$4"
    convert +append $(yes "$IN" | head -n $X) TMP.png
    convert -append $(yes TMP.png | head -n $Y) "$OUT"
}

inkscape --export-type="png" -d 538 dev.svg 
inkscape --export-type="png" -d 538 prg.svg 

grid 4 3 dev.png devs.png
grid 3 1 prg.png prgs.png

convert -append devs.png prgs.png out.png
mogrify -rotate 90 out.png
convert out.png -gravity center -background white -extent 1440x2560 out2.png

PngToPhoton out2.png tinychargeamp.photon 500
