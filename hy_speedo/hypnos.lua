
-- Bu speedo Haliliyy tarafından 29.01.2021 tarihinde Oscuri Roleplay için yapılmıştır.

local screenW, screenH = guiGetScreenSize()
local font = exports.orp_fonts:getFont("RobotoB", 12)
function Hud ( )
if getElementData(localPlayer, "loggedin") == 1 then
 local veh = getPedOccupiedVehicle ( localPlayer )
		if veh then
		local yakit = math.floor(getElementData(veh, "fuel"))
		local speedX, speedY, speedZ = getElementVelocity ( veh  )
		local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
		local KMH = math.floor(actualSpeed*180).."KMH"	
			
		
			
			dxDrawImage(screenW * 0.7073, screenH * 0.8411, screenW * 0.3028, screenH * 0.1035, "hud3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(KMH, screenW * 0.86673, screenH * 0.88111, screenW * 0.5028, screenH * 0.5035,  tocolor ( 255, 255, 255, 255 ), 1, font)
			
		end
	end
end
setTimer(Hud, 6, 0)

