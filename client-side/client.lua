-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("irl_fastCDS",cnVRP)
vSERVER = Tunnel.getInterface("irl_fastCDS")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local service = false

-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.toggleService()
    if vSERVER.checkPermission() then
        if not service then
            startThread()
            service = true
            TriggerEvent("Notify","amarelo","A coleta de <b>CDS</b> foi iniciada.",5000)
        else
            service = false
            TriggerEvent("Notify","amarelo","A coleta de <b>CDS</b> foi finalizada.",5000)
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADS ------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function startThread()
    if threadOn then
        return
    else
        Citizen.CreateThread(function()
            while true do
                local timeDistance = 1000
                if service then
                    timeDistance = 5
                    if IsControlJustPressed(1,38) then             
                         TriggerServerEvent("sendCDS")
                    end

                    if IsControlJustPressed(1,47) then             
                        TriggerServerEvent("toogleModel")
                   end
                end
                Citizen.Wait(timeDistance)
            end
        end)
    end
end