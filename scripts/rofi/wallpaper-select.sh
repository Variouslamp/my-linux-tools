#!/usr/bin/env bash

carpeta="~/wallpapers/"
selected=$(ls ~/wallpapers/ | rofi -dmenu -p "elije")
awww img ~/wallpapers/"$selected" --transition-type center --transition-duration 2
