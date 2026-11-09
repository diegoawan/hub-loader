--[[
    IncrementalUi
    Multi-Game Loader
    Version: 2.0.0

    UI: IncrementalUi v5.1.0
    Authentication: Cloudflare
    Game Detection: PlaceId
]]

-- ============================================================
-- CONFIGURATION
-- ============================================================

local LIB_URL =
    "https://raw.githubusercontent.com/diegoawan/IncrementalUi/refs/heads/main/Lua"

local VERIFY_URL =
    "https://incrementalui-keys.diegoawan23.workers.dev/verify"

local GET_KEY_URL =
    "https://diegoawan.github.io/IncrementalUiGetKey/"

local DISCORD =
    "https://discord.gg/7yYP7CNhxN"

local VERSION = "2.0.0"

-- ============================================================
-- SUPPORTED GAMES
-- ============================================================

local Games = {
    [75759384861869] =
        "https://raw.githubusercontent.com/diegoawan/Cube-Incremental-/refs/heads/main/Lua",

    [88728410943211] =
        "https://raw.githubusercontent.com/diegoawan/Computer-Incremental-/refs/heads/main/Lua",

    [110626257954132] =
        "https://raw.githubusercontent.com/diegoawan/Dice-rolling-incremental-/refs/heads/main/Lua",

    [106772177198260] =
        "https://raw.githubusercontent.com/diegoawan/Reel-a-brainrot-1/refs/heads/main/Lua",

    [76911729991355] =
        "https://raw.githubusercontent.com/diegoawan/r/refs/heads/main/Lua",

    [12645083079] =
        "https://raw.githubusercontent.com/diegoawan/Bpo/refs/heads/main/Lua",

    [99435399946069] =
        "https://raw.githubusercontent.com/diegoawan/Real-a-brainrot-2/refs/heads/main/Lua",

    [78491332555415] =
        "https://raw.githubusercontent.com/diegoawan/Watchnumbersgoup/refs/heads/main/Lua",

    [99148298557434] =
        "https://raw.githubusercontent.com/diegoawan/Reborninc/refs/heads/main/Lua",

    [124216119978534] =
        "https://raw.githubusercontent.com/diegoawan/Testing-/refs/heads/main/Lua",

    [84156601481934] =
        "https://raw.githubusercontent.com/diegoawan/rr/refs/heads/main/Lua",

    [110290371202376] =
        "https://raw.githubusercontent.com/diegoawan/Adoptabrainrot/refs/heads/main/Lua",

    [96668710663666] =
        "https://raw.githubusercontent.com/diegoawan/Powerinc/refs/heads/main/Lua",

    [135610605159183] =
        "https://raw.githubusercontent.com/diegoawan/Portal-incremental-/refs/heads/main/Lua",

    [130274245431977] =
        "https://raw.githubusercontent.com/diegoawan/Climb-and-Plunge/refs/heads/main/Lua",

    [75317862071711] =
        "https://raw.githubusercontent.com/diegoawan/Immortalityinc/refs/heads/main/Lua",

    [122821966131621] =
        "https://raw.githubusercontent.com/diegoawan/Slayerinc2/refs/heads/main/Lua",
}

-- ============================================================
-- SERVICES
-- ============================================================

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- ============================================================
-- LOGGING
-- ============================================================

local function log(message)
    warn("[IncrementalUi] " .. tostring(message))
end

-- ============================================================
-- HTTP REQUEST SUPPORT
-- ============================================================

local requestFunction =
    (syn and syn.request)
    or (http and http.request)
    or http_request
    or request

-- ============================================================
-- LOAD INCREMENTALUI
-- ============================================================

log("Loading IncrementalUi v" .. VERSION)

if type(loadstring) ~= "function" then
    log("Loadstring is unavailable.")
    return
end

local librarySuccess, UI = pcall(function()
    local source = game:HttpGet(LIB_URL)

    if type(source) ~= "string" or #source < 20 then
        error("Invalid UI library.")
    end

    if source:lower():find("<html") then
        error("Invalid GitHub response.")
    end

    local func, compileError = loadstring(source)

    if not func then
        error(compileError)
    end

    return func()
end)

if not librarySuccess or type(UI) ~= "table" then
    log("Failed to load IncrementalUi: " .. tostring(UI))
    return
end

log("IncrementalUi loaded successfully.")

-- ============================================================
-- GAME DETECTION
-- ============================================================

local PlaceId = game.PlaceId
local GameURL = Games[PlaceId]

local function getGameName()
    local success, name = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(PlaceId).Name
    end)

    return success and name or "Unknown Game"
end

local GameName = getGameName()

log("Detected: " .. GameName)
log("PlaceId: " .. tostring(PlaceId))

-- ============================================================
-- DISCORD
-- ============================================================

local function copyDiscord()
    if setclipboard then
        pcall(setclipboard, DISCORD)
    end
end

-- ============================================================
-- UNSUPPORTED GAME
-- ============================================================

if not GameURL then
    local Window = UI:CreateWindow({
        Name = "IncrementalUi",
        Subtitle = "Unsupported Game",
        Theme = "GreyWhite",
        Keybind = Enum.KeyCode.RightControl,
    })

    local Tab = Window:CreateTab("Unsupported")

    Tab:CreateSection("Game Information")

    Tab:CreateParagraph({
        Title = "Game Not Supported",
        Content = "IncrementalUi does not currently support "
            .. GameName .. "."
    })

    Tab:CreateButton({
        Name = "Copy Discord",
        Callback = copyDiscord
    })

    log("Unsupported game.")
    return
end

-- ============================================================
-- DOWNLOAD AND EXECUTE GAME SCRIPT
-- ============================================================

local function LoadGameScript()
    log("Downloading " .. GameName .. "...")

    local downloadSuccess, source = pcall(function()
        return game:HttpGet(GameURL)
    end)

    if not downloadSuccess then
        error("Download failed: " .. tostring(source))
    end

    if type(source) ~= "string" or #source < 20 then
        error("Game script is empty or invalid.")
    end

    if source:lower():find("<html") then
        error("GitHub returned HTML instead of Lua.")
    end

    log("Compiling game script...")

    local compileSuccess, scriptFunction = pcall(loadstring, source)

    if not compileSuccess or type(scriptFunction) ~= "function" then
        error("Compilation failed: " .. tostring(scriptFunction))
    end

    log("Executing " .. GameName .. "...")

    local executionSuccess, executionError = pcall(function()
        scriptFunction(UI)
    end)

    if not executionSuccess then
        error("Execution failed: " .. tostring(executionError))
    end

    log(GameName .. " loaded successfully.")
end

-- ============================================================
-- CLOUDFLARE KEY VERIFICATION
-- ============================================================

local function verifyCloudflareKey(key)

    if type(key) ~= "string" or key == "" then
        return false, "Please enter a key."
    end

    if not requestFunction then
        return false, "HTTP requests are unavailable."
    end

    local requestSuccess, response = pcall(function()
        return requestFunction({
            Url = VERIFY_URL,
            Method = "POST",

            Headers = {
                ["Content-Type"] = "application/json"
            },

            Body = HttpService:JSONEncode({
                key = key
            })
        })
    end)

    if not requestSuccess or type(response) ~= "table" then
        log("Cloudflare connection failed: " .. tostring(response))
        return false, "Could not connect to the key server."
    end

    local statusCode = response.StatusCode or response.Status

    if statusCode ~= 200 then
        return false, "Key server returned HTTP " .. tostring(statusCode)
    end

    local decodeSuccess, data = pcall(function()
        return HttpService:JSONDecode(response.Body or "")
    end)

    if not decodeSuccess or type(data) ~= "table" then
        return false, "Invalid key server response."
    end

    if data.valid == true then
        log("Key successfully verified.")
        return true, "Key successfully verified!"
    end

    return false, data.message or "Invalid, expired or revoked key."
end

-- ============================================================
-- KEY SYSTEM
-- ============================================================

log("Opening Cloudflare Key System...")

UI:CreateKeySystem({

    Theme = "GreyWhite",

    GetKeyLink = GET_KEY_URL,

    Verify = verifyCloudflareKey,

    OnSuccess = function()

        log("Authentication successful.")

        local success, err = pcall(LoadGameScript)

        if not success then
            log(err)

            local Window = UI:CreateWindow({
                Name = "IncrementalUi",
                Subtitle = "Loading Error",
                Theme = "GreyWhite",
                Keybind = Enum.KeyCode.RightControl,
            })

            local ErrorTab = Window:CreateTab("Error")

            ErrorTab:CreateParagraph({
                Title = "Script Failed",
                Content = tostring(err)
            })

            ErrorTab:CreateButton({
                Name = "Copy Discord",
                Callback = copyDiscord
            })
        end
    end
})

log("Loader initialized successfully.")
