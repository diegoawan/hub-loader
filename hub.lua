local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local DISCORD = "https://discord.gg/7yYP7CNhxN"
local FileName = "HubKey.txt"

local Keys = {
    "ThanksForJoining",
}

local Games = {
    [75759384861869] = "https://raw.githubusercontent.com/diegoawan/Cube-Incremental-/refs/heads/main/Lua",
    [88728410943211] = "https://raw.githubusercontent.com/diegoawan/Computer-Incremental-/refs/heads/main/Lua",
    [110626257954132] = "https://raw.githubusercontent.com/diegoawan/Dice-rolling-incremental-/refs/heads/main/Lua",
    [106772177198260] = "https://raw.githubusercontent.com/diegoawan/Reel-a-brainrot-1/refs/heads/main/Lua",
    [99435399946069] = "https://raw.githubusercontent.com/diegoawan/Real-a-brainrot-2/refs/heads/main/Lua",
    [78491332555415] = "https://raw.githubusercontent.com/diegoawan/Watchnumbersgoup/refs/heads/main/Lua",
    [1111117] = "https://raw.githubusercontent.com/yourrepo/free/1111117.lua",
    [1111118] = "https://raw.githubusercontent.com/yourrepo/free/1111118.lua",
    [1111119] = "https://raw.githubusercontent.com/yourrepo/free/1111119.lua",
    [1111120] = "https://raw.githubusercontent.com/yourrepo/free/1111120.lua"
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SavedKey
pcall(function()
    if isfile(FileName) then
        SavedKey = readfile(FileName)
    end
end)

local function CheckKey(Key)
    if not Key or Key == "" then return false end
    for _, v in pairs(Keys) do
        if Key == v then
            return true
        end
    end
    return false
end

local function LoadHub()
    local Window = Rayfield:CreateWindow({
        Name = "Hub | Free"
    })

    getgenv().Window = Window

    local MainTab = Window:CreateTab("Main", 4483362458)

    MainTab:CreateButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard(DISCORD)
        end
    })

    local URL = Games[game.PlaceId]

    if URL then
        local success, err = pcall(function()
            local content = game:HttpGet(URL)

            if not content or #content < 10 then
                error("Script is empty or invalid")
            end

            if content:lower():find("<html") then
                error("Use raw link")
            end

            local func, loadErr = loadstring(content)
            if not func then
                error(loadErr or "Failed to compile script")
            end

            setfenv(func, getfenv())
            func()
        end)

        if not success then
            MainTab:CreateParagraph({
                Title = "Script Error",
                Content = tostring(err)
            })

            Rayfield:Notify({
                Title = "Load Failed",
                Content = tostring(err),
                Duration = 5
            })
        end
    else
        local UnsupportedTab = Window:CreateTab("Unsupported", 4483362458)

        UnsupportedTab:CreateParagraph({
            Title = "Game Not Supported",
            Content = "This game is not supported yet."
        })

        UnsupportedTab:CreateButton({
            Name = "Copy Discord",
            Callback = function()
                setclipboard(DISCORD)
            end
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

local Tab = Window:CreateTab("Key", 4483362458)

local InputKey = ""

Tab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Type key and press Enter",
    RemoveTextAfterFocusLost = false,
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
        else
            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "Wrong key",
                Duration = 3
            })
        end
    end
})
