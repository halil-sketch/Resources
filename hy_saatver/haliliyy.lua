function saat_ver(thePlayer, cmd, verilen_saat)
    if not verilensaat then
        outputChatBox("#cc0000[!] #FFFFFFKomut eksik yada yanlış.", thePlayer, 0, 255, 0, true)
        return
    end
    if getElementData(thePlayer, "account:username") == "halil" or getElementData(thePlayer, "account:username") == "haliliyy" then
        for , player in ipairs(exports.pool:getPoolElementsByType("player")) do
            local saat_cek = getElementData(player, "hoursplayed") or 1
            local yeni_saat = saat_cek + tonumber(verilen_saat)
            exports['anticheat-system']:changeProtectedElementDataEx(player, "hoursplayed", yeni_saat, false, true)
            mysql:query_free("UPDATE characters SET hoursplayed= hoursplayed +".. tonumber(verilen_saat) .." WHERE id ='" .. mysql:escape_string(tostring(getElementData( player, "dbid" ))) .. "'" )
            outputChatBox("[!] #FFFFFFTebrikler, ".. verilen_saat .." saat bonusunu aldınız.", player, 0, 255, 0, true)
        end
    end
end
addCommandHandler("saatver", saat_ver)