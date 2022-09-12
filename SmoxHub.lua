local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Key System", HidePremium = false, SaveConfig = true, IntroEnabled = false})

local TeleportService = game:GetService("TeleportService")
local Player = game.Players.LocalPlayer

OrionLib:MakeNotification({

    Name = "Hello "..Player.Name,
	Content = "Please login before use SmoxHub",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.key = "Fq#M8MJD6tNVdvCNrF+Zpj73qUhQ4xpqmPsZSYE52QQxk%*XhC!8USWMJu$ujm@j"
_G.keyInput = "string"

function MakeScriptHub()
    if game.PlaceId == 155615604 then
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "SmoxHub", HidePremium = false, PremiumOnly = false, SaveConfig = true, IntroEnabled = false})

        local Tab = Window:MakeTab({

            Name = "Main",
            PremiumOnly = false,
            HidePremium = false,
        })

        Tab:AddDropdown({

            Name = "Guns",
            PremiumOnly = false,
            HidePremium = false,
            Options = {"M9", "Remington 870", "AK-47"},

            Callback = function(v)
                local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
                local Event = game:GetService("Workspace").Remote.ItemHandler
                Event:InvokeServer(A_1)
            end
        })

        Tab:AddDropdown({
            Name = "Guns Mod",
            PremiumOnly = false,
            HidePremium = false,
            Options = {"M9", "Taser", "Remington 870", "AK-47"},


            Callback = function(v)
                local module = nil
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
                    module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v)  then
                        module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
                end
                if module ~= nil then
                    module["MaxAmmo"] = math.huge
                    module["CurrentAmmo"] = math.huge
                    module["StoredAmmo"] = math.huge
                    module["FireRate"] = 0.000001
                    module["Spread"] = 0
                    module["Range"] = math.huge
                    module["Bullets"] = 10
                    module["ReloadTime"] = 0.000001
                    module["AutoFire"] = true
                end
            end
        })

        local Tab = Window:MakeTab({

            Name = "Local Player",
            PremiumOnly = false,
            HidePremium = false,
    
        })
    
        Tab:AddSlider({
    
            Name = "WalkSpeed",
            PremiumOnly = false,
            HidePremium = false,
            Min = 0,
            Max = 250,
            Default = 16,
            Color = Color3.fromRGB(60, 255, 0),
            
            Callback = function(v)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
            end
        })

        Tab:AddSlider({
    
            Name = "JumpPower",
            PremiumOnly = false,
            HidePremium = false,
            Min = 0,
            Max = 250,
            Default = 50,
            Color = Color3.fromRGB(60, 255, 0),
            
            Callback = function(v)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
            end
        })

        Tab:AddButton({

            Name = "Fast Respawn",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
            local A_1 = "\66\114\111\121\111\117\98\97\100\100"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(A_1)
         end
        })

        Tab:AddButton({

            Name = "Rejoin",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
            end
        })

        Tab:AddLabel("Change Teams")

        Tab:AddButton({

            Name = "Guards",
            PremiumOnly = false,
            HidePremium = false,
            Callback = function(Workspace)
                workspace.Remote.TeamEvent:FireServer("Bright blue")
            end
        })

        Tab:AddButton({

            Name = "Inmates",
            PremiumOnly = false,
            HidePremium = false,
            
            Callback = function(Workspace)
                workspace.Remote.TeamEvent:FireServer("Bright orange")
            end
        })

        Tab:AddButton({

            Name = "Neutral",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function(Workspace)
                workspace.Remote.TeamEvent:FireServer("Medium stone grey")
            end
        })

        Tab:AddLabel("Teleport Location")

        Tab:AddButton({

            Name = "Outside Prison",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731)
            end
        })

        Tab:AddButton({

            Name = "Yard",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
            end
        })

        Tab:AddButton({

            Name = "Tower",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
            end
        })

        Tab:AddButton({

            Name = "Cafeteria",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
            end
        })

        Tab:AddButton({

            Name = "Kitchen",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
            end
        })

        Tab:AddButton({

            Name = "Cells",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
            end
        })

        Tab:AddButton({

            Name = "Police Room",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
            end
        })

        Tab:AddButton({

            Name = "Police Armory",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
            end
        })

        Tab:AddButton({

            Name = "Sewer Enterance",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
            end
        })

        Tab:AddButton({

            Name = "Sewer Exit",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
            end
        })

        Tab:AddButton({

            Name = "Secret Room",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(697, 97.492, 2364)
            end
        })

        Tab:AddButton({

            Name = "Surveilance Room",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
            end
        })
    
        Tab:AddButton({

            Name = "Criminal Base",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
            end
        })

        local Tab = Window:MakeTab({

            Name = "Server",
            PremiumOnly = false,
            HidePremium = false,
        })

        Tab:AddButton({

            Name = "Server Crash",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                OrionLib:MakeNotification({

                    Name = "Sever Crash",
                    Content = "The Server will being crash in 30 seconds",
                })

                wait(30)

                local Gun = "Remington 870"
                local Player = game.Players.LocalPlayer.Name
                game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Gun].ITEMPICKUP)
                for i,v in pairs(game.Players[Player].Backpack:GetChildren()) do
                    if v.name == (Gun) then
                        v.Parent = game.Players.LocalPlayer.Character
                    end
                end
                Gun = game.Players[Player].Character[Gun]
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

                function FireGun()
                    coroutine.resume(coroutine.create(function()
                        local bulletTable = {}
                        table.insert(bulletTable, {
                            Hit = target,
                            Distance = 100,
                            Cframe = CFrame.new(0,1,1),
                            RayObject = Ray.new(Vector3.new(0.1,0.2), Vector3.new(0.3,0.4))
                        })
                        game.ReplicatedStorage.ShootEvent:FireServer(bulletTable, Gun)
                        wait()
                    end))
                end
                while game:GetService("RunService").Stepped:wait() do
                    for count = 0, 10, 10 do
                        FireGun()
                    end
                end
            end
        })

        Tab:AddButton({

            Name = "Open Gate",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
            end
        })

        Tab:AddToggle({

            Name = "Doors",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                if workspace:FindFirstChild("Doors") then
                    workspace.Doors.Parent = game.Lighting
                    else
                        game.Lighting.Doors.Parent = workspace
                end
            end
        })

        Tab:AddToggle({

            Name = "Fences",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                if workspace:FindFirstChild("Prison_Fences") then
                    workspace.Prison_Fences.Parent = game.Lighting
                    else
                        game.Lighting.Prison_Fences.Parent = workspace
                end
            end
        })
       
        elseif game.PlaceId == 7772810845 then
         local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
         local Window = OrionLib:MakeWindow({Name = "SmoxHub", HidePremium = false, PremiumOnly = false, SaveConfig = true, IntroEnabled = false})

        local Workspace = game:GetService("Workspace")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local VirtualUser = game:GetService("VirtualUser")
        local UIS = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local Tab = Window:MakeTab({

            Name = "Local Player",
            PremiumOnly = false,
            HidePremium = false
        })

        Tab:AddSlider({

            Name = "WalkSpeed",
            PremiumOnly = false,
            HidePremium = false,

            Min = 0,
            Max = 250,
            Default = 16,
            Color = Color3.fromRGB(60, 255, 0),

            Callback = function(v)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
            end
        })


        Tab:AddSlider({

            Name = "JumpPower",
            PremiumOnly = false,
            HidePremium = false,

            Min = 0,
            Max = 250,
            Default = 16,
            Color = Color3.fromRGB(60, 255, 0),

            Callback = function(v)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
            end
        })

        Tab:AddLabel("Teleport Location")

        Tab:AddButton({

            Name = "Street",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(54.4540291, 3.09297752, 117.169495) 
            end
        })

        Tab:AddButton({

            Name = "Sit in Teacher's Chair",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(34.9976883, 20.7799644, -5.02423, 0.048455216, 9.29976959e-05, 0.998825371, -0.00180156284, 0.999998391, -5.7091338e-06, -0.998823702, -0.00179917004, 0.0484553054)
	            LocalPlayer.Character.Humanoid.Sit = true
            end
        })

        Tab:AddButton({

            Name = "Class",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(31.7222672, 24.0017262, -5.10098886)
            end
        })

        Tab:AddButton({

            Name = "Toilet",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19.4476147, -47.5020065, -1575.3125)
            end
        })


        Tab:AddButton({

            Name = "Return to your sit",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                for i, Seat in pairs(Workspace:GetChildren()) do
                    if Seat.Name == "shool desk" and Seat:FindFirstChild("StudentSeat") then
                        if Seat.StudentSeat.User.Value == LocalPlayer.Name then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Seat.StudentSeat.CFrame
                            Seat.StudentSeat:Sit()
                        end
                    end
                end
            end
        })

        local Tab = Window:MakeTab({

            Name = "Exploit",
            PremiumOnly = false,
            HidePremium = false,
        })

        Tab:AddButton({

            Name = "Redeem All Codes",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                
                local Codes = {

                    "push-ups",
                    "220kmembers",
                    "210kmembers",
                    "Poop",
                    "toilet",
                    "itsaboutdriveitsaboutpower",
                    "intensesilence",
                    "azureoptix",
                    "teachermadcuzbad",
                    "10points",
                    "Bookworm",
                    "NikkoCoder"
                }

                for i, Code in ipairs(Codes) do wait()
                ReplicatedStorage.RedeemCode:InvokeServer(Code)
            end
        end
        })

        Tab:AddButton({

            Name = "Remove Doors",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                for i, Part in pairs(Workspace:GetChildren()) do
                    if Part.Name == "Door" then
                        Part:Destroy()
                    end
                end
            end
        })

        Tab:AddButton({

            Name = "Remove Window",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                for i, Part in pairs(Workspace:GetChildren()) do
                    if Part.Name == "Window" then
                        Window.Parent = game.Lighting
                        Part:Destroy()
                    end
                end
            end
        })

        Tab:AddButton({

            Name = "Stand Up",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                Workspace[LocalPlayer.Name].Sit:Remove()
                wait()
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
                LocalPlayer.Character.Humanoid.JumpPower = 50
            end
        })

        Tab:AddButton({

            Name = "Sit Down",
            PremiumOnly = false,
            HidePremium = false,

            Callback = function()
                LocalPlayer.Character.Humanoid.Sit = true
            end
        })
    end
end

function CorrectKey()
    OrionLib:MakeNotification({

        Name = "Correct Key",
        Content = "Welcome "..Player.Name,
        Time = 5
    })
end

function IncorrectKey()
    OrionLib:MakeNotification({
        Name = "Incorrect key",
        Content = "The key is incorrect please try again",
        Time = 5
    })
end

function CopyKey()
    OrionLib:MakeNotification({

        Name = "Key",
        Content = "You copy the key",
        Time = 5
    })
end

local Tab = Window:MakeTab({

    Name = "Login",
    PremiumOnly = false
})

Tab:AddTextbox({

    Name = "Enter key",
    Default = "",
    TextDisappear  = true,

    Callback = function(Value)
        _G.keyInput = Value
    end
})


Tab:AddButton({

    Name = "Check Key",
    Callback = function()
        if _G.keyInput == _G.key then
            CorrectKey()
            wait(5)
            MakeScriptHub()
            else
                IncorrectKey()
        end
    end
})

local Tab = Window:MakeTab({

    Name = "Get key",
})

Tab:AddButton({

    Name = "Get the key",

    Callback = function()
        CopyKey()
        setclipboard("https://erick-denis-david-exploits.erickdenisdavid.repl.co/Key.html")
    end
})
