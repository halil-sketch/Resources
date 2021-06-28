-- Bu hud Haliliyy tarafından 9.04.2021 Tarihinde Oscuri Roleplay için yapılmıştır.

s, h = guiGetScreenSize()
font = exports.orp_fonts:getFont("halilfont", 14.5)
function dxDrawRoundedRectangle(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end
local timers = {}
saatpara = 1

function hudrender ()
if getElementData(localPlayer, "loggedin") == 1 then 
--if getElementData(localPlayer, "hudtip") == 2 or getElementData(localPlayer, "hudtip") == 3 then return end

    isim = getPlayerName(localPlayer)
	local su = getElementData(localPlayer, "thirst") * 1.47
	local yemek = getElementData(localPlayer, "hunger") * 1.47
	local can = getElementHealth(localPlayer) * 2
	local armor = getPedArmor(localPlayer) * 2
	local money = getElementData(localPlayer, "money")
		if getRealTime().hour < 10 and getRealTime().minute < 10 and getRealTime().second < 10 then
		dtext = "0"..getRealTime().hour..":0"..getRealTime().minute..":0"..getRealTime().second
		elseif getRealTime().hour > 10 and getRealTime().minute > 10 and getRealTime().second > 10 then
		dtext = getRealTime().hour..":"..getRealTime().minute..":"..getRealTime().second
		elseif getRealTime().hour < 10 and getRealTime().minute > 10 and getRealTime().second > 10 then
		dtext = "0"..getRealTime().hour..":"..getRealTime().minute..":"..getRealTime().second
		elseif getRealTime().hour < 10 and getRealTime().minute > 10 and getRealTime().second < 10 then
		dtext =  "0"..getRealTime().hour..":"..getRealTime().minute..":0"..getRealTime().second
		elseif getRealTime().hour < 10 and getRealTime().minute < 10 and getRealTime().second > 10 then
		dtext =  "0"..getRealTime().hour..":0"..getRealTime().minute..":"..getRealTime().second
		elseif getRealTime().hour > 10 and getRealTime().minute < 10 and getRealTime().second < 10 then
		dtext =  ""..getRealTime().hour..":"..getRealTime().minute..":"..getRealTime().second
		elseif getRealTime().hour < 10 and getRealTime().minute < 10 and getRealTime().second > 10 then
		dtext =  ""..getRealTime().hour..":"..getRealTime().minute..":0"..getRealTime().second
		elseif getRealTime().hour < 10 and getRealTime().minute > 10 and getRealTime().second < 10 then
		dtext =  ""..getRealTime().hour..":0"..getRealTime().minute..":"..getRealTime().second
		end   
 




dxDrawRectangle (s * 0.8300, h * 0.0200, s * 0.0300, h * 0.0500, tocolor(28  ,28  ,28  , 250), false)
dxDrawRectangle (s * 0.9500, h * 0.0200, s * 0.0300, h * 0.0500, tocolor(28  ,28  ,28  , 250), false)
dxDrawRectangle (s * 0.8600, h * 0.0200, s * 0.0800, h * 0.0180, tocolor(28  ,28  ,28  , 250), false)
dxDrawRectangle (s * 0.8700, h * 0.0517, s * 0.0800, h * 0.0180, tocolor(28  ,28  ,28  , 250), false)
--dxDrawRoundedRectangle (s * 0.8300, h * 0.0800, s * 0.1500, h * 0.0200, 5, tocolor(28  ,28  ,28  , 250), false)

dxDrawImage(s*0.4850, h*0.0250, s*0.5, h*0.5, "hud.png", 0, 0, 0, tocolor(255,255,255), false  )

dxDrawText("  $ "..money.."", s*0.85, h*0.0810, s*0.5, h*0.35, tocolor(255,255,255, 250), 0.9, font)
--dxDrawText(isim, s*0.784, h*0.0950, s*0.5, h*0.5, tocolor(255,255,255, 200), 0.5, font)
			--su
		--dxDrawRoundedRectangle(s*1670/1920, h*160/1080, s*200/1920, h*16/1080, 6, tocolor(0, 0, 0, 150), true, true)
		  dxDrawRoundedRectangle(s*1655/1920, h*25/1080, s*yemek/1920, h*12/1080, 0, tocolor(251, 217, 108, 200), true)

			--armor  s*1600/1920, h*66/1080, s*yemek/1920, h*15/1080 
		--dxDrawRoundedRectangle(s*1525/1920, h*160/1080, s*200/1920, h*16/1080, 6, tocolor(128, 128, 128, 150), true, true)
		--dxDrawRoundedRectangle(s*1525/1920, h*160/1080, s*armor/1920, h*16/1080, 6, tocolor(255, 255, 255, 150), true)
			
			--yemek
	   --dxDrawRoundedRectangle(s*1670/1920, h*135/1080, s*200/1920, h*16/1080, 0, tocolor(0, 0, 0, 150))
		dxDrawRoundedRectangle(s*1675/1920, h*61.15/1080, s*su/1920, h*11.3/1080, 0, tocolor(154, 43, 42, 180),true)

			--health
		--dxDrawRoundedRectangle(s*1670/1920, h*110/1080, s*200/1920, h*16/1080, 6, tocolor(0, 0, 0, 150))
		--dxDrawRoundedRectangle(s*1670/1920, h*110/1080, s*can/1920, h*16/1080,6,  tocolor(175, 0, 0, 150), true)
if isTimer(timers[getElementData(localPlayer, "dbid")]) then return end
timers[getElementData(localPlayer, "dbid")] = setTimer(function() end, 4*60*60, 1)
end
end
setTimer(hudrender, 7, 0)