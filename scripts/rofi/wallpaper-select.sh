#!/usr/bin/env bash

carpeta="~/wallpapers/"
selected=$(ls ~/wallpapers/ | rofi -dmenu -p "elije")
swww img ~/wallpapers/"$selected" --transition-type any --transition-duration 2
