local notificationarea = createColSphere ( 1128.609375, -1107.3017578125, 19.301149368286, 10, 1158)
setElementDimension(notificationarea , 0 )
setElementInterior(notificationarea , 0 )

local plr = {}

function pdnotification(thePlayer, commandName, ...)
local sno = getPlayerSerial(thePlayer)
	
	if plr[sno] and plr[sno] + 60*60*1000 > getTickCount() then
		return
	end
	if (isElementWithinColShape(thePlayer, notificationarea)) then
        local logged = getElementData(thePlayer, "loggedin")
		outputChatBox("[!]#ffffff Polislere ihbar gitti.",thePlayer, 0, 0, 0, true)
		for k, v in ipairs(getPlayersInTeam(getTeamFromName ("Istanbul Emniyet Mudurlugu"))) do
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		outputChatBox("[SOYGUN]#ffffff BANKADA SOYGUN VAR HEMEN OLAY YERİNE İNTİKAL ET!", v, 50, 125, 200, true)
		plr[sno] = getTickCount()
      end
   end
end
addCommandHandler("kasayipatlat", pdnotification, false, false)