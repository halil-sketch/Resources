-- Bu senaryo Haliliyy tarafından 28.06.2021 tarihinde Oscuri Roleplay için tekrar yazılmıştır.

function birlikaracigeldi(player,cmd,id)
	if ( not tonumber(id) ) then
		 return false
	end
	local vehicle = exports.orp_pool:getElement("vehicle", id)
	if vehicle then 
		if getElementData(player,'faction') == -1 then
			return false
		end
		if getElementData(player,'faction') ~= getElementData(vehicle,'faction')  then
			return false
		end
		if (tonumber(getElementData(player,'money')) < tonumber(10000)) then
			 outputChatBox('Aracı getirebilmek için yeterli miktarda paran yok ! ['..tonumber(10000)-getElementData(player,'money')..']', player, 255, 0, 0, true)
			 return false
		end
		local r = getPedRotation(player)
		local x, y, z = getElementPosition(player)
		x = x + ( ( math.cos ( math.rad ( r ) ) ) * 5 )
		y = y + ( ( math.sin ( math.rad ( r ) ) ) * 5 )
		 setElementPosition(vehicle, x, y, z)
		 setVehicleRotation(vehicle, 0, 0, r)
         setElementInterior(vehicle, getElementInterior(player))
		 setElementDimension(vehicle, getElementDimension(player))
		 outputChatBox('[!]#ffffff Başarıyla '..id..'\'li araçı yanınıza çektiniz ', player, 0, 255, 0, true)
		 exports.orp_global:takeMoney(player, 10000)
	else
		outputChatBox('[!]#ffffff Böyle bir araç bulunmamaktadır',player, 255, 0, 0, true)
	end
end
addCommandHandler("getfactionveh", birlikaracigeldi, false, false)
		 
