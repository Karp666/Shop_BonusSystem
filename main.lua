function GetPluginAuthor()
    return "karp"
end
function GetPluginVersion()
    return "v1.0.0"
end
function GetPluginName()
    return "bonus"
end
function GetPluginWebsite()
    return ""
end
commands:Register("bonus", function (playerid, args)
local player = GetPlayer(playerid)
local credits = tonumber(args[1])

if not exports["admins"]:HasFlags(playerid, config:Fetch("shop.core.adminflag")) then
    return ReplyToCommand(playerid, "{default}[{yellow}Haos{default}]", " {darkred}Nu ai acces la aceasta comanda!")
end

if not credits then
    return ReplyToCommand(playerid, "{default}[{yellow}Haos{default}]", "{green}Syntax: {default}<credite>")
    end

for playerid = 0,playermanager:GetPlayerCap() -1 do
    if not player or not player:IsValid() or player:IsFakeClient() then
        goto continue
    end
    exports["shop-core"]:GiveCredits(playerid, credits)
    ::continue::

end
    local targetPlayer = nil
    if playerid ~= -1 then
        targetPlayer = GetPlayer(playerid)
    end
    playermanager:SendMsg(MessageType.Chat, FetchTranslation("bonus.bonus_all"):gsub("{CREDITS}", credits):gsub("{PLAYER_NAME}", targetPlayer:CBasePlayerController().PlayerName))
end)