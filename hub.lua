local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local DISCORD = "https://discord.gg/7yYP7CNhxN"

local FreeKeys = {
    "ThanksForJoining",
}

local PremiumKeys = {
    ["PREMIUM1"] = 10380725805
}

local FileName = "HubKey.txt"
local SavedKey = nil

pcall(function()
    if isfile(FileName) then
        SavedKey = readfile(FileName)
    end
end)

local PremiumUser = false

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function CheckKey(Key)

    for k,id in pairs(PremiumKeys) do
        if Key == k and LocalPlayer.UserId == id then
            PremiumUser = true
            return true
        end
    end

    for _,v in pairs(FreeKeys) do
        if Key == v then
            PremiumUser = false
            return true
        end
    end

    return false
end


local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local WEBHOOK = "https://discord.com/api/webhooks/1480568416472530976/f0wkFfm-V_GP8IBAAooZIDOh9KWf7rm7EQ0QhPPeg7XiQzqNurAUYldgRNAK-AEUUUDj"

local function SendWebhook(scriptType)

    local Player = Players.LocalPlayer

    local GameName = "Unknown"

    pcall(function()
        GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    local requestFunc =
        (syn and syn.request) or
        (http and http.request) or
        http_request or
        request

    if not requestFunc then
        warn("Executor does not support HTTP requests")
        return
    end

    local Data = {
        ["embeds"] = {{
            ["title"] = "Hub Executed",
            ["color"] = 5763719,
            ["fields"] = {

                {
                    ["name"] = "Roblox User",
                    ["value"] = Player.Name .. " (" .. Player.UserId .. ")",
                    ["inline"] = false
                },

                {
                    ["name"] = "Game",
                    ["value"] = GameName,
                    ["inline"] = false
                },

                {
                    ["name"] = "Script",
                    ["value"] = scriptType,
                    ["inline"] = true
                },

                {
                    ["name"] = "Time",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                    ["inline"] = true
                }

            }
        }}
    }

    requestFunc({
        Url = WEBHOOK,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode(Data)
    })

end

local function LoadHub()

    SendWebhook(PremiumUser and "Premium" or "Free")

    local Window = Rayfield:CreateWindow({
        Name = PremiumUser and "Hub | Premium" or "Hub | Free",
        LoadingTitle = "Hub",
        LoadingSubtitle = "Loaded",
        ConfigurationSaving = {
            Enabled = false
        }
    })

    local MainTab = Window:CreateTab("Main")

    MainTab:CreateButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard(DISCORD)
        end
    })

    if not PremiumUser then

        local UpgradeKey = ""

        MainTab:CreateInput({
            Name = "Enter Premium Key",
            PlaceholderText = "Paste premium key",
            RemoveTextAfterFocusLost = false,
            Callback = function(text)
                UpgradeKey = text
            end
        })

        MainTab:CreateButton({
            Name = "Upgrade To Premium",
            Callback = function()

                for key,id in pairs(PremiumKeys) do
    if UpgradeKey == key and LocalPlayer.UserId == id then

        PremiumUser = true
        writefile(FileName, UpgradeKey)

        Rayfield:Notify({
            Title = "Premium Activated",
            Content = "Reloading Hub...",
            Duration = 4
        })

        task.wait(1)

        Rayfield:Destroy()
        Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

        LoadHub()

        return
    end
end

                Rayfield:Notify({
                    Title = "Invalid Key",
                    Content = "This premium key is not valid",
                    Duration = 4
                })

            end
        })

    end

    local Games = {

        [75759384861869] = {
            Free = function(Window)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

local function GetHRP()
local Character = Player.Character or Player.CharacterAdded:Wait()
return Character:WaitForChild("HumanoidRootPart")
end

local MainTab = Window:CreateTab("Main", 4483362458)
local RuneTab = Window:CreateTab("Runes", 4483362458)
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

local AutoCube = false
local AutoDropper = false

local RuneBasic = false
local RuneColors = false
local RuneHidden = false
local RuneAssembly = false
local RunePrestige = false
local RuneAscension = false
local RuneGray = false

MainTab:CreateToggle({
Name = "Auto Cube (Teleport)",
CurrentValue = false,
Callback = function(Value)
AutoCube = Value
if not Value then return end

task.spawn(function()  
while AutoCube do  

local HRP = GetHRP()  

for _,cube in ipairs(workspace.__Scripted.__ClientCubes:GetChildren()) do  
if not AutoCube then break end  

if cube:IsA("BasePart") then  
HRP.CFrame = cube.CFrame + Vector3.new(0,3,0)  

elseif cube:IsA("Model") then  
local part = cube.PrimaryPart or cube:FindFirstChildWhichIsA("BasePart")  
if part then  
HRP.CFrame = part.CFrame + Vector3.new(0,3,0)  
end  
end  

task.wait(0.1)  
end  

task.wait(0.15)  
end  
end)  
end
})

MainTab:CreateToggle({
Name = "Auto Click Dropper",
CurrentValue = false,
Callback = function(Value)
AutoDropper = Value
if not Value then return end

task.spawn(function()  
while AutoDropper do  

for i = 1,10 do  
task.spawn(function()  
pcall(function()  
fireclickdetector(  
workspace.Tycoon.Droppers.ClickDropper  
.ActivateButton.ClickDetector  
)  
end)  
end)  
end  

task.wait()  

end  
end)  
end
})

local function BuyRune(Name)
pcall(function()
ReplicatedStorage
:WaitForChild("Packages")
:WaitForChild("_Index")
:WaitForChild("sleitnick_knit@1.7.0")
:WaitForChild("knit")
:WaitForChild("Services")
:WaitForChild("RunesService")
:WaitForChild("RE")
:WaitForChild("BuyRune")
:FireServer(Name)
end)
end

RuneTab:CreateToggle({
Name = "Auto Basic Rune",
CurrentValue = false,
Callback = function(v)
RuneBasic = v
if not v then return end
task.spawn(function()
while RuneBasic do
BuyRune("Basic")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Colors Rune",
CurrentValue = false,
Callback = function(v)
RuneColors = v
if not v then return end
task.spawn(function()
while RuneColors do
BuyRune("Colors")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Hidden Rune 1",
CurrentValue = false,
Callback = function(v)
RuneHidden = v
if not v then return end
task.spawn(function()
while RuneHidden do
BuyRune("Hidden Rune 1")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Assembly Rune",
CurrentValue = false,
Callback = function(v)
RuneAssembly = v
if not v then return end
task.spawn(function()
while RuneAssembly do
BuyRune("Assembly")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Prestige Rune",
CurrentValue = false,
Callback = function(v)
RunePrestige = v
if not v then return end
task.spawn(function()
while RunePrestige do
BuyRune("Prestige")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Ascension Rune",
CurrentValue = false,
Callback = function(v)
RuneAscension = v
if not v then return end
task.spawn(function()
while RuneAscension do
BuyRune("Ascension")
task.wait(0.2)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Gray Rune",
CurrentValue = false,
Callback = function(v)
RuneGray = v
if not v then return end
task.spawn(function()
while RuneGray do
BuyRune("Gray")
task.wait(0.2)
end
end)
end
})

TeleportTab:CreateButton({
Name = "Teleport to Island",
Callback = function()

firetouchinterest(  
GetHRP(),  
workspace.Teleporters.Tree2_Portal.TouchDetection,  
0  
)  

firetouchinterest(  
GetHRP(),  
workspace.Teleporters.Tree2_Portal.TouchDetection,  
1  
)  

end
})

TeleportTab:CreateButton({
Name = "Teleport to Spawn",
Callback = function()

GetHRP().CFrame = CFrame.new(  
-156.39978,  
5,  
6.27770996  
)  

end
})
            end,
            Premium = function(Window)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

local function GetHRP()
local Character = Player.Character or Player.CharacterAdded:Wait()
return Character:WaitForChild("HumanoidRootPart")
end

local MainTab = Window:CreateTab("Main", 4483362458)
local RuneTab = Window:CreateTab("Runes", 4483362458)
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

local AutoCube = false
local AutoDropper = false

local RuneBasic = false
local RuneColors = false
local RuneHidden = false
local RuneAssembly = false
local RunePrestige = false
local RuneAscension = false
local RuneGray = false

MainTab:CreateToggle({
Name = "Auto Cube (Teleport)",
CurrentValue = false,
Callback = function(Value)
AutoCube = Value
if not Value then return end

task.spawn(function()  
while AutoCube do  

local HRP = GetHRP()  

for _,cube in ipairs(workspace.__Scripted.__ClientCubes:GetChildren()) do  
if not AutoCube then break end  

if cube:IsA("BasePart") then  
HRP.CFrame = cube.CFrame + Vector3.new(0,3,0)  

elseif cube:IsA("Model") then  
local part = cube.PrimaryPart or cube:FindFirstChildWhichIsA("BasePart")  
if part then  
HRP.CFrame = part.CFrame + Vector3.new(0,3,0)  
end  
end  

task.wait(0.02)  
end  

task.wait(0.05)  
end  
end)  
end
})

MainTab:CreateToggle({
Name = "Auto Click Dropper",
CurrentValue = false,
Callback = function(Value)
AutoDropper = Value
if not Value then return end

task.spawn(function()  
while AutoDropper do  

for i = 1,10 do  
task.spawn(function()  
pcall(function()  
fireclickdetector(  
workspace.Tycoon.Droppers.ClickDropper  
.ActivateButton.ClickDetector  
)  
end)  
end)  
end  

task.wait()  

end  
end)  
end
})

local function BuyRune(Name)
pcall(function()
ReplicatedStorage
:WaitForChild("Packages")
:WaitForChild("_Index")
:WaitForChild("sleitnick_knit@1.7.0")
:WaitForChild("knit")
:WaitForChild("Services")
:WaitForChild("RunesService")
:WaitForChild("RE")
:WaitForChild("BuyRune")
:FireServer(Name)
end)
end

RuneTab:CreateToggle({
Name = "Auto Basic Rune",
CurrentValue = false,
Callback = function(v)
RuneBasic = v
if not v then return end
task.spawn(function()
while RuneBasic do
BuyRune("Basic")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Colors Rune",
CurrentValue = false,
Callback = function(v)
RuneColors = v
if not v then return end
task.spawn(function()
while RuneColors do
BuyRune("Colors")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Hidden Rune 1",
CurrentValue = false,
Callback = function(v)
RuneHidden = v
if not v then return end
task.spawn(function()
while RuneHidden do
BuyRune("Hidden Rune 1")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Assembly Rune",
CurrentValue = false,
Callback = function(v)
RuneAssembly = v
if not v then return end
task.spawn(function()
while RuneAssembly do
BuyRune("Assembly")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Prestige Rune",
CurrentValue = false,
Callback = function(v)
RunePrestige = v
if not v then return end
task.spawn(function()
while RunePrestige do
BuyRune("Prestige")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Ascension Rune",
CurrentValue = false,
Callback = function(v)
RuneAscension = v
if not v then return end
task.spawn(function()
while RuneAscension do
BuyRune("Ascension")
task.wait(0.05)
end
end)
end
})

RuneTab:CreateToggle({
Name = "Auto Gray Rune",
CurrentValue = false,
Callback = function(v)
RuneGray = v
if not v then return end
task.spawn(function()
while RuneGray do
BuyRune("Gray")
task.wait(0.05)
end
end)
end
})

TeleportTab:CreateButton({
Name = "Teleport to Island",
Callback = function()

firetouchinterest(  
GetHRP(),  
workspace.Teleporters.Tree2_Portal.TouchDetection,  
0  
)  

firetouchinterest(  
GetHRP(),  
workspace.Teleporters.Tree2_Portal.TouchDetection,  
1  
)  

end
})

TeleportTab:CreateButton({
Name = "Teleport to Spawn",
Callback = function()

GetHRP().CFrame = CFrame.new(  
-156.39978,  
5,  
6.27770996  
)  

end
})
            end
        },

        [88728410943211] = {
            Free = function(Window)

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Remote = RS:WaitForChild("Packages"):WaitForChild("Packet"):WaitForChild("RemoteEvent")

local Tab = Window:CreateTab("Main",4483362458)
local UpgradeTab = Window:CreateTab("Luck & Slots",4483362458)

local AutoCash = false
local CashSpeed = 0.1
local AutoUpgrade = false
local MaxUpgradeLevel = 30
local AutoGPU = false
local AutoPrestige = false
local AutoComputers = false
local AutoLuck = false
local AutoSlots = false

local function ClickButton(button)
	pcall(function()
		if button and button.Activate then
			button:Activate()
		end
	end)

	pcall(function()
		if firesignal and button.MouseButton1Click then
			firesignal(button.MouseButton1Click)
		end
	end)
end

local CollectParts = nil

Tab:CreateToggle({
	Name = "Auto Cash",
	CurrentValue = false,
	Callback = function(Value)
		AutoCash = Value

		if Value then

			if not CollectParts then
				CollectParts = {}
				for _,v in ipairs(workspace:GetDescendants()) do
					if v.Name == "CollectPartTouch" and v:FindFirstChild("TouchInterest") then
						table.insert(CollectParts,v)
					end
				end
			end

			task.spawn(function()
				while AutoCash do
					local Character = Player.Character
					local HRP = Character and Character:FindFirstChild("HumanoidRootPart")

					if HRP then
						for _,v in ipairs(CollectParts) do
							-- pcall to prevent errors if part disappears
							pcall(function()
								firetouchinterest(HRP,v,0)
								firetouchinterest(HRP,v,1)
							end)
						end
					end

					-- Always read the latest CashSpeed each loop
					task.wait(math.clamp(CashSpeed, 0.05, 5)) 
				end
			end)

		end
	end
})

Tab:CreateSlider({
	Name = "Auto Cash Speed",
	Range = {0.05,3},
	Increment = 0.05,
	Suffix = "Seconds",
	CurrentValue = 0.1,
	Callback = function(Value)
		CashSpeed = Value
	end
})

Tab:CreateSlider({
	Name = "Upgrade Stop Level",
	Range = {1,100},
	Increment = 1,
	CurrentValue = 30,
	Callback = function(Value)
		MaxUpgradeLevel = Value
	end
})

local UpgradeSlots = nil

Tab:CreateToggle({
	Name = "Auto Upgrade Computers",
	CurrentValue = false,
	Callback = function(Value)

		AutoUpgrade = Value

		if Value then
			if not UpgradeSlots then
				UpgradeSlots = {}

				for _,plot in ipairs(workspace.Plots:GetDescendants()) do
					if plot.Name == "Slots" then
						for _,slot in ipairs(plot:GetChildren()) do
							table.insert(UpgradeSlots,slot)
						end
					end
				end
			end

			task.spawn(function()
				while AutoUpgrade do
					for _,slot in ipairs(UpgradeSlots) do
						local levelText = slot:FindFirstChild("UpgradePart")

						if levelText then
							local gui = levelText:FindFirstChild("UpgradeGUI")

							if gui then
								local current = gui:FindFirstChild("CurrentLevel")

								if current then
									local levels = current:FindFirstChild("Levels")

									if levels and levels:IsA("TextLabel") then
										local number = tonumber(levels.Text:match("%d+"))

										if number and number < MaxUpgradeLevel then
											pcall(function()
												local args = {
													buffer.fromstring("\v\003Max"),
													{slot}
												}

												Remote:FireServer(unpack(args))
											end)
										end
									end
								end
							end
						end
					end

					task.wait(1)
				end
			end)
		end
	end
})

Tab:CreateToggle({
	Name = "Auto Prestige",
	CurrentValue = false,
	Callback = function(Value)
		AutoPrestige = Value

		if Value then
			task.spawn(function()
				while AutoPrestige do
					local args = { buffer.fromstring("%") }
					Remote:FireServer(unpack(args))
					task.wait(2)
				end
			end)
		end
	end
})

local GPUCards = {
["Rusty"] = "\019\005Rusty",
["Plastic"] = "\019\aPlastic",
["Wood"] = "\019\004Wood",
["Metal"] = "\019\005Metal",
["Starry"] = "\019\006Starry",
["Gold"] = "\019\004Gold",
["Diamond"] = "\019\aDiamond",
["Cursed"] = "\019\006Cursed",
["Toxic"] = "\019\005Toxic",
["Black Hole"] = "\019\nBlack Hole",
["Demonic"] = "\019\aDemonic",
["Angelic"] = "\019\aAngelic",
["Hacker"] = "\019\006Hacker",
["Rainbow"] = "\019\aRainbow",
["Void"] = "\019\004Void"
}

Tab:CreateToggle({
	Name = "Auto Graphics Cards",
	CurrentValue = false,
	Callback = function(Value)

		AutoGPU = Value

		if Value then
			task.spawn(function()

				while AutoGPU do

					local holder = Player:WaitForChild("PlayerGui")
						:WaitForChild("MainUI")
						:WaitForChild("Frames")
						:WaitForChild("GraphicsCards")
						:WaitForChild("Holder")

					local AnyStock = false

					for name,packet in pairs(GPUCards) do

						local gpu = holder:FindFirstChild(name)

						if gpu then

							local stock = gpu:FindFirstChild("StockLabel")

							if stock and stock:IsA("TextLabel") then

								local number = tonumber(stock.Text:match("%d+"))

								if number and number > 0 then

									AnyStock = true

									pcall(function()
										Remote:FireServer(buffer.fromstring(packet))
									end)

									task.wait(0.1)

								end

							end

						end

					end

					-- If no stock, just wait for shop refresh instead of stopping
					if not AnyStock then
						task.wait(3)
					else
						task.wait(0.2)
					end

				end

			end)
		end

	end
})

Tab:CreateToggle({
	Name = "Auto Buy Computers",
	CurrentValue = false,
	Callback = function(Value)

		AutoComputers = Value

		if Value then
			task.spawn(function()
				while AutoComputers do
					local holder = Player.PlayerGui.MainUI.Frames.Items.Holder

					for _,computer in ipairs(holder:GetChildren()) do
						local front = computer:FindFirstChild("Front")

						if front then
							local button = front:FindFirstChild("BuyButton")

							if button then
								ClickButton(button)
								task.wait(0.05)
							end
						end
					end

					task.wait(0.5)
				end
			end)
		end
	end
})

UpgradeTab:CreateToggle({
	Name = "Auto Case Luck",
	CurrentValue = false,
	Callback = function(Value)

		AutoLuck = Value

		if Value then
			task.spawn(function()
				while AutoLuck do
					local args = { buffer.fromstring("\003\tCase Luck\003Max") }
					Remote:FireServer(unpack(args))
					task.wait(1)
				end
			end)
		end
	end
})

UpgradeTab:CreateToggle({
	Name = "Auto Item Slots",
	CurrentValue = false,
	Callback = function(Value)

		AutoSlots = Value

		if Value then
			task.spawn(function()
				while AutoSlots do
					local args = { buffer.fromstring("\003\nItem Slots\003Max") }
					Remote:FireServer(unpack(args))
					task.wait(1)
				end
			end)
		end
	end
})
			end,
Premium = function(Window)
				
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Remote = RS:WaitForChild("Packages"):WaitForChild("Packet"):WaitForChild("RemoteEvent")

local Tab = Window:CreateTab("Main", 4483362458)
local UpgradeTab = Window:CreateTab("Luck & Slots", 4483362458)

local AutoCash = false
local AutoUpgrade = false
local MaxUpgradeLevel = 30
local AutoGPU = false
local AutoPrestige = false
local AutoComputers = false
local AutoLuck = false
local AutoSlots = false

local function ClickButton(button)
    pcall(function()
        if button and button.Activate then
            button:Activate()
        end
    end)
    pcall(function()
        if firesignal and button.MouseButton1Click then
            firesignal(button.MouseButton1Click)
        end
    end)
end

local CollectParts
Tab:CreateToggle({
    Name = "Auto Cash",
    CurrentValue = false,
    Callback = function(Value)
        AutoCash = Value

        if Value then
            if not CollectParts then
                CollectParts = {}
                for _,v in ipairs(workspace:GetDescendants()) do
                    if v.Name == "CollectPartTouch" and v:FindFirstChild("TouchInterest") then
                        table.insert(CollectParts,v)
                    end
                end
            end

            task.spawn(function()
                while AutoCash do
                    local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                    if HRP then
                        for _,v in ipairs(CollectParts) do
                            pcall(function()
                                firetouchinterest(HRP,v,0)
                                firetouchinterest(HRP,v,1)
                            end)
                        end
                    end
                    task.wait(0.05)
                end
            end)
        end
    end
})

Tab:CreateSlider({
    Name = "Upgrade Stop Level",
    Range = {1,100},
    Increment = 1,
    CurrentValue = 30,
    Callback = function(Value)
        MaxUpgradeLevel = Value
    end
})

local UpgradeSlots
Tab:CreateToggle({
    Name = "Auto Upgrade Computers",
    CurrentValue = false,
    Callback = function(Value)
        AutoUpgrade = Value

        if Value then
            if not UpgradeSlots then
                UpgradeSlots = {}
                for _,plot in ipairs(workspace.Plots:GetDescendants()) do
                    if plot.Name == "Slots" then
                        for _,slot in ipairs(plot:GetChildren()) do
                            table.insert(UpgradeSlots,slot)
                        end
                    end
                end
            end

            task.spawn(function()
                while AutoUpgrade do
                    for _,slot in ipairs(UpgradeSlots) do
                        local levelText = slot:FindFirstChild("UpgradePart")
                        if levelText then
                            local gui = levelText:FindFirstChild("UpgradeGUI")
                            if gui then
                                local current = gui:FindFirstChild("CurrentLevel")
                                if current then
                                    local levels = current:FindFirstChild("Levels")
                                    if levels and levels:IsA("TextLabel") then
                                        local number = tonumber(levels.Text:match("%d+"))
                                        if number and number < MaxUpgradeLevel then
                                            pcall(function()
                                                Remote:FireServer(buffer.fromstring("\v\003Max"), {slot})
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

Tab:CreateToggle({
    Name = "Auto Prestige",
    CurrentValue = false,
    Callback = function(Value)
        AutoPrestige = Value

        if Value then
            task.spawn(function()
                while AutoPrestige do
                    Remote:FireServer(buffer.fromstring("%"))
                    task.wait(1.5)
                end
            end)
        end
    end
})

local GPUCards = {
    ["Rusty"] = "\019\005Rusty",
    ["Plastic"] = "\019\aPlastic",
    ["Wood"] = "\019\004Wood",
    ["Metal"] = "\019\005Metal",
    ["Starry"] = "\019\006Starry",
    ["Gold"] = "\019\004Gold",
    ["Diamond"] = "\019\aDiamond",
    ["Cursed"] = "\019\006Cursed",
    ["Toxic"] = "\019\005Toxic",
    ["Black Hole"] = "\019\nBlack Hole",
    ["Demonic"] = "\019\aDemonic",
    ["Angelic"] = "\019\aAngelic",
    ["Hacker"] = "\019\006Hacker",
    ["Rainbow"] = "\019\aRainbow",
    ["Void"] = "\019\004Void"
}

Tab:CreateToggle({
    Name = "Auto Graphics Cards",
    CurrentValue = false,
    Callback = function(Value)
        AutoGPU = Value
        if Value then
            task.spawn(function()
                while AutoGPU do
                    local holder = Player:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("Frames"):WaitForChild("GraphicsCards"):WaitForChild("Holder")
                    local AnyStock = false
                    for name,packet in pairs(GPUCards) do
                        local gpu = holder:FindFirstChild(name)
                        if gpu then
                            local stock = gpu:FindFirstChild("StockLabel")
                            if stock and stock:IsA("TextLabel") then
                                local number = tonumber(stock.Text:match("%d+"))
                                if number and number > 0 then
                                    AnyStock = true
                                    pcall(function()
                                        Remote:FireServer(buffer.fromstring(packet))
                                    end)
                                    task.wait(0.05)
                                end
                            end
                        end
                    end
                    task.wait(AnyStock and 0.1 or 2) 
                end
            end)
        end
    end
})

Tab:CreateToggle({
    Name = "Auto Buy Computers",
    CurrentValue = false,
    Callback = function(Value)
        AutoComputers = Value
        if Value then
            task.spawn(function()
                while AutoComputers do
                    local holder = Player.PlayerGui.MainUI.Frames.Items.Holder
                    for _,computer in ipairs(holder:GetChildren()) do
                        local front = computer:FindFirstChild("Front")
                        if front then
                            local button = front:FindFirstChild("BuyButton")
                            if button then
                                ClickButton(button)
                                task.wait(0.03)
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

UpgradeTab:CreateToggle({
    Name = "Auto Case Luck",
    CurrentValue = false,
    Callback = function(Value)
        AutoLuck = Value
        if Value then
            task.spawn(function()
                while AutoLuck do
                    Remote:FireServer(buffer.fromstring("\003\tCase Luck\003Max"))
                    task.wait(0.7) 
                end
            end)
        end
    end
})

UpgradeTab:CreateToggle({
    Name = "Auto Item Slots",
    CurrentValue = false,
    Callback = function(Value)
        AutoSlots = Value
        if Value then
            task.spawn(function()
                while AutoSlots do
                    Remote:FireServer(buffer.fromstring("\003\nItem Slots\003Max"))
                    task.wait(0.7) 
                end
            end)
        end
    end
})
    
end},
[110626257954132] = {
            Free = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer

local Main = Window:CreateTab("Main",4483362458)
local Reset = Window:CreateTab("Reset Layer",4483362458)
local Codes = Window:CreateTab("Codes",4483362458)

local AutoRoll = false
local AutoGlyph = false
local AutoUpgrade = false

local AutoPrestige = false
local AutoAscension = false
local AutoTranscension = false

local ClaimCodes = false

local CodeList = {
	"Release",
	"FIXES",
	"FIXES2",
	"SORRY",
	"SORRYx2",
	"UPD1",
	"WelcomeToDRI",
	"LagFix",
	"Expansion"
}

task.spawn(function()
	while task.wait(1.25) do
		if AutoRoll then
			pcall(function()
				RS.Remotes.Roll:FireServer()
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(0.15) do
		if AutoGlyph then
			pcall(function()
				RS.Remotes.RollGlyph:InvokeServer()
			end)
		end
	end
end)

task.spawn(function()

	while task.wait(0.05) do

		if AutoUpgrade then

			local char = Player.Character
			if not char then continue end

			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then continue end

			local tree = workspace.Maps["Overworld A-2 (World 1)"]["Upgrade Tree"]

			for _,upgrade in pairs(tree:GetChildren()) do

				local display = upgrade:FindFirstChild("Display")

				if display then
					pcall(function()
						firetouchinterest(hrp, display, 0)
						firetouchinterest(hrp, display, 1)
					end)
				end

			end

		end

	end

end)

task.spawn(function()

	while task.wait(3) do

		if AutoPrestige then
			RS.Remotes.Reset:FireServer("Prestige")
		end

		if AutoAscension then
			RS.Remotes.Reset:FireServer("Ascension")
		end

		if AutoTranscension then
			RS.Remotes.Reset:FireServer("Transcension")
		end

	end

end)

task.spawn(function()

	while task.wait(2) do

		if ClaimCodes then

			for _,code in ipairs(CodeList) do
				pcall(function()
					RS.Remotes.RedeemCode:FireServer(code)
				end)
				task.wait(0.25)
			end

			ClaimCodes = false
		end

	end

end)

Main:CreateToggle({
	Name = "Auto Roll",
	CurrentValue = false,
	Callback = function(v)
		AutoRoll = v
	end
})

Main:CreateToggle({
	Name = "Auto Glyph",
	CurrentValue = false,
	Callback = function(v)
		AutoGlyph = v
	end
})

Main:CreateToggle({
	Name = "Auto Buy Upgrades",
	CurrentValue = false,
	Callback = function(v)
		AutoUpgrade = v
	end
})

Reset:CreateToggle({
	Name = "Auto Prestige",
	CurrentValue = false,
	Callback = function(v)
		AutoPrestige = v
	end
})

Reset:CreateToggle({
	Name = "Auto Ascension",
	CurrentValue = false,
	Callback = function(v)
		AutoAscension = v
	end
})

Reset:CreateToggle({
	Name = "Auto Transcension",
	CurrentValue = false,
	Callback = function(v)
		AutoTranscension = v
	end
})

Codes:CreateToggle({
	Name = "Claim All Codes",
	CurrentValue = false,
	Callback = function(v)
		ClaimCodes = v
	end
})

Rayfield:Notify({
	Title = "Loaded",
	Content = "Codes system added",
	Duration = 3
})
            end,
            Premium = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

local Main = Window:CreateTab("Main",4483362458)
local Reset = Window:CreateTab("Reset Layer",4483362458)
local Codes = Window:CreateTab("Codes",4483362458)
local Upgrades = Window:CreateTab("Upgrades",4483362458)

local AutoRoll = false
local AutoGlyph = false
local AutoUpgradeTree = false

local AutoPrestige = false
local AutoAscension = false
local AutoTranscension = false

local ClaimCodes = false

local CoinGain,CoinMulti,MaxRoll = false,false,false
local CoinMultiII,PPXPMulti,MinRoll,MaxRollII,ExtraDice,Walkspeed = false,false,false,false,false,false
local CoinMultiIII,PPMulti,XPMulti,MaxRollIII,MinRollII,ExtraDiceII = false,false,false,false,false,false
local CoinMultiIV,PPMultiII,APMulti,MaxRollIV,MinRollIII,ExtraDiceIII,RuneLuck,RuneBulk,RuneSpeed = false,false,false,false,false,false,false,false,false

local CodeList = {
	"Release",
	"FIXES",
	"FIXES2",
	"SORRY",
	"SORRYx2",
	"UPD1",
	"WelcomeToDRI",
	"LagFix",
	"Expansion"
}

task.spawn(function()
	while task.wait(1.25) do
		if AutoRoll then
			pcall(function()
				RS.Remotes.Roll:FireServer()
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(0.15) do
		if AutoGlyph then
			pcall(function()
				RS.Remotes.RollGlyph:InvokeServer()
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(0.05) do
		if AutoUpgradeTree then
			local char = Player.Character
			if not char then continue end

			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then continue end

			local tree = workspace.Maps["Overworld A-2 (World 1)"]["Upgrade Tree"]

			for _,upgrade in pairs(tree:GetChildren()) do
				local display = upgrade:FindFirstChild("Display")
				if display then
					pcall(function()
						firetouchinterest(hrp,display,0)
						firetouchinterest(hrp,display,1)
					end)
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait(3) do
		if AutoPrestige then
			RS.Remotes.Reset:FireServer("Prestige")
		end
		if AutoAscension then
			RS.Remotes.Reset:FireServer("Ascension")
		end
		if AutoTranscension then
			RS.Remotes.Reset:FireServer("Transcension")
		end
	end
end)

task.spawn(function()
	while task.wait(2) do
		if ClaimCodes then
			for _,code in ipairs(CodeList) do
				pcall(function()
					RS.Remotes.RedeemCode:FireServer(code)
				end)
				task.wait(0.25)
			end
			ClaimCodes = false
		end
	end
end)

task.spawn(function()
	while task.wait(0.15) do

		if CoinGain then RS.Remotes.Upgrade:FireServer("Coin Gain","Max","Coins","Coins") end
		if CoinMulti then RS.Remotes.Upgrade:FireServer("Coin Multi","Max","Coins","Coins") end
		if MaxRoll then RS.Remotes.Upgrade:FireServer("Max Roll","Max","Coins","Coins") end

		if CoinMultiII then RS.Remotes.Upgrade:FireServer("Coin Multi II","Max","PP","Prestige Points") end
		if PPXPMulti then RS.Remotes.Upgrade:FireServer("PP XP Multi","Max","PP","Prestige Points") end
		if MinRoll then RS.Remotes.Upgrade:FireServer("Min Roll","Max","PP","Prestige Points") end
		if MaxRollII then RS.Remotes.Upgrade:FireServer("Max Roll II","Max","PP","Prestige Points") end
		if ExtraDice then RS.Remotes.Upgrade:FireServer("Extra Dice","Max","PP","Prestige Points") end
		if Walkspeed then RS.Remotes.Upgrade:FireServer("Walkspeed","Max","PP","Prestige Points") end

		if CoinMultiIII then RS.Remotes.Upgrade:FireServer("Coin Multi III","Max","AP","Ascension Points") end
		if PPMulti then RS.Remotes.Upgrade:FireServer("PP Multi","Max","AP","Ascension Points") end
		if XPMulti then RS.Remotes.Upgrade:FireServer("XP Multi","Max","AP","Ascension Points") end
		if MaxRollIII then RS.Remotes.Upgrade:FireServer("Max Roll III","Max","AP","Ascension Points") end
		if MinRollII then RS.Remotes.Upgrade:FireServer("Min Roll II","Max","AP","Ascension Points") end
		if ExtraDiceII then RS.Remotes.Upgrade:FireServer("Extra Dice II","Max","AP","Ascension Points") end

		if CoinMultiIV then RS.Remotes.Upgrade:FireServer("Coin Multi IV","Max","TP","Transcension Points") end
		if PPMultiII then RS.Remotes.Upgrade:FireServer("PP Multi II","Max","TP","Transcension Points") end
		if APMulti then RS.Remotes.Upgrade:FireServer("AP Multi","Max","TP","Transcension Points") end
		if MaxRollIV then RS.Remotes.Upgrade:FireServer("Max Roll IV","Max","TP","Transcension Points") end
		if MinRollIII then RS.Remotes.Upgrade:FireServer("Min Roll III","Max","TP","Transcension Points") end
		if ExtraDiceIII then RS.Remotes.Upgrade:FireServer("Extra Dice III","Max","TP","Transcension Points") end
		if RuneLuck then RS.Remotes.Upgrade:FireServer("Rune Luck","Max","TP","Transcension Points") end
		if RuneBulk then RS.Remotes.Upgrade:FireServer("Rune Bulk","Max","TP","Transcension Points") end
		if RuneSpeed then RS.Remotes.Upgrade:FireServer("Rune Speed","Max","TP","Transcension Points") end

	end
end)

Main:CreateToggle({Name="Auto Roll",CurrentValue=false,Callback=function(v)AutoRoll=v end})
Main:CreateToggle({Name="Auto Glyph",CurrentValue=false,Callback=function(v)AutoGlyph=v end})
Main:CreateToggle({Name="Auto Buy Upgrade Tree",CurrentValue=false,Callback=function(v)AutoUpgradeTree=v end})

Reset:CreateToggle({Name="Auto Prestige",CurrentValue=false,Callback=function(v)AutoPrestige=v end})
Reset:CreateToggle({Name="Auto Ascension",CurrentValue=false,Callback=function(v)AutoAscension=v end})
Reset:CreateToggle({Name="Auto Transcension",CurrentValue=false,Callback=function(v)AutoTranscension=v end})

Codes:CreateToggle({
	Name="Claim All Codes",
	CurrentValue=false,
	Callback=function(v)ClaimCodes=v end
})

Upgrades:CreateSection("Coins Upgrades")

Upgrades:CreateToggle({Name="Coin Gain",CurrentValue=false,Callback=function(v)CoinGain=v end})
Upgrades:CreateToggle({Name="Coin Multi",CurrentValue=false,Callback=function(v)CoinMulti=v end})
Upgrades:CreateToggle({Name="Max Roll",CurrentValue=false,Callback=function(v)MaxRoll=v end})

Upgrades:CreateSection("Prestige Upgrades")

Upgrades:CreateToggle({Name="Coin Multi II",CurrentValue=false,Callback=function(v)CoinMultiII=v end})
Upgrades:CreateToggle({Name="PP XP Multi",CurrentValue=false,Callback=function(v)PPXPMulti=v end})
Upgrades:CreateToggle({Name="Min Roll",CurrentValue=false,Callback=function(v)MinRoll=v end})
Upgrades:CreateToggle({Name="Max Roll II",CurrentValue=false,Callback=function(v)MaxRollII=v end})
Upgrades:CreateToggle({Name="Extra Dice",CurrentValue=false,Callback=function(v)ExtraDice=v end})
Upgrades:CreateToggle({Name="Walkspeed",CurrentValue=false,Callback=function(v)Walkspeed=v end})

Upgrades:CreateSection("Ascension Upgrades")

Upgrades:CreateToggle({Name="Coin Multi III",CurrentValue=false,Callback=function(v)CoinMultiIII=v end})
Upgrades:CreateToggle({Name="PP Multi",CurrentValue=false,Callback=function(v)PPMulti=v end})
Upgrades:CreateToggle({Name="XP Multi",CurrentValue=false,Callback=function(v)XPMulti=v end})
Upgrades:CreateToggle({Name="Max Roll III",CurrentValue=false,Callback=function(v)MaxRollIII=v end})
Upgrades:CreateToggle({Name="Min Roll II",CurrentValue=false,Callback=function(v)MinRollII=v end})
Upgrades:CreateToggle({Name="Extra Dice II",CurrentValue=false,Callback=function(v)ExtraDiceII=v end})

Upgrades:CreateSection("Transcension Upgrades")

Upgrades:CreateToggle({Name="Coin Multi IV",CurrentValue=false,Callback=function(v)CoinMultiIV=v end})
Upgrades:CreateToggle({Name="PP Multi II",CurrentValue=false,Callback=function(v)PPMultiII=v end})
Upgrades:CreateToggle({Name="AP Multi",CurrentValue=false,Callback=function(v)APMulti=v end})
Upgrades:CreateToggle({Name="Max Roll IV",CurrentValue=false,Callback=function(v)MaxRollIV=v end})
Upgrades:CreateToggle({Name="Min Roll III",CurrentValue=false,Callback=function(v)MinRollIII=v end})
Upgrades:CreateToggle({Name="Extra Dice III",CurrentValue=false,Callback=function(v)ExtraDiceIII=v end})
Upgrades:CreateToggle({Name="Rune Luck",CurrentValue=false,Callback=function(v)RuneLuck=v end})
Upgrades:CreateToggle({Name="Rune Bulk",CurrentValue=false,Callback=function(v)RuneBulk=v end})
Upgrades:CreateToggle({Name="Rune Speed",CurrentValue=false,Callback=function(v)RuneSpeed=v end})

Rayfield:Notify({
	Title="Loaded",
	Content="Full GUI Loaded Successfully",
	Duration=4
})
            end
        },

        [106772177198260] = {
            Free = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

local RemoteHandler = RS:WaitForChild("RemoteHandler")
local Fishing = RemoteHandler:WaitForChild("Fishing")
local Upgrade = RemoteHandler:WaitForChild("Upgrade")
local FishingRod = RemoteHandler:WaitForChild("FishingRod")
local RodMutation = RemoteHandler:WaitForChild("RodMutation")
local Merchant = RemoteHandler:WaitForChild("StPatricksMerchantBuy")

local Main = Window:CreateTab("Main",4483362458)
local Upgrades = Window:CreateTab("Upgrades",4483362458)
local Event = Window:CreateTab("Event",4483362458)

local AutoFishing=false
local AutoMoney=false
local AutoBase=false
local AutoFishPower=false
local AutoFishCatch=false
local AutoFishingRod=false
local AutoFishEffect=false
local AutoMoneyPot=false
local AutoLuckPot=false
local AutoBobber=false
local AutoBrainrot=false
local AutoLuckyBlock=false
local AutoEventRod=false

Main:CreateToggle({
Name="Auto Fishing",
CurrentValue=false,
Callback=function(v)
AutoFishing=v
if v then
task.spawn(function()
while AutoFishing do
Fishing:FireServer("Caught",math.huge)
task.wait(0.15)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Money",
CurrentValue=false,
Callback=function(v)
AutoMoney=v
if v then
task.spawn(function()
while AutoMoney do
for _,base in pairs(workspace.Bases:GetChildren()) do
if base:FindFirstChild("Objects") then
for _,plot in pairs(base.Objects:GetChildren()) do
local part=plot:FindFirstChild("CollectPart")
if part then
firetouchinterest(Root,part,0)
firetouchinterest(Root,part,1)
task.wait(0.03)
end
end
end
end
task.wait(0.2)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Base Level",
CurrentValue=false,
Callback=function(v)
AutoBase=v
if v then
task.spawn(function()
while AutoBase do
Upgrade:FireServer("BaseLevel")
task.wait(0.6)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Power",
CurrentValue=false,
Callback=function(v)
AutoFishPower=v
if v then
task.spawn(function()
while AutoFishPower do
Upgrade:FireServer("power10")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Catch",
CurrentValue=false,
Callback=function(v)
AutoFishCatch=v
if v then
task.spawn(function()
while AutoFishCatch do
Upgrade:FireServer("carry1")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fishing Rod",
CurrentValue=false,
Callback=function(v)
AutoFishingRod=v
if v then
task.spawn(function()
for i=1,18 do
if not AutoFishingRod then break end
FishingRod:FireServer("Buy","FishingRod"..i)
task.wait(0.6)
end
AutoFishingRod=false
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Effect",
CurrentValue=false,
Callback=function(v)
AutoFishEffect=v
if v then
task.spawn(function()
for i=1,7 do
if not AutoFishEffect then break end
RodMutation:FireServer("Buy","RodMutation"..i)
task.wait(0.6)
end
AutoFishEffect=false
end)
end
end
})

Event:CreateToggle({
Name="Auto Money Pots",
CurrentValue=false,
Callback=function(v)
AutoMoneyPot=v
if v then
task.spawn(function()
while AutoMoneyPot do
Merchant:InvokeServer("MoneyPotion1")
Merchant:InvokeServer("MoneyPotion2")
Merchant:InvokeServer("MoneyPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Luck Pots",
CurrentValue=false,
Callback=function(v)
AutoLuckPot=v
if v then
task.spawn(function()
while AutoLuckPot do
Merchant:InvokeServer("LuckPotion1")
Merchant:InvokeServer("LuckPotion2")
Merchant:InvokeServer("LuckPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Bobber",
CurrentValue=false,
Callback=function(v)
AutoBobber=v
if v then
task.spawn(function()
while AutoBobber do
Merchant:InvokeServer("HeavyBobber")
Merchant:InvokeServer("LightBobber")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Brainrot",
CurrentValue=false,
Callback=function(v)
AutoBrainrot=v
if v then
task.spawn(function()
while AutoBrainrot do
Merchant:InvokeServer("BrainrotOffer")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy LuckyBlock",
CurrentValue=false,
Callback=function(v)
AutoLuckyBlock=v
if v then
task.spawn(function()
while AutoLuckyBlock do
Merchant:InvokeServer("StPatricksLuckyBlock")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Event Rod",
CurrentValue=false,
Callback=function(v)
AutoEventRod=v
if v then
task.spawn(function()
while AutoEventRod do
Merchant:InvokeServer("LeprechaunsRod")
task.wait(1)
end
end)
end
end
})
            end,
            Premium = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

local RemoteHandler = RS:WaitForChild("RemoteHandler")
local Fishing = RemoteHandler:WaitForChild("Fishing")
local Upgrade = RemoteHandler:WaitForChild("Upgrade")
local FishingRod = RemoteHandler:WaitForChild("FishingRod")
local RodMutation = RemoteHandler:WaitForChild("RodMutation")
local Merchant = RemoteHandler:WaitForChild("StPatricksMerchantBuy")

local Main = Window:CreateTab("Main",4483362458)
local Upgrades = Window:CreateTab("Upgrades",4483362458)
local Event = Window:CreateTab("Event",4483362458)

local AutoFishing=false
local AutoMoney=false
local AutoBase=false
local AutoFishPower=false
local AutoFishCatch=false
local AutoFishingRod=false
local AutoFishEffect=false
local AutoMoneyPot=false
local AutoLuckPot=false
local AutoBobber=false
local AutoBrainrot=false
local AutoLuckyBlock=false
local AutoEventRod=false

Main:CreateToggle({
Name="Auto Fishing",
CurrentValue=false,
Callback=function(v)
AutoFishing=v
if v then
task.spawn(function()
while AutoFishing do
Fishing:FireServer("Caught",math.huge)
task.wait(0.15)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Money",
CurrentValue=false,
Callback=function(v)
AutoMoney=v
if v then
task.spawn(function()
while AutoMoney do
for _,base in pairs(workspace.Bases:GetChildren()) do
if base:FindFirstChild("Objects") then
for _,plot in pairs(base.Objects:GetChildren()) do
local part=plot:FindFirstChild("CollectPart")
if part then
firetouchinterest(Root,part,0)
firetouchinterest(Root,part,1)
task.wait(0.03)
end
end
end
end
task.wait(0.2)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Base Level",
CurrentValue=false,
Callback=function(v)
AutoBase=v
if v then
task.spawn(function()
while AutoBase do
Upgrade:FireServer("BaseLevel")
task.wait(0.6)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Power",
CurrentValue=false,
Callback=function(v)
AutoFishPower=v
if v then
task.spawn(function()
while AutoFishPower do
Upgrade:FireServer("power10")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Catch",
CurrentValue=false,
Callback=function(v)
AutoFishCatch=v
if v then
task.spawn(function()
while AutoFishCatch do
Upgrade:FireServer("carry1")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fishing Rod",
CurrentValue=false,
Callback=function(v)
AutoFishingRod=v
if v then
task.spawn(function()
for i=1,18 do
if not AutoFishingRod then break end
FishingRod:FireServer("Buy","FishingRod"..i)
task.wait(0.6)
end
AutoFishingRod=false
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Effect",
CurrentValue=false,
Callback=function(v)
AutoFishEffect=v
if v then
task.spawn(function()
for i=1,7 do
if not AutoFishEffect then break end
RodMutation:FireServer("Buy","RodMutation"..i)
task.wait(0.6)
end
AutoFishEffect=false
end)
end
end
})

Event:CreateToggle({
Name="Auto Money Pots",
CurrentValue=false,
Callback=function(v)
AutoMoneyPot=v
if v then
task.spawn(function()
while AutoMoneyPot do
Merchant:InvokeServer("MoneyPotion1")
Merchant:InvokeServer("MoneyPotion2")
Merchant:InvokeServer("MoneyPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Luck Pots",
CurrentValue=false,
Callback=function(v)
AutoLuckPot=v
if v then
task.spawn(function()
while AutoLuckPot do
Merchant:InvokeServer("LuckPotion1")
Merchant:InvokeServer("LuckPotion2")
Merchant:InvokeServer("LuckPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Bobber",
CurrentValue=false,
Callback=function(v)
AutoBobber=v
if v then
task.spawn(function()
while AutoBobber do
Merchant:InvokeServer("HeavyBobber")
Merchant:InvokeServer("LightBobber")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Brainrot",
CurrentValue=false,
Callback=function(v)
AutoBrainrot=v
if v then
task.spawn(function()
while AutoBrainrot do
Merchant:InvokeServer("BrainrotOffer")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy LuckyBlock",
CurrentValue=false,
Callback=function(v)
AutoLuckyBlock=v
if v then
task.spawn(function()
while AutoLuckyBlock do
Merchant:InvokeServer("StPatricksLuckyBlock")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Event Rod",
CurrentValue=false,
Callback=function(v)
AutoEventRod=v
if v then
task.spawn(function()
while AutoEventRod do
Merchant:InvokeServer("LeprechaunsRod")
task.wait(1)
end
end)
end
end
})
            end
        },

        [99435399946069] = {
            Free = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

local RemoteHandler = RS:WaitForChild("RemoteHandler")
local Fishing = RemoteHandler:WaitForChild("Fishing")
local Upgrade = RemoteHandler:WaitForChild("Upgrade")
local FishingRod = RemoteHandler:WaitForChild("FishingRod")
local RodMutation = RemoteHandler:WaitForChild("RodMutation")
local Merchant = RemoteHandler:WaitForChild("StPatricksMerchantBuy")

local Main = Window:CreateTab("Main",4483362458)
local Upgrades = Window:CreateTab("Upgrades",4483362458)
local Event = Window:CreateTab("Event",4483362458)

local AutoFishing=false
local AutoMoney=false
local AutoBase=false
local AutoFishPower=false
local AutoFishCatch=false
local AutoFishingRod=false
local AutoFishEffect=false
local AutoMoneyPot=false
local AutoLuckPot=false
local AutoBobber=false
local AutoBrainrot=false
local AutoLuckyBlock=false
local AutoEventRod=false

Main:CreateToggle({
Name="Auto Fishing",
CurrentValue=false,
Callback=function(v)
AutoFishing=v
if v then
task.spawn(function()
while AutoFishing do
Fishing:FireServer("Caught",math.huge)
task.wait(0.15)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Money",
CurrentValue=false,
Callback=function(v)
AutoMoney=v
if v then
task.spawn(function()
while AutoMoney do
for _,base in pairs(workspace.Bases:GetChildren()) do
if base:FindFirstChild("Objects") then
for _,plot in pairs(base.Objects:GetChildren()) do
local part=plot:FindFirstChild("CollectPart")
if part then
firetouchinterest(Root,part,0)
firetouchinterest(Root,part,1)
task.wait(0.03)
end
end
end
end
task.wait(0.2)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Base Level",
CurrentValue=false,
Callback=function(v)
AutoBase=v
if v then
task.spawn(function()
while AutoBase do
Upgrade:FireServer("BaseLevel")
task.wait(0.6)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Power",
CurrentValue=false,
Callback=function(v)
AutoFishPower=v
if v then
task.spawn(function()
while AutoFishPower do
Upgrade:FireServer("power10")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Catch",
CurrentValue=false,
Callback=function(v)
AutoFishCatch=v
if v then
task.spawn(function()
while AutoFishCatch do
Upgrade:FireServer("carry1")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fishing Rod",
CurrentValue=false,
Callback=function(v)
AutoFishingRod=v
if v then
task.spawn(function()
for i=1,18 do
if not AutoFishingRod then break end
FishingRod:FireServer("Buy","FishingRod"..i)
task.wait(0.6)
end
AutoFishingRod=false
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Effect",
CurrentValue=false,
Callback=function(v)
AutoFishEffect=v
if v then
task.spawn(function()
for i=1,7 do
if not AutoFishEffect then break end
RodMutation:FireServer("Buy","RodMutation"..i)
task.wait(0.6)
end
AutoFishEffect=false
end)
end
end
})

Event:CreateToggle({
Name="Auto Money Pots",
CurrentValue=false,
Callback=function(v)
AutoMoneyPot=v
if v then
task.spawn(function()
while AutoMoneyPot do
Merchant:InvokeServer("MoneyPotion1")
Merchant:InvokeServer("MoneyPotion2")
Merchant:InvokeServer("MoneyPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Luck Pots",
CurrentValue=false,
Callback=function(v)
AutoLuckPot=v
if v then
task.spawn(function()
while AutoLuckPot do
Merchant:InvokeServer("LuckPotion1")
Merchant:InvokeServer("LuckPotion2")
Merchant:InvokeServer("LuckPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Bobber",
CurrentValue=false,
Callback=function(v)
AutoBobber=v
if v then
task.spawn(function()
while AutoBobber do
Merchant:InvokeServer("HeavyBobber")
Merchant:InvokeServer("LightBobber")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Brainrot",
CurrentValue=false,
Callback=function(v)
AutoBrainrot=v
if v then
task.spawn(function()
while AutoBrainrot do
Merchant:InvokeServer("BrainrotOffer")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy LuckyBlock",
CurrentValue=false,
Callback=function(v)
AutoLuckyBlock=v
if v then
task.spawn(function()
while AutoLuckyBlock do
Merchant:InvokeServer("StPatricksLuckyBlock")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Event Rod",
CurrentValue=false,
Callback=function(v)
AutoEventRod=v
if v then
task.spawn(function()
while AutoEventRod do
Merchant:InvokeServer("LeprechaunsRod")
task.wait(1)
end
end)
end
end
})
            end,
            Premium = function(Window)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

local RemoteHandler = RS:WaitForChild("RemoteHandler")
local Fishing = RemoteHandler:WaitForChild("Fishing")
local Upgrade = RemoteHandler:WaitForChild("Upgrade")
local FishingRod = RemoteHandler:WaitForChild("FishingRod")
local RodMutation = RemoteHandler:WaitForChild("RodMutation")
local Merchant = RemoteHandler:WaitForChild("StPatricksMerchantBuy")

local Main = Window:CreateTab("Main",4483362458)
local Upgrades = Window:CreateTab("Upgrades",4483362458)
local Event = Window:CreateTab("Event",4483362458)

local AutoFishing=false
local AutoMoney=false
local AutoBase=false
local AutoFishPower=false
local AutoFishCatch=false
local AutoFishingRod=false
local AutoFishEffect=false
local AutoMoneyPot=false
local AutoLuckPot=false
local AutoBobber=false
local AutoBrainrot=false
local AutoLuckyBlock=false
local AutoEventRod=false

Main:CreateToggle({
Name="Auto Fishing",
CurrentValue=false,
Callback=function(v)
AutoFishing=v
if v then
task.spawn(function()
while AutoFishing do
Fishing:FireServer("Caught",math.huge)
task.wait(0.15)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Money",
CurrentValue=false,
Callback=function(v)
AutoMoney=v
if v then
task.spawn(function()
while AutoMoney do
for _,base in pairs(workspace.Bases:GetChildren()) do
if base:FindFirstChild("Objects") then
for _,plot in pairs(base.Objects:GetChildren()) do
local part=plot:FindFirstChild("CollectPart")
if part then
firetouchinterest(Root,part,0)
firetouchinterest(Root,part,1)
task.wait(0.03)
end
end
end
end
task.wait(0.2)
end
end)
end
end
})

Main:CreateToggle({
Name="Auto Base Level",
CurrentValue=false,
Callback=function(v)
AutoBase=v
if v then
task.spawn(function()
while AutoBase do
Upgrade:FireServer("BaseLevel")
task.wait(0.6)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Power",
CurrentValue=false,
Callback=function(v)
AutoFishPower=v
if v then
task.spawn(function()
while AutoFishPower do
Upgrade:FireServer("power10")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Catch",
CurrentValue=false,
Callback=function(v)
AutoFishCatch=v
if v then
task.spawn(function()
while AutoFishCatch do
Upgrade:FireServer("carry1")
task.wait(0.7)
end
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fishing Rod",
CurrentValue=false,
Callback=function(v)
AutoFishingRod=v
if v then
task.spawn(function()
for i=1,18 do
if not AutoFishingRod then break end
FishingRod:FireServer("Buy","FishingRod"..i)
task.wait(0.6)
end
AutoFishingRod=false
end)
end
end
})

Upgrades:CreateToggle({
Name="Auto Fish Effect",
CurrentValue=false,
Callback=function(v)
AutoFishEffect=v
if v then
task.spawn(function()
for i=1,7 do
if not AutoFishEffect then break end
RodMutation:FireServer("Buy","RodMutation"..i)
task.wait(0.6)
end
AutoFishEffect=false
end)
end
end
})

Event:CreateToggle({
Name="Auto Money Pots",
CurrentValue=false,
Callback=function(v)
AutoMoneyPot=v
if v then
task.spawn(function()
while AutoMoneyPot do
Merchant:InvokeServer("MoneyPotion1")
Merchant:InvokeServer("MoneyPotion2")
Merchant:InvokeServer("MoneyPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Luck Pots",
CurrentValue=false,
Callback=function(v)
AutoLuckPot=v
if v then
task.spawn(function()
while AutoLuckPot do
Merchant:InvokeServer("LuckPotion1")
Merchant:InvokeServer("LuckPotion2")
Merchant:InvokeServer("LuckPotion3")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Bobber",
CurrentValue=false,
Callback=function(v)
AutoBobber=v
if v then
task.spawn(function()
while AutoBobber do
Merchant:InvokeServer("HeavyBobber")
Merchant:InvokeServer("LightBobber")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Brainrot",
CurrentValue=false,
Callback=function(v)
AutoBrainrot=v
if v then
task.spawn(function()
while AutoBrainrot do
Merchant:InvokeServer("BrainrotOffer")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy LuckyBlock",
CurrentValue=false,
Callback=function(v)
AutoLuckyBlock=v
if v then
task.spawn(function()
while AutoLuckyBlock do
Merchant:InvokeServer("StPatricksLuckyBlock")
task.wait(1)
end
end)
end
end
})

Event:CreateToggle({
Name="Auto Buy Event Rod",
CurrentValue=false,
Callback=function(v)
AutoEventRod=v
if v then
task.spawn(function()
while AutoEventRod do
Merchant:InvokeServer("LeprechaunsRod")
task.wait(1)
end
end)
end
end
})
            end
        },

        [1111116] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111117] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111118] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111119] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111120] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111121] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111122] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111123] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111124] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111125] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111126] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111127] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111128] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111129] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111130] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111131] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111132] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111133] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111134] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111135] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111136] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111137] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111138] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111139] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111140] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111141] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111142] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111143] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111144] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111145] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111146] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111147] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111148] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111149] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

        [1111150] = {
            Free = function(Window)

            end,
            Premium = function(Window)

            end
        },

    }

    --------------------------------------------------
    -- GAME DETECTION
    --------------------------------------------------

    local GameData = Games[game.PlaceId]

if GameData then
    if PremiumUser then
        GameData.Premium(Window)
    else
        GameData.Free(Window)
    end
else
    Rayfield:Notify({
        Title = "Unsupported Game",
        Content = "This game is not supported by the hub",
        Duration = 5
    })
	end
end

if SavedKey and CheckKey(SavedKey) then
    LoadHub()
    return
end

local Window = Rayfield:CreateWindow({
    Name = "Hub | Key System",
    LoadingTitle = "Authentication",
    LoadingSubtitle = "Enter Key"
})

local Tab = Window:CreateTab("Key")

local InputKey = ""

Tab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Paste your key",
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
    Name = "Submit Key",
    Callback = function()

        if CheckKey(InputKey) then

            writefile(FileName,InputKey)

            Rayfield:Notify({
                Title = "Key Accepted",
                Content = PremiumUser and "Premium Enabled" or "Free Version",
                Duration = 4
            })

            task.wait(1)

            Rayfield:Destroy()

            Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

            LoadHub()

        else

            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "Get a key from Discord",
                Duration = 4
            })

        end

    end
})
