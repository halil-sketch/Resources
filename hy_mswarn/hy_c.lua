

local screenSize = {guiGetScreenSize()}
local s = {guiGetScreenSize()}
local box = {s[1], s[2]}
local pos = {s[1]/2 -box[1]/2,s[2]/2 - box[2]/2}
local boxS = {0,0}
local textPos = {s[1]/2 -boxS[1]/2,s[2]/2 - boxS[2]/2}
local font = dxCreateFont("files/font.ttf",13)
local rot = 0
local paneldurum = false

function pingpanel ()
      dxDrawText("PİNGİN 500 MS ÜZERİNDE \nBU ŞEKİLDE OYUNA DEVAM EDEMEZSİN \nBekleniyor..", textPos[1]-1, textPos[2]+1,textPos[1]-1, textPos[2]+1, tocolor(0,0,0,255),1.4, font, "center", "top")
      dxDrawText("PİNGİN 500 MS ÜZERİNDE \nBU ŞEKİLDE OYUNA DEVAM EDEMEZSİN \nBekleniyor..", textPos[1], textPos[2],textPos[1], textPos[2], tocolor(255,255,255,255),1.4, font, "center", "top") 
        rot = rot + 4
        if rot == 360 then 
            rot = 0
        end
      dxDrawImage(textPos[1]-30, textPos[1]-194, 35,35, "files/loading.png", rot, 0,0, tocolor(0,0,0,255))
      dxDrawImage(textPos[1]-31, textPos[1]-195, 35,35, "files/loading.png", rot, 0,0, tocolor(255,255,255,255))
end



setTimer(function()
	if getElementData(localPlayer, "loggedin") == 1 then 
		if getPlayerPing(localPlayer) >= 500 then 
			if not paneldurum then 
				paneldurum = true 
              showChat(false)               
			   setElementFrozen(localPlayer, true) 
				addEventHandler("onClientRender",root, pingpanel) 
			end
		else
			if paneldurum then 
				paneldurum = false
				showChat(true) 
                setElementFrozen(localPlayer, false) 
				removeEventHandler("onClientRender",root, pingpanel) 
			end
		end
	end
end,200,0)

