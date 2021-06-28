resourceRoot = getResourceRootElement(getThisResource())



local spamb = {}
local bTimers = {}
local antispamCooldown = 20000

yasaklilar = {
	"aim_weapon",
	"special_control_up",
	"special_control_down",
	"special_control_right",
	"special_control_left",
	"vehicle_mouse_look",
	"vehicle_look_behind",
	"vehicle_look_right",
	"vehicle_look_left",
	"handbrake",
	"sub_mission",
	"horn",
	"radio_user_track_skip",
	"radio_previous",
	"radio_next",
	"brake_reverse",
	"accelerate",
	"steer_back",
	"steer_forward",
	"vehicle_right",
	"vehicle_left",
	"vehicle_secondary_fire",
	"vehicle_fire",
	"walk",
	"action",
	"crouch",
	"look_behind",
	"sprint",
	"jump",
	"change_camera",
	"enter_exit",
	"zoom_out",
	"zoom_in",
	"right",
	"left",
	"backwards",
	"forwards",
	"previous_weapon",
	"next_weapon",
	"fire",
	"conversation_yes",
	"conversation_no",
	"group_control_forwards",
	"group_control_back",
	"enter_passenger",
	"screenshot",
	"radar -1",
	"radar",
	"radar_zoom_in",
	"radar_zoom_out",
	"radar_move_north",
	"radar_move_south",
	"radar_move_east",
	"radar_move_west",
	"radar_attach",
	"radar_opacity_down",
	"radar_opacity_up",
	"radar_help",
	"voiceptt 1",
	"voiceptt 0",
	"chatscrollup 1",
	"chatscrollup 0",
	"chatscrolldown -1",
	"chatscrolldown 0",
	"debugscrollup 1",
	"debugscrollup 0",
	"debugscrolldown -1",
	"debugscrolldown 0",
	"home",
	"togglecursor",
	"friends",
	"chatbox chatboxsay",
	"chatbox",
	"chatbox teamsay 255 0 0",	
	"voiceptt",
}
-- arası


-- arası
addEventHandler("onClientResourceStart",resourceRoot,function() -- script başlatıldığında
setElementData(getLocalPlayer(), "bindengel1", nil)
	addEventHandler("onClientKey", root,function(button, press)
	source = getLocalPlayer()
	if not source == getLocalPlayer() then
	return
	end
				if isChatBoxInputActive() then return end -- eğer chatte bişey yazıyosa geri dön
				if guiGetInputEnabled( ) then return end
	if getBoundKeys then
		local komut = bindleriCek(button)
		if not komut then
		if getElementData(getLocalPlayer(), "bindengel1") ~= 1 then
		spamb[getLocalPlayer()] = tonumber(spamb[getLocalPlayer()] or 0) + 1
		if spamb[getLocalPlayer()] == 30 then
			local playerName = getPlayerName( getLocalPlayer() ):gsub('_', ' ')
			outputChatBox(' Lütfen tuşlara bu kadar sık basma! Aksi halde komut kullanımın engellenecek.',255,0,0)
			--exports.global:sendMessageToAdmins("[ANTI-CMDSPAM] Detected Player '" .. playerName .. "' for possibly spamming "..tonumber(spam[source]).." commands / "..(antispamCooldown/1000).." seconds. ('/"..commandName.."').")
		elseif spamb[getLocalPlayer()] > 60 then
			local playerName = getPlayerName( getLocalPlayer() ):gsub('_', ' ')
			--exports.erp_global:sendMessageToAdmins("[ANTI-CMDSPAM] Player '" .. playerName .. "' ın komutları spam yapmaktan engellendi ")
			outputChatBox(' Komut kullanımın 20 saniye engellendi! Lütfen tuşlara bu kadar sık basma...',255,0,0)
			setElementData(getLocalPlayer(), "bindengel1", 1)
			spamb[getLocalPlayer()] = 0
		end
	
		if isTimer(bTimers[getLocalPlayer()]) then
			killTimer(bTimers[getLocalPlayer()])
		end
		
		bTimers[getLocalPlayer()] = setTimer(	function (source)
			spamb[source] = 0
			
			if isElement(source) and getElementData(source, "bindengel1") == 1 then
				setElementData(getLocalPlayer(), "bindengel1", nil)
			end
		end, antispamCooldown, 1, getLocalPlayer())
		-- outputServerLog('[CMD] '.. playerName ..' executed command /'.. commandName ..'')
		-- outputDebugString('[CMD] '.. playerName ..' executed command /'.. commandName ..'')
	else
		cancelEvent()
		--setElementData(getLocalPlayer(), "bindengel1", nil)
	end
	end
	--[[if getElementData(getLocalPlayer(), "bindengel") == 1 then
	
	cancelEvent()
	end ]]
	--outputChatBox('bind kullanımı bu sunucuda yasaktır!',255,0,0)
	--cancelEvent()
	--return
	end

	end)
end)

function bindleriCek(buton)
	for i,v in pairs(yasaklilar) do
		local butonlar = getBoundKeys ( v )
		if type(butonlar) ~= "boolean" and butonlar[buton] then
			return v
		end	
	end
	return false	
end	

function quitPlayer()
	spamb[source] = nil
end
addEventHandler("onPlayerQuit", root, quitPlayer)