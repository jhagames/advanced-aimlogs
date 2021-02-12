RegisterServerEvent('aimlogs:log')
AddEventHandler('aimlogs:log', function(pedId,itemType)
  local ids = ExtractIdentifiers(source)
  local ids2 = ExtractIdentifiers(pedId)
    local _source = source
    local name = GetPlayerName(_source)
    local targetName = GetPlayerName(pedId)
    local hour = os.date("%x %X %p")
    discord ="**Discord ID:  ** <@" ..ids.discord:gsub("discord:", "")..">" 
    discord2 ="**Discord ID:  ** <@" ..ids2.discord:gsub("discord:", "")..">" 
    steam =" **Steam Url  **https://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16)..""
    steam2 =" **Steam Url  **https://steamcommunity.com/profiles/" ..tonumber(ids2.steam:gsub("steam:", ""),16)..""

  sendToDiscord("Aim Logs", "O ``" .. name .. " ID:[".._source.."]`` στοχέυει τον ``".. targetName .." ID:["..pedId.."]``\n🕯️ID:[".._source.."] "..discord.."\n🕯️ID:[".._source.."] "..steam.."\n\n🏃ID:["..pedId.."] "..discord2.."\n🏃ID:["..pedId.."] "..steam2.."", 65280)
end)



function sendToDiscord(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = os.date("%x %X %p "),
              },
          }
      }
    PerformHttpRequest("WEBHOOK", function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end

  function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end


    
