#!/usr/bin/env bash

carpeta="~/wallpapers/"
selected=$(ls ~/wallpapers/ | rofi -dmenu -p "elije")
awww img ~/wallpapers/"$selected" --transition-type center --transition-duration 2

~/my-tools/scripts/sistema/wallpaper/set_hyprlock_wallpaper_name.sh ~/wallpapers/"$selected"

