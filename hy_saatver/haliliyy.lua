giveHour = function(p,cmd,t,m) -- player, cmd, target, miktar

    if not t and not tonumber(m) then
        p:outputChat("SYNTAX:#FFFFFF /"..cmd.." [Oyuncu] [Verilecek Saat]",155,155,155,true)
    return end

    local targetPlayer, targetPlayerName = exports.wrp_global:findPlayerByPartialNick(p, t)

    local dbid = targetPlayer:getData("dbid")
    local hoursplayed = targetPlayer:getData("hoursplayed") or 0
    targetPlayer:setData("hoursplayed",hoursplayed+m)
    exports['wrp_anticheat']:changeProtectedElementDataEx(targetPlayer, "hoursplayed", hoursplayed+m, false, true)
    dbExec(getDBConnection(), "UPDATE characters SET hoursplayed = hoursplayed + '"..m.."' WHERE id = '" .. dbid.."' ")
    targetPlayer:outputChat("Sunucu:#FFFFFF Hesabınıza "..m.." saat eklendi.",155,155,155,true)
    p:outputChat("Sunucu:#FFFFFF Kişinin hesabına "..m.." saat eklendi.",155,155,155,true)


end
addCommandHandler("saatver",giveHour)









function connect(res)
    DBConnection = dbConnect( "mysql", "dbname="..dbName..";host="..hostName..";charset=utf8", ""..kadi.."", ""..sifre.."" )
    if (not DBConnection) then
        outputDebugString("Error: Failed to establish connection to the MySQL database server")
    else
        outputDebugString(""..getResourceName(res)..": Baglanti Saglandi ")
        outputDebugString(""..getResourceName(res)..": Host: "..hostName.."")
        outputDebugString(""..getResourceName(res)..": Database: "..dbName.."")
        outputDebugString(""..getResourceName(res)..": Kullanici: "..kadi.."")
        outputDebugString(""..getResourceName(res)..": Sifre: "..sifre.."")
    end
end

addEventHandler("onResourceStart",resourceRoot, connect)
 
function query(...)
    local queryHandle = dbQuery(DBConnection, ...)
    if (not queryHandle) then
        return nil
    end
    local rows = dbPoll(queryHandle, -1)
    return rows
end
 
function execute(...)
    local queryHandle = dbQuery(DBConnection, ...)
    local result, numRows = dbPoll(queryHandle, -1)
    return numRows
end

function getDBConnection()
    return DBConnection
end

