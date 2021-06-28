twitSpamKoruyucu = {}

function twitAt(thePlayer, ...)
	twiticerik = table.concat({...}, " ")
	if isTimer(twitSpamKoruyucu[getPlayerSerial(thePlayer)]) then 
		kalanzaman = getTimerDetails(twitSpamKoruyucu[getPlayerSerial(thePlayer)])
		if (kalanzaman / 1000) > 60 then
			yazizaman = (kalanzaman /1000) / 60
			yazi = "dakika"
		else
			yazizaman = kalanzaman / 1000
			yazi = "saniye"
		end
		outputChatBox("#a92575[Instagram] #FFFFFFInstagram bir şey paylaşabilmek için ".. math.floor(yazizaman) .." "..yazi.." beklemeniz gerekiyor.", thePlayer,255,0,0,true) 
		return
	end
	if string.len(twiticerik) > 5 and string.len(twiticerik) < 80 then
		if getPlayerMoney(thePlayer) >= 0 then
			triggerClientEvent(getRootElement(), "yeni:twit", getRootElement(),twiticerik, getPlayerName(thePlayer))
			takePlayerMoney ( thePlayer, 0 )
			outputChatBox("#a92575[Instagram] #FFFFFFPaylaşımınız başarıyla gönderildi",thePlayer,255,0,0,true)
			twitSpamKoruyucu[getPlayerSerial(thePlayer)] = setTimer(function(plr) twitSpamKoruyucu[getPlayerSerial(thePlayer)] = nil end, 300000, 1, thePlayer)
		else
			outputChatBox("#a92575[Instagram]#FFFFFFOscuri Roleplay iyi roller diler :P", thePlayer, 255,0,0,true)
		end
	else
		outputChatBox("#a92575[Instagram]#FFFFFFİçerik en az 5, en fazla 80 karakter olabilir.", thePlayer, 255,0,0,true)
	end
end
addEvent("twitGonder:server", true)
addEventHandler("twitGonder:server", getRootElement(), twitAt)




