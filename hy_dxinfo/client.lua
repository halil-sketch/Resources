

local screenW,screenH = guiGetScreenSize()
local px,py = 1920,1080
local x,y = (screenW/px), (screenH/py)

local font1 = dxCreateFont("files/RobotoCondensed.ttf", 23)

 

function dxinfo()
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		 
		dxDrawText("WildMTA - discord.gg/wildroleplay", x*19, y*660, x*1890, y*25, tocolor(255, 255, 255, 255), 0.5, font1, "left", "center", false, false, true, true, false)
		
	
	else
		 
		dxDrawText("WildMTA - discord.gg/wildroleplay", x*19, y*660, x*1890, y*25, tocolor(255, 255, 255, 255), 0.5, font1, "left", "center", false, false, true, true, false)
		
	
	end
end

function renderDxHud()
	addEventHandler("onClientRender", getRootElement(), dxinfo)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), renderDxHud)

function toggleHud()
	if isVisible then
		addEventHandler("onClientRender", root, dxinfo)
	else
		removeEventHandler("onClientRender", root, dxinfo)
	end
	isVisible = not isVisible
end
addCommandHandler("infogizle", toggleHud)