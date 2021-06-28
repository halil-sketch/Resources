 

addEvent("onNitroFire",true)
addEventHandler("onNitroFire",getRootElement(),function(veh,nitro)
	if nitro then
		addVehicleUpgrade( veh, 1010 )
	else
		removeVehicleUpgrade( veh, 1010 )
	end
end
)
