#!/usr/bin/env bash

lista=$(ls ~/.var/app/app.zen_browser.zen/cache/zen/)

lista_rofi=""

for perfil in $lista; do
    nombre=$(echo "$perfil" | cut -d'.' -f2)
    lista_rofi+="$nombre\n"
done

eleccion=$(printf $lista_rofi | rofi -dmenu -p "Seleccion de perfil")

if [[ -n "$eleccion" ]]; then
    flatpak run app.zen_browser.zen -P $eleccion
fi

