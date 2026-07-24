#!/usr/bin/env bash

# Terminar instancias previas de la barra
killall -q polybar

# Esperar a que los procesos se hayan cerrado por completo
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar Polybar usando la configuración por defecto
polybar & disown


