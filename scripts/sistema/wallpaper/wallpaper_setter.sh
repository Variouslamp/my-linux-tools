#!/usr/bin/env bash

# Obtencion de argumento para funcionalidad de script
WAL_DIRECTORY="$HOME/wallpapers"
LIST=($(basename -a $WAL_DIRECTORY/*))

# IFs de los tipos de ejecucion que puede tener el script entre
# auto = eleccion automatica del fondo
# rofi = eleccion manual del fondo
if  [ -z "$1" ]; then
	echo "- El arguento ingresado no existe"
elif [ "$1" == "auto" ]; then
	NUMERO=$((RANDOM % "${#LIST[@]}"))
	SELECTED="${LIST[NUMERO]}"
elif [ "$1" == "rofi" ]; then
	SELECTED=$(ls $WAL_DIRECTORY | rofi -dmenu -p "select one")
	# Si el texto es escrito manualmente se almacena el fondo con dicho nombre
	MANUAL=$( echo "${LIST[@]}" | tr " " "\n" | grep -F "$SELECTED")
	
	# Condiciones que hacen que el programa no continue si hay errores
	if [ -z $SELECTED ]; then # verifica si se ingreso un valor vacio de manra manual
		exit 1 
	elif [ -z $MANUAL ]; then # verifica si un valor manual existe
		exit 1
	fi
fi


# Colocar el fondo segun la herramienta que se tenga instalada
# awww para wyland
# feh para x11 
if [ -n "$(command -v awww)" ]; then
	awww img "$WAL_DIRECTORY/$SELECTED" --transition-type center --transition-duration 2
elif [ -n "$(command -v feh)" ]; then
	feh --bg-fill "$WAL_DIRECTORY/$SELECTED"
fi


if [ -n "$(command -v hyprlock)" ]; then
	$HOME/my-tools/scripts/sistema/wallpaper/set_hyprlock_wallpaper_name.sh $WAL_DIRECTORY/$SELECTED
fi
