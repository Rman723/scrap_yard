local display = false

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

local v1 = vector3(-349.7724, -1569.834, 25.8) --Change this to where you want it
Citizen.CreateThread(
	function()
        while true do
			Citizen.Wait(0)
			local player = GetPlayerPed(-1)
			local where = GetEntityCoords(player)
			local distance_until_text_disappears = 10
			if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
				Draw3DText(v1.x, v1.y, v1.z, 1.0, "Talk to the scrap man")
				if IsControlJustPressed(1, 51) then
                    SetDisplay(not display)
				end
            end
		end
	end
)

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

--Battery
RegisterNUICallback("gi", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'battery',2,1,2,0,0,0,0)
    SetDisplay(false)
end)
--Engine
RegisterNUICallback("gi2", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'engine',0,0,0,2,1,1,2)
    SetDisplay(false)
end)
--Muffler
RegisterNUICallback("gi3", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'muffler',0,0,0,0,0,2,0)
    SetDisplay(false)
end)
--Water Pump
RegisterNUICallback("gi4", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'waterpump',0,0,1,3,5,2,1)
    SetDisplay(false)
end)
--Hood
RegisterNUICallback("gi5", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'hood',0,0,0,0,0,3,0)
    SetDisplay(false)
end)
--oil pump
RegisterNUICallback("gi6", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'oilpump',0,0,1,3,5,2,1)
    SetDisplay(false)
end)
--speakers
RegisterNUICallback("gi7", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'speakers',0,0,0,2,6,0,0)
    SetDisplay(false)
end)
--radio
RegisterNUICallback("gi8", function()
    TriggerServerEvent('esx:decraft', GetPlayerServerId(PlayerId()),'radio',0,0,0,3,6,0,0)
    SetDisplay(false)
end)
--------------
--SELL STUFF--
--------------
--sell rims
RegisterNUICallback("s1", function()
    local soldfor = math.random(90,200)
    TriggerServerEvent('esx:sell', GetPlayerServerId(PlayerId()),'rims',soldfor)
    SetDisplay(false)
end)

-------------
--FUNCTIONS--
-------------
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end


Citizen.CreateThread(function()
    local blip = AddBlipForCoord(v1)

    SetBlipSprite (blip,365)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 1.4)
    SetBlipColour (blip, 19)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Parts Scrapper')
    EndTextCommandSetBlipName(blip)

end)

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(2)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end