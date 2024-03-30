---@diagnostic disable: undefined-global
local composer = require("composer")
local relayaout = require("librerias.relayout")

local w, h, cx, cy = relayaout._W, relayaout._H, relayaout._CX, relayaout._CY

--Escena 
local scene = composer.newScene()

--Grupos
local grpPartida
local grpJugador1
local grpJugador2
local grpJugador3
local grpJugador4

--Objetos
local turno = true
local usuario1_text
local usuario2_text
local usuario3_text
local usuario4_text

local jugador1
local jugador2
local jugador3
local jugador4

local dado1
local dado2
local boton




-- Funciones
local function actualizaDado() --Función para cambiar la imagen de los dados
    local dice1 = math.random(6)
    local dice2 = math.random(6)
    if turno == true then
        turno = false
        if dice1 == 1 then
            dado1.fill = { type="image", filename="Imagenes/dado1.png" }
        elseif dice1 == 2 then
            dado1.fill = { type="image", filename="Imagenes/dado2.png" }
        elseif dice1 == 3 then
            dado1.fill = { type="image", filename="Imagenes/dado3.png" }
        elseif dice1 == 4 then
            dado1.fill = { type="image", filename="Imagenes/dado4.png" }
        elseif dice1 == 5 then
            dado1.fill = { type="image", filename="Imagenes/dado5.png" }
        elseif dice1 == 6 then
            dado1.fill = { type="image", filename="Imagenes/dado6.png" }    
        end
    
        if dice2 == 1 then
            dado2.fill = { type="image", filename="Imagenes/dado1.png" }
        elseif dice2 == 2 then
            dado2.fill = { type="image", filename="Imagenes/dado2.png" }
        elseif dice2 == 3 then
            dado2.fill = { type="image", filename="Imagenes/dado3.png" }
        elseif dice2 == 4 then
            dado2.fill = { type="image", filename="Imagenes/dado4.png" }
        elseif dice2 == 5 then
            dado2.fill = { type="image", filename="Imagenes/dado5.png" }
        elseif dice2 == 6 then
            dado2.fill = { type="image", filename="Imagenes/dado6.png" }    
        end
    end
end



local function pasarTurno() --Función para pasar el Turno al siguiente jugador. 
    turno = true
    grpPartida.isVisible = false
end

Jugador = {
    nombre = "",
    puntos = 0,
    cartas = 0,
    casasD = 4,
    ciudadesD = 5, 
    caminosD = 15, 
    casasC = 0
}

Jugador.__index = Jugador

function Jugador:nuevo(nombre)
    local nuevo_jugador = {}
    setmetatable(nuevo_jugador,self)
    self.__index = self
    nuevo_jugador.nombre = nombre
    return nuevo_jugador
end   




--Eventos de la escena
function scene:create(event)

    --Agregar grupo de imagenes
    grpPartida = display.newGroup()
    self.view:insert(grpPartida)
    grpJugador1 = display.newGroup()
    grpPartida:insert(grpJugador1)
    grpJugador2 = display.newGroup()
    grpPartida:insert(grpJugador2)
    grpJugador3 = display.newGroup()
    grpPartida:insert(grpJugador3)
    grpJugador4 = display.newGroup()
    grpPartida:insert(grpJugador4)

    local background = display.newImageRect(grpPartida,"Imagenes/fondoH.png", 2800, 1200 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    --Tablero
    local tablero = display.newImageRect(grpPartida, "Imagenes/tablero2.png", 1209, 726)
    tablero.x = display.contentCenterX -100
    tablero.y = display.contentCenterY-70
        --Hexagonos
    local hexagono1 = display.newImageRect(grpPartida,"Imagenes/hexagonos/12.png", 135, 185)
    hexagono1.x = display.contentCenterX + 7 
    hexagono1.y = display.contentCenterY - 70

    local hexagono2 = display.newImageRect(grpPartida,"Imagenes/hexagonos/13.png", 135, 185)
    hexagono2.x = display.contentCenterX + 137
    hexagono2.y = display.contentCenterY - 70

    local hexagono3 = display.newImageRect(grpPartida,"Imagenes/hexagonos/14.png", 135, 185)
    hexagono3.x = display.contentCenterX - 125
    hexagono3.y = display.contentCenterY - 70

    local hexagono4 = display.newImageRect(grpPartida,"Imagenes/hexagonos/15.png", 135, 185)
    hexagono4.x = display.contentCenterX - 260
    hexagono4.y = display.contentCenterY - 70

    local hexagono5 = display.newImageRect(grpPartida,"Imagenes/hexagonos/16.png", 135, 185)
    hexagono5.x = display.contentCenterX - 385
    hexagono5.y = display.contentCenterY - 70
    
    local hexagono6 = display.newImageRect(grpPartida,"Imagenes/hexagonos/13.png", 135, 185)
    hexagono6.x = display.contentCenterX - 320
    hexagono6.y = display.contentCenterY - 182
    
    local hexagono7 = display.newImageRect(grpPartida,"Imagenes/hexagonos/12.png", 135, 185)
    hexagono7.x = display.contentCenterX - 190
    hexagono7.y = display.contentCenterY - 182
    
    local hexagono8 = display.newImageRect(grpPartida,"Imagenes/hexagonos/14.png", 135, 185)
    hexagono8.x = display.contentCenterX - 60
    hexagono8.y = display.contentCenterY - 182
    
    local hexagono9 = display.newImageRect(grpPartida,"Imagenes/hexagonos/15.png", 135, 185)
    hexagono9.x = display.contentCenterX + 65
    hexagono9.y = display.contentCenterY - 182
    
    local hexagono10 = display.newImageRect(grpPartida,"Imagenes/hexagonos/16.png", 135, 185)
    hexagono10.x = display.contentCenterX - 255
    hexagono10.y = display.contentCenterY - 295

    local hexagono11 = display.newImageRect(grpPartida,"Imagenes/hexagonos/12.png", 135, 185)
    hexagono11.x = display.contentCenterX - 125
    hexagono11.y = display.contentCenterY - 295

    local hexagono12 = display.newImageRect(grpPartida,"Imagenes/hexagonos/13.png", 135, 185)
    hexagono12.x = display.contentCenterX + 5
    hexagono12.y = display.contentCenterY - 295

    local hexagono13 = display.newImageRect(grpPartida,"Imagenes/hexagonos/14.png", 135, 185)
    hexagono13.x = display.contentCenterX + 70
    hexagono13.y = display.contentCenterY + 45

    local hexagono13 = display.newImageRect(grpPartida,"Imagenes/hexagonos/14.png", 135, 185)
    hexagono13.x = display.contentCenterX + 70
    hexagono13.y = display.contentCenterY + 45

    local hexagono14 = display.newImageRect(grpPartida,"Imagenes/hexagonos/15.png", 135, 185)
    hexagono14.x = display.contentCenterX - 60
    hexagono14.y = display.contentCenterY + 45

    local hexagono15 = display.newImageRect(grpPartida,"Imagenes/hexagonos/16.png", 135, 185)
    hexagono15.x = display.contentCenterX - 190
    hexagono15.y = display.contentCenterY + 45

    local hexagono16 = display.newImageRect(grpPartida,"Imagenes/hexagonos/12.png", 135, 185)
    hexagono16.x = display.contentCenterX - 320
    hexagono16.y = display.contentCenterY + 45
    
    local hexagono17 = display.newImageRect(grpPartida,"Imagenes/hexagonos/13.png", 135, 185)
    hexagono17.x = display.contentCenterX - 255
    hexagono17.y = display.contentCenterY + 160

    local hexagono18 = display.newImageRect(grpPartida,"Imagenes/hexagonos/14.png", 135, 185)
    hexagono18.x = display.contentCenterX - 125
    hexagono18.y = display.contentCenterY + 160

    local hexagono19 = display.newImageRect(grpPartida,"Imagenes/hexagonos/15.png", 135, 185)
    hexagono19.x = display.contentCenterX + 5
    hexagono19.y = display.contentCenterY + 160


















    local numero = display.newImageRect(grpPartida,"Imagenes/hexagonos/18.png", 50, 100)
    numero.x = display.contentCenterX + 7 
    numero.y = display.contentCenterY - 35

    





        --Barcos
    local barco = display.newImageRect(grpPartida,"Imagenes/barco1.png", 200, 120)
    barco.x = display.contentCenterX -70
    barco.y = 100
    
    local barco2 = display.newImageRect(grpPartida,"Imagenes/barco2.png", 200, 120)
    barco2.x = display.contentCenterX -350
    barco2.y = 100
    
    local barco3 = display.newImageRect(grpPartida,"Imagenes/barco3.png", 200, 120)
    barco3.x = display.contentCenterX - 490
    barco3.y = display.contentCenterY + 50
    
    local barco4 = display.newImageRect(grpPartida,"Imagenes/barco4.png", 200, 120)
    barco4.x = display.contentCenterX - 490
    barco4.y = display.contentCenterY - 200
    
    local barco5 = display.newImageRect(grpPartida,"Imagenes/barco5.png", 200, 120)
    barco5.x = display.contentCenterX + 220
    barco5.y = display.contentCenterY - 310
    
    local barco6 = display.newImageRect(grpPartida,"Imagenes/barco6.png", 200, 120)
    barco6.x = display.contentCenterX + 200
    barco6.y = display.contentCenterY + 150
    
    local barco7 = display.newImageRect(grpPartida,"Imagenes/barco6.png", 200, 120)
    barco7.x = display.contentCenterX - 50
    barco7.y = display.contentCenterY + 300
    --Jugadores
    local usuario = display.newImageRect(grpPartida,"Imagenes/usuario.png", 150, 150)
    usuario.x = display.contentWidth-350 
    usuario.y = display.contentHeight-750

    local usuario2 = display.newImageRect(grpPartida,"Imagenes/usuario.png", 150, 150)
    usuario2.x = display.contentWidth-150
    usuario2.y = display.contentHeight-750

    local usuario3 = display.newImageRect(grpPartida,"Imagenes/usuario.png", 150, 150)
    usuario3.x = display.contentWidth-350 
    usuario3.y = display.contentHeight-1000

    local usuario4 = display.newImageRect(grpPartida,"Imagenes/usuario.png", 150, 150)
    usuario4.x = display.contentWidth-150
    usuario4.y = display.contentHeight-1000

    
    jugador1 = Jugador:nuevo("Evan")
    usuario1_text = display.newText(grpPartida,jugador1.nombre, display.contentWidth -150, display.contentHeight-880, native.systemFont, 50 )
    usuario1_text:setFillColor(0,0,0);

    jugador2 = Jugador:nuevo("Omar")
    usuario2_text = display.newText(grpPartida,jugador2.nombre, display.contentWidth - 350 , display.contentHeight-880, native.systemFont, 50 )
    usuario2_text:setFillColor(0,0,0);

    jugador3 = Jugador:nuevo("Sebas")
    usuario3_text = display.newText(grpPartida,jugador3.nombre, display.contentWidth - 350, display.contentHeight-640, native.systemFont, 50 )
    usuario3_text:setFillColor(0,0,0);

    jugador4 = Jugador:nuevo("Bolillo")
    usuario4_text = display.newText(grpPartida,jugador4.nombre, display.contentWidth -150, display.contentHeight-640, native.systemFont, 50 )
    usuario4_text:setFillColor(0,0,0);

    --Banco
    local cartasEspeciales = display.newImageRect(grpPartida,"Imagenes/tcartas.png", 100, 140)
    cartasEspeciales.x = display.contentWidth - 650
    cartasEspeciales.y = display.contentHeight- 90

    local arbolBank = display.newImageRect(grpPartida,"Imagenes/arbol.png", 100, 140)
    arbolBank.x = display.contentWidth - 540
    arbolBank.y = display.contentHeight-90

    local ladrilloBank = display.newImageRect(grpPartida,"Imagenes/ladrillo.png", 100, 140)
    ladrilloBank.x = display.contentWidth - 430
    ladrilloBank.y = display.contentHeight- 90

    local trigoBank = display.newImageRect(grpPartida,"Imagenes/trigo.png", 100, 140)
    trigoBank.x = display.contentWidth - 320
    trigoBank.y = display.contentHeight- 90

    local vacaBank = display.newImageRect(grpPartida,"Imagenes/vaca.png", 100, 140)
    vacaBank.x = display.contentWidth - 210 
    vacaBank.y = display.contentHeight- 90

    local rocaBank = display.newImageRect(grpPartida,"Imagenes/roca.png", 100, 140)
    rocaBank.x = display.contentWidth -100
    rocaBank.y = display.contentHeight- 90

    --Dados
    dado1 = display.newImageRect(grpPartida,"Imagenes/dado1.png", 200, 200)
    dado1.x = display.contentWidth -350
    dado1.y = display.contentHeight- 300

    dado2 = display.newImageRect(grpPartida,"Imagenes/dado2.png", 200, 200)
    dado2.x = display.contentWidth- 150
    dado2.y = display.contentHeight- 300

    --Avanzar
    boton = display.newImageRect(grpPartida,"Imagenes/avanzar.png", 100, 100)
    boton.x =  display.contentWidth -100
    boton.y = display.contentHeight-500

    boton:addEventListener("tap", pasarTurno) --Se le agrega el evento al objeto para pasar Turno
    dado1:addEventListener("tap", actualizaDado) --Se le agrega el evento a los dados para que puedan lanzarse
    dado2:addEventListener("tap", actualizaDado)

end

function scene:show(event)
    if(event.phase == "will") then
    elseif (event.phase == "did") then
    end
end


function scene:hide(event)
    if(event.phase == "will") then
    elseif (event.phase == "did") then
    end
end

function scene:destroy(event)
    if(event.phase == "will") then
    elseif (event.phase == "did") then
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)



return scene