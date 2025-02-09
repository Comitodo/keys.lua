-- Configuración del script
local radius = 10 -- Radio de detección de las Keys
local speed = 5 -- Velocidad a la que se mueve el jugador hacia las Keys

-- Función para detectar las Keys cerca del jugador
local function detectKeys()
    local keys = {}
    for _, object in pairs(workspace:GetObjectsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, radius)) do
        if object.Name == "Key" then
            table.insert(keys, object)
        end
    end
    return keys
end

-- Función para detectar las puertas cerca del jugador
local function detectDoors()
    local doors = {}
    for _, object in pairs(workspace:GetObjectsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, radius)) do
        if object.Name == "Door" then
            table.insert(doors, object)
        end
    end
    return doors
end

-- Función para teletransportar al jugador hacia una Key o Door
local function teleportTo(object)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = object.CFrame + Vector3.new(0, 0, -5)
end

-- Bucle principal del script 
while true do
    
     -- Detecta Todas Las Llaves En Todo El Mapa    
     for _,key in pairs(detectKeys())do  
         print("Encontrada Llave "..key.Name.." Ahora Vamos por sus Puerta")
          -- Teleport To The KEYs---
         teleportTo(key) 
          wait(1)        
          -- Detecta Todas Las Puertas En Todo El Mapa    
         for _,door in pairs(detectDoors())do  
             print("Puerta encontrada procedemos A Desbloquearla ")
              -- Teleport To the DOOR of the KEYs---
             teleportTo(door) 
               wait(1)        
              -- Abrimos La PuerTa CON CUALQUIER LLAVE XDXDxdXDXdXdXdx         
             door:FindFirstChild("Open").Fire()            
               print("Puerta/s Desbloqueadas")            
           end   
       else      
           print("No hay mas Puertass Para esta LLAVE!") 
   end        
      wait(10)--Esperaar un poco ANtes DE REINICIAR EL PROCESO-----       
end  
