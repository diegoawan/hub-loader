local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local DISCORD = "https://discord.gg/7yYP7CNhxN"
local FileName = "HubKey.txt"

local Keys = {
    "ThanksForJoining",
}

local WEBHOOK = "6777777"

local Games = {
    [1111111] = "https://raw.githubusercontent.com/yourrepo/free/1111111.lua",
    [1111112] = "https://raw.githubusercontent.com/yourrepo/free/1111112.lua",
    [1111113] = "https://raw.githubusercontent.com/yourrepo/free/1111113.lua",
    [1111114] = "https://raw.githubusercontent.com/yourrepo/free/1111114.lua",
    [1111115] = "https://raw.githubusercontent.com/yourrepo/free/1111115.lua",
    [1111116] = "https://raw.githubusercontent.com/yourrepo/free/1111116.lua",
    [1111117] = "https://raw.githubusercontent.com/yourrepo/free/1111117.lua",
    [1111118] = "https://raw.githubusercontent.com/yourrepo/free/1111118.lua",
    [1111119] = "https://raw.githubusercontent.com/yourrepo/free/1111119.lua",
    [1111120] = "https://raw.githubusercontent.com/yourrepo/free/1111120.lua"
}

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

local SavedKey
pcall(function()
    if isfile(FileName) then
        SavedKey = readfile(FileName)
    end
end)

local function CheckKey(Key)
    for _,v in pairs(Keys) do
        if Key == v then
            return true
        end
    end
    return false
end

local function SendWebhook()
    local GameName = "Unknown"
    pcall(function()
        GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    local requestFunc =
        (syn and syn.request) or
        (http and http.request) or
        http_request or
        request

    if not requestFunc then return end

    local Data = {
        ["embeds"] = {{
            ["title"] = "Free Hub Executed",
            ["color"] = 5763719,
            ["fields"] = {
                {
                    ["name"] = "User",
                    ["value"] = LocalPlayer.Name.." ("..LocalPlayer.UserId..")"
                },
                {
                    ["name"] = "Game",
                    ["value"] = GameName
                },
                {
                    ["name"] = "Time",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }}
    }

    requestFunc({
        Url = WEBHOOK,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(Data)
    })
end

local function LoadHub()
    SendWebhook()

    local Window = Rayfield:CreateWindow({
        Name = "Hub | Free"
    })

    getgenv().Window = Window
	
    local Tab = Window:CreateTab("Main")

    Tab:CreateButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard(DISCORD)
        end
    })

    local URL = Games[game.PlaceId]

    if URL then
        loadstring(game:HttpGet(URL))()
    else
        Rayfield:Notify({
            Title = "Unsupported Game",
            Content = "Game not supported",
            Duration = 5
        })
    end
end

if SavedKey and CheckKey(SavedKey) then
    LoadHub()
    return
end

local Window = Rayfield:CreateWindow({
    Name = "Key System"
})

local Tab = Window:CreateTab("Key")

local InputKey = ""

Tab:CreateInput({
    Name = "Enter Key",
    Callback = function(text)
        InputKey = text
    end
})

Tab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard(DISCORD)
    end
})

Tab:CreateButton({
    Name = "Submit",
    Callback = function()
        if CheckKey(InputKey) then
            writefile(FileName, InputKey)

            Rayfield:Destroy()
            Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

            LoadHub()
        end
    end
})
