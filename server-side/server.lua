-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("irl_fastCDS",cnVRP)
vCLIENT = Tunnel.getInterface("irl_fastCDS")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local choiceModel = 1
local msg = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fastCDS",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		vCLIENT.toggleService(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
		if vRP.hasPermission(user_id,Config.checkPermission) then
			return true
		end

		return false
	end 
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS ---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------]
RegisterNetEvent("sendCDS")
AddEventHandler("sendCDS",function()
    local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
		local x,y,z,h = vRPclient.getPositions(source)

		if choiceModel == 1 then
			msg = "```prolog\n "..x..","..y..","..z..","..h.."\r```"
		
		elseif choiceModel == 2 then
			msg = "```prolog\n['x'] = "..x..", ['y'] = "..y..", ['z'] = "..z..", ['h'] = "..h.."\r```"
		elseif choiseModel == 3 then
			msg = "```prolog\nx = "..x..", y = "..y..", z = "..z..", h = "..h.."\r```"
		end

		TriggerClientEvent("Notify",source,"amarelo","CDS enviada.",5000)
		SendWebhookMessage(Config.webhookCDS,msg)
    end	
end)

RegisterNetEvent("toogleModel")
AddEventHandler("toogleModel",function()
    local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
		if choiceModel == 3 then
			choiceModel = 1
			TriggerClientEvent("Notify",source,"amarelo","Modelo alterado.",5000)
		else 
			choiceModel = choiceModel + 1
		end
    end	
end)


