local sx,sy = guiGetScreenSize()
local zoom = 1
local varsayilan = 1920
if sx < varsayilan then
 zoom = math.min(2,varsayilan/sx)
end



twitler={}
twit_zaman= 10000

function twitterUI()
    for k,v in ipairs(twitler) do
        if getTickCount() > v[2]+twit_zaman then
            table.remove(twitler,1)
        end
		local yazigenisligi = dxGetTextWidth(v[1],1.5, "default-bold")
		local arttirma = yazigenisligi / 384
        local screenX = ((130+15*arttirma)/zoom)*(k-1)
        dxDrawImage(30/zoom,675/zoom-screenX,400/zoom,(120+15*arttirma)/zoom,"halil/background.png",0,0,0,tocolor(255, 255, 255,225),false)
        dxDrawImage(42/zoom,680/zoom-screenX,36/zoom,36/zoom,"halil/instagram.png",0,0,0,tocolor(255,255,255,225),false)
        dxDrawText(v[1],45/zoom,722/zoom-screenX,400/zoom,130/zoom,tocolor(255,255,255,225),1.5/zoom,"default-bold",left,top,false,true)
        dxDrawText("@"..v[3].."",85/zoom,686/zoom-screenX,400/zoom,130/zoom,tocolor(255,255,255,225),1.5/zoom,"default-bold",left,top,false,false,true,true)
    end
end
addEventHandler("onClientRender",getRootElement(), twitterUI)

function yeniTwit(_,icerik, isim)
    table.insert(twitler, {icerik,getTickCount(), isim})
    if #twitler > 3 then
        table.remove(twitler, 1)
    end
end
 
addEvent("yeni:twit",true)
addEventHandler("yeni:twit",getRootElement(),function(icerik, isim)
    yeniTwit(_,icerik, isim)
end)

 

local tx, ty = guiGetScreenSize()
local x, y = (tx/1360), (ty/768)

painelF5 = false
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
function twitterUI()
if getElementData(localPlayer, "loggedin") == 1 then 
	dxDrawRoundedRectangle(x*400, y*220, x*555, y*330, 20, tocolor(255,255,255,255))
	--dxDrawRoundedRectangle(x*400, y*220, x*555, y*3, 15,tocolor(29, 161, 242,215))
	dxDrawText("                 Instagram \nInstagram.com/oscuriroleplay", x*550, y*315, x*585, y*3,tocolor(20, 23, 26,255), 1.4, "default-bold")
	dxDrawImage(x*620, y*260, x*42, y*42,twitterIcon)
	
	twitText = guiGetText(tweetAlani)
	dxDrawRectangle(x*510, y*376, x*340, y*60,tocolor(67, 67, 67,255))
	roundedRectangle(x*510, y*376, x*340, y*62,tocolor(169, 37, 117,215), tocolor(255, 255, 255,215), false)
	dxDrawText(twitText,x*520,y*380,x*830,500,tocolor(0,0,0),1,"default","left","top", true, true, false, false)
	
	roundedRectangle(x*600, y*466, x*72, y*32,tocolor(67,67, 67,235), tocolor(169, 37, 117,215), false)
	dxDrawText("Gönder",x*608, y*472, x*72, y*32,tocolor(255,255,255),1.3,"default-bold",asd,asd)
	
	roundedRectangle(x*680, y*466, x*72, y*32,tocolor(67,67, 67,235), tocolor(169, 37, 117,215), false)
	
	
	dxDrawText("Kapat",x*690, y*472, x*72, y*32,tocolor(255, 255, 255),1.3,"default-bold",asd,asd)
  end
end

function open (_,state)
	if painelF5 == false then
		showCursor(true)
		twitterIcon = dxCreateTexture( "halil/instagram.png" )
		addEventHandler("onClientRender", root, twitterUI)
		guiSetInputEnabled(true)
		
		 
		tweetAlani =  guiCreateMemo( x*510, y*373, x*320, y*72, "", false)
		guiSetProperty ( tweetAlani, "MaxTextLength", "140" )
		guiSetAlpha(tweetAlani,0)
		-- Button
		tweetbutton = guiCreateButton( x*600, y*466, x*72, y*32, "Gönder", false )
		addEventHandler("onClientGUIClick", tweetbutton, tweetGonderButton)
		guiSetAlpha(tweetbutton,0)
		
		-- Kapat Button
		kapatButton = guiCreateButton( x*680, y*466, x*72, y*32, "Kapat", false )
		addEventHandler("onClientGUIClick", kapatButton, kapatFunction)
		guiSetAlpha(kapatButton,0)
		
		painelF5 = true
		showCursor(true)
	else
		showCursor(false)
		removeEventHandler("onClientRender", root, twitterUI)
		destroyElement( twitterIcon )                 
		destroyElement( tweetbutton )   
		destroyElement( kapatButton )   
		guiSetInputEnabled(false)		
		destroyElement( tweetAlani )                  
        twitterIcon = nil
		painelF5 = false
		showCursor(false)
	end
end
addCommandHandler("instagram", open)


bindKey ( "F1", "up", open )

function tweetGonderButton ()
	if source == tweetbutton then
        local tweetIcerigi = guiGetText ( tweetAlani )
        triggerServerEvent("twitGonder:server", getLocalPlayer(), getLocalPlayer(), tweetIcerigi or "Haliliyy")
	end
end

function kapatFunction ()
	if source == kapatButton then
        open()
	end
end


 
function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 0, 0, 200)
		end
		
		if (not bgColor) then
			bgColor = borderColor
		end
		
		
		dxDrawRectangle(x, y, w, h, bgColor, postGUI)
		
		
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI)
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI)
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI);
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI)
	end
end


