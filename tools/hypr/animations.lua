-- --- ANIMACIONES ---

hl.config({
    animations = {
        enabled = true,
    },
})

--------------------------------------------------------------------------

-- Definicion de curva de movimiento de el cambio de espacios de trabajo 
hl.curve("workspace_movement", { 
    type = "bezier", 
    points = { {0 ,1.48 } ,{ 0.94, 1} }
})

-- Definicion de la animacion que contiene la curva de movimiento y la aplica
-- al cambio de los espacios de trabajo
hl.animation({
    leaf = "workspaces",            -- El movimiento al que se lo aplicas
    enabled = true,                 -- Activa la animación (true/false)
    speed = 5,                      -- Duración en decisegundos (6 = 600ms)
    bezier = "workspace_movement",  -- El nombre exacto de la curva que creaste arriba
    style = "slide"                 -- Estilo visual (slide, slidefade, etc.)
})

--------------------------------------------------------------------------
-- Definicion del comportamiento de las ventanas

hl.curve("spring_open", {type="spring",mass=1,stiffness=150,dampening=18}) 

hl.animation({
    leaf = "windows",              
    enabled = true,                 
    speed = 10,                      
    spring = "spring_open",         
    style = "popin"                 
})



--------------------------------------------------------------------------
hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 10,
        border_size = 0,
        layout = "dwindle",
    },
})

hl.config({
    decoration = {
        rounding = 10, -- Redondeado de bordes
        -- Configuracion de transparencias
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            new_optimizations = true,
        },
        shadow = {
            enabled = true,
        },
    },
})


