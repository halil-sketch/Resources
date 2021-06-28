 -- Bu speedo Haliliyy tarafından 28.06.2021 Tarihinde Oscuri Roleplay için düzenlenmiştir.

scripterx,scriptery=1600,900
screenx,screeny=guiGetScreenSize()
local RadioLand=dxCreateFont ( "Digital.ttf", 30)

 
NosVerbrauch=5      





local NosLevel=0
local NosLevelTimerStatus=false
local NosLevelTimer2Status=false
local altx,alty,altz
local DriveDistance
local gefahreneKM=0
local NosLevelTimer
local TachoStatus=false

addEventHandler("onClientPlayerVehicleEnter",getRootElement(),function()
	if source==getLocalPlayer() then
		altx,alty,altz=getElementPosition(getPedOccupiedVehicle(getLocalPlayer()))
		addEventHandler("onClientRender",getRootElement(),showTacho)
		TachoStatus=true
		NosLevelTimer=setTimer(function()
			if NosLevel<290 then
				NosLevel=NosLevel+0.5
			end
		end,100,0)
		NosLevelTimerStatus=true
		
		bindKey( "vehicle_fire", "both", function(key,state)
			local veh = getPedOccupiedVehicle( getLocalPlayer() )
			if veh then
				if state == "up" then
					triggerServerEvent("onNitroFire",getLocalPlayer(),veh,false)
					if NosLevelTimer2Status then
						killTimer(NosLevelTimer2)
						NosLevelTimer2Status=false
					end
				else
					if NosLevel>10 then
						triggerServerEvent("onNitroFire",getLocalPlayer(),veh,true)
						NosLevelTimer2=setTimer(function()
							if NosLevel<5 then
								if NosLevelTimer2Status then
									killTimer(NosLevelTimer2)
									NosLevelTimer2Status=false
									triggerServerEvent("onNitroFire",getLocalPlayer(),veh,false)
								end
							else
								NosLevel=NosLevel-(2*NosVerbrauch)
							end
						end,100,0)
						NosLevelTimer2Status=true
					end
				end
			end
		end)
	end
end
)

function TachoAusblenden()
	if source==getLocalPlayer() then
		if TachoStatus then
			removeEventHandler("onClientRender",getRootElement(),showTacho)
			TachoStatus=false
			unbindKey ("vehicle_fire", "both")
			if NosLevelTimerStatus then
				killTimer(NosLevelTimer)
				NosLevelTimerStatus=false
			end
			if NosLevelTimer2Status then
				killTimer(NosLevelTimer2)
				NosLevelTimer2Status=false
			end
		end
	end
end
addEventHandler("onClientPlayerVehicleExit",getRootElement(),TachoAusblenden)
addEventHandler("onClientPlayerWasted",getLocalPlayer(),TachoAusblenden)


function showTacho()
	dxDrawImage(screenx*(1100/scripterx),screeny*(770/scriptery),screenx*(600/scripterx),screeny*(110/scriptery),"TachoBack.png",0,0,0,tocolor(255,255,255),true)
	dxDrawLine(screenx*(1305/scripterx),screeny*(830/scriptery),screenx*((1305+NosLevel)/scripterx),screeny*(830/scriptery),tocolor(255,255,255),screeny*(32/scriptery),true)
	dxDrawImage(screenx*(1100/scripterx),screeny*(770/scriptery),screenx*(600/scripterx),screeny*(110/scriptery),"Tacho.png",0,0,0,tocolor(255,255,255),true)
	dxDrawText(math.round(getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()))),screenx*(45/scripterx),screeny*(140/scriptery),screenx*(1550/scripterx),screeny*(1518/scriptery),tocolor(255,255,255),screeny*(0.7/scriptery),RadioLand,"right","center",false,false,true)
	dxDrawText("KM/H",screenx*(155/scripterx),screeny*(155/scriptery),screenx*(1580/scripterx),screeny*(1495/scriptery),tocolor(255,255,255),screeny*(1/scriptery),"arial","right","center",false,false,true)
	
	dxDrawText(math.round(gefahreneKM),screenx*(115/scripterx),screeny*(115/scriptery),screenx*(1550/scripterx),screeny*(1610/scriptery),tocolor(255,255,255),screeny*(0.4/scriptery),RadioLand,"right","center",false,false,true)
	dxDrawText("KM",screenx*(115/scripterx),screeny*(115/scriptery),screenx*(1590/scripterx),screeny*(1608/scriptery),tocolor(255,255,255),screeny*(1/scriptery),"arial","right","center",false,false,true)
	
	local neux,neuy,neuz=getElementPosition(getPedOccupiedVehicle(getLocalPlayer()))
	DriveDistance=getDistanceBetweenPoints3D(neux,neuy,neuz,altx,alty,altz)
	DriveDistance=DriveDistance/1000
	gefahreneKM=gefahreneKM+DriveDistance
	altx,alty,altz=neux,neuy,neuz
end


function setNosLoad(prozent)
	if prozent then
		if prozent>=0 and prozent<=100 then
			NosLevel=290*(prozent/100)
		end
	else
		NosLevel=290
	end
end

function setNosLevel(level)
	if level==1 then
		NosVerbrauch=5
	elseif level==2 then
		NosVerbrauch=4
	elseif level==3 then
		NosVerbrauch=3
	end
end


function getElementSpeed(element)
speedx, speedy, speedz = getElementVelocity (element)
actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
kmh = actualspeed * 180
return kmh
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end




addCommandHandler("nos",function(cmd,prozent)
	setNosLoad(tonumber(prozent))
end)
addCommandHandler("noslvl",function(cmd,level)
	setNosLevel(tonumber(level))
end)