#!/bin/bash
set -e
inkscape --export-type="png" -d 538 file.svg 
convert file.png file.png file.png -append file2.png 
convert file2.png -gravity center -background white -extent 1440x2560 file3.png
