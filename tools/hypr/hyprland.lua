
require("animations") -- Importe de modulo especializado en animaciones

-- --- VARIABLES DE ENTORNO (NVIDIA & WAYLAND) ---

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", 1)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
-- --- MONITORES ---
-- Monitor Laptop (144Hz)
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
})
-- Monitor Externo (NVIDIA)
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@100",
    position = "-2560x0",
    scale    = 1,
})
-- -------Perilla de audio teclado ajazz ----

-- Control de Volumen con la Perilla (PipeWire / WirePlumber)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { locked = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- --- INPUT (TECLADO Y TOUCHPAD) ---

hl.config({
    input = {
        kb_layout = "latam",
        touchpad = {
            natural_scroll = false,
            tap_to_click = true,
            disable_while_typing = true,
        },
        sensitivity = 0,
    },
})

hl.device({
    name = "semico---usb-gaming-keyboard-",
    kb_layout = "us",
    kb_variant = "altgr-intl",
})

-- --- ESTÉTICA (GAPS Y BORDES) ---

local mainMod = "SUPER"

-- Mover y redimensionar ventanas con el mouse

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Atajos del sistema

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "E", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- Aplicaciones principales

hl.bind(mainMod .. " + " .. "A", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + " .. "Q", hl.dsp.exec_cmd("bash -c '~/my-tools/scripts/sistema/fterm' "))
hl.bind(mainMod .. " + " .. "T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(mainMod .. " + " .. "C", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "SPACE", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "W", hl.dsp.exec_cmd("~/my-tools/scripts/sistema/wallpaper/wallpaper_setter.sh auto"))
hl.bind(mainMod .. " + " .. "W", hl.dsp.exec_cmd("~/my-tools/scripts/sistema/wallpaper/wallpaper_setter.sh rofi"))
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "B", hl.dsp.exec_cmd("/home/various/my-tools/scripts/sistema/browser/zen_profile_select.sh"))
hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("~/my-tools/scripts/sistema/record"))
hl.bind(mainMod .. " + " .. "L", hl.dsp.exec_cmd("~/my-tools/scripts/sistema/wallpaper/lock-screen"))

-- Captura de pantalla

hl.bind(mainMod .. " + " .. "S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tee ~/Imagenes/ScreenShots/$(date +'%Y-%m-%d_%H%M%S').png | wl-copy"))

-- Control de brillo de la pantalla

hl.bind(mainMod .. " + " .. "F10", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind(mainMod .. " + " .. "F9", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- Navegación (Foco)

hl.bind(mainMod .. " + " .. "Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "Down", hl.dsp.focus({ direction = "down" }))

-- Mover ventanas de posición usando SUPER + SHIFT + Flechas
hl.bind(mainMod .. " + " .. "SHIFT" .. "+" .. "left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " +" .. "SHIFT" .. "+" .. " right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. "+" .. " up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. "+" .. "down",  hl.dsp.window.move({ direction = "down" }))

-- Workspaces (1-0)

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Mover a Workspaces

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Extras y Multimedia

hl.bind(mainMod .. " + " .. "N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "N", hl.dsp.exec_cmd("swaync-client -C"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "R", hl.dsp.exec_cmd("killall -SIGINT gpu-screen-recorder && notify-send \"Recording Stopped\""))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("amixer set Master toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer set Master 1%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer set Master 1%+"))

-- --- REGLAS DE VENTANA (WINDOW RULES) ---

-- Terminal flotante

hl.window_rule({
  name = "pavucontrol-flotante",
  match = { class = "float-term" },
  float = true,
  center = true,
  size = { 700, 400 }, -- Ancho y alto
})

-- Popups y Otros

hl.window_rule({
    name  = "match_title___popup-",
    match = {
        class = "float on",
    },
    -- TODO: review rule: "match:title ^(popup-.*)$"
})

hl.window_rule({
    name  = "match_title___popup-",
    match = {
        class = "center on",
    },
    -- TODO: review rule: "match:title ^(popup-.*)$"
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wal -R -n")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("rclone mount gdrive:~/Drive --vfs-cache-mode full")
    hl.exec_cmd("~/my-tools/scripts/sistema/wallpaper/lock-screen")
end)
