#!/usr/bin/env bash

# Seleccion del fondo de manera random
lista=(~/wallpapers/*)
numero=$((RANDOM % "${#lista[@]}"))
imagen_random="${lista[numero]}"

awww img "$imagen_random" --transition-type center --transition-duration 2

# Ingresar la direccion de la imagen de fondo para el bloqueo
~/my-tools/scripts/sistema/wallpaper/set_hyprlock_wallpaper_name.sh $imagen_random
