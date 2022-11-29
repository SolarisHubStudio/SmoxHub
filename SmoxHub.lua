    local Lighting = game:GetService("Lighting")
    if game.PlaceId == 155615604 then
        local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
        local win = DiscordLib:Window("SmoxHub (Prison Life)")
        local serv = win:Server("Preview", "")
        local MainBtns = serv:Channel("Main")
        local LocalPlayerBtn = serv:Channel("Local Player")
        local SeverClientBtn = serv:Channel("Server Client")

        local TeleportService = game:GetService("TeleportService")

        MainBtns:Dropdown("Guns", {"M9", "Remington 870", "AK-47"}, function(v)
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        end)

        MainBtns:Dropdown("Guns Mod", {"M9", "Remington 870", "AK-47"}, function(v)
            local module = nil
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
                module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
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
        end)

        LocalPlayerBtn:Slider("WalkSpeed",0, 1000, 16, function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end)

        LocalPlayerBtn:Slider("JumpPower", 0, 1000, 16, function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end)
        
        LocalPlayerBtn:Button("Fast Respawn", function()
            local A_1 = "\66\114\111\121\111\117\98\97\100\100"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(A_1)    
        end)
        
        LocalPlayerBtn:Button("Rejoin", function()
            TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)   
        end)

        LocalPlayerBtn:Label("Change Team")

        LocalPlayerBtn:Button("Guards", function()
            workspace.Remote.TeamEvent:FireServer("Bright blue")
        end)

        LocalPlayerBtn:Button("Inmates", function()
            workspace.Remote.TeamEvent:FireServer("Bright orange")
        end)

        LocalPlayerBtn:Button("Neutral ", function()
            workspace.Remote.TeamEvent:FireServer("Medium stone grey")
        end)

        LocalPlayerBtn:Label("Teleport Location")

        LocalPlayerBtn:Button("Outside Prison", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731) 
        end)
        
        LocalPlayerBtn:Button("Yard", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
        end)

        LocalPlayerBtn:Button("Tower", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
        end)

        LocalPlayerBtn:Button("Cafeteria", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
        end)

        LocalPlayerBtn:Button("Kitchen", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
        end)

        LocalPlayerBtn:Button("Cells", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
        end)
        
        LocalPlayerBtn:Button("Guards Room", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
        end)

        LocalPlayerBtn:Button("Guards Armory", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
        end)

        LocalPlayerBtn:Button("Sewer Enterance", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
        end)

        LocalPlayerBtn:Button("Sewer Exit", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
        end)

        LocalPlayerBtn:Button("Secret Room", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(697, 97.492, 2364)
        end)

        LocalPlayerBtn:Button("Surveilance Room", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
        end)

        LocalPlayerBtn:Button("Criminal Base", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
        end)

        SeverClientBtn:Button("Server Crash", function()
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
        end)

        SeverClientBtn:Button("Open Gate", function()
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
        end)

        elseif game.PlaceId == 8888615802 then

            local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
            local win = DiscordLib:Window("SmoxHub (Rainbow Friends)")
            local serv = win:Server("Preview", "")
            local ESPBtn = serv:Channel("ESP")
            local LightingBtn = serv:Channel("Lighting")
            local ItemBtn = serv:Channel("Item")

            ESPBtn:Button("Monsters", function()
                local settings = {

                    fillcolor = Color3.fromRGB(0, 255, 255),
                    filltransparency = 0.75,
                
                    outlinecolor = Color3.fromRGB(0, 255, 255),
                    outlinetransparency = 0,
                }
                
                local plr = game.Players.LocalPlayer
                local highlights = Instance.new("Folder", game:service("CoreGui"))

                local function addhighlight(object)
                    local highlight = Instance.new("Highlight", highlights)
                    highlight.Adornee = object

                    highlight.FillColor = settings.fillcolor
                    highlight.FillTransparency = settings.filltransparency

                    highlight.OutlineColor = settings.outlinecolor
                    highlight.OutlineTransparency = settings.outlinetransparency

                    highlight.Adornee.Changed:Connect(function()
                        if not highlight.Adornee or not highlight.Adornee.Parent then
                            highlight:Destroy()
                        end
                    end)

                    return highlight
                end

                local function addto(object)
                    if object:IsA("Model") then
                        addhighlight(object)
                    end
                end

                for _, v in pairs(workspace.Monsters:GetDescendants()) do
                    addto(v)
                end

                workspace.Monsters.DescendantAdded:Connect(function(v)
                    addto(v)
            end)

    Section:NewButton("Items", "ButtonInfo", function()
        local itemsOfInterest = Instance.new("Model", workspace)
    itemsOfInterest.Name = "Items of Interest"

    for i, v in pairs (workspace:GetChildren()) do
    if v.Name == "Battery" or (v.Name:find("^Block") and v:IsA("Model")) or (v.Name:find("^Food") and v:IsA("Model")) or (v.Name:find("^Fuse") and v:IsA("Model")) then
    v.Parent = itemsOfInterest
    end
    end

    local highlight = Instance.new("Highlight")
    highlight.Parent = itemsOfInterest
    highlight.Adornee = itemsOfInterest
    highlight.FillColor = Color3.new(0, 255, 0)
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.75
    end)
            end)

            ESPBtn:Button("Items", function()
                local itemsOfInterest = Instance.new("Model", workspace)
                itemsOfInterest.Name = "Items of Interest"

                for i, v in pairs (workspace:GetChildren()) do
                    if v.Name == "Battery" or (v.Name:find("^Block") and v:IsA("Model")) or (v.Name:find("^Food") and v:IsA("Model")) or (v.Name:find("^Fuse") and v:IsA("Model")) then
                        v.Parent = itemsOfInterest
                    end
                end

                local highlight = Instance.new("Highlight")
                highlight.Parent = itemsOfInterest
                highlight.Adornee = itemsOfInterest
                highlight.FillColor = Color3.new(0, 255, 0)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillTransparency = 0.75
            end)

            ESPBtn:Button("Player ESP", function()
                _G.FriendColor = Color3.fromRGB(0, 0, 255)
                _G.EnemyColor = Color3.fromRGB(255, 0, 0)
                _G.UseTeamColor = true
            end)

        LightingBtn:Button("Full Bright", function()
            if not _G.FullBrightExecuted then

                _G.FullBrightEnabled = false
            
                _G.NormalLightingSettings = {
                    Brightness = game:GetService("Lighting").Brightness,
                    ClockTime = game:GetService("Lighting").ClockTime,
                    FogEnd = game:GetService("Lighting").FogEnd,
                    GlobalShadows = game:GetService("Lighting").GlobalShadows,
                    Ambient = game:GetService("Lighting").Ambient
                }
            
                game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                    if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                        _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                        if not _G.FullBrightEnabled then
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").Brightness = 1
                    end
                end)
            
                game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                    if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                        _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                        if not _G.FullBrightEnabled then
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").ClockTime = 12
                    end
                end)
            
                game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                    if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                        _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                        if not _G.FullBrightEnabled then
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").FogEnd = 786543
                    end
                end)
            
                game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                    if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                        _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                        if not _G.FullBrightEnabled then
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").GlobalShadows = false
                    end
                end)
            
                game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                    if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                        _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                        if not _G.FullBrightEnabled then
                            repeat
                                wait()
                            until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                    end
                end)
            
                game:GetService("Lighting").Brightness = 1
                game:GetService("Lighting").ClockTime = 12
                game:GetService("Lighting").FogEnd = 786543
                game:GetService("Lighting").GlobalShadows = false
                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            
                local LatestValue = true
                spawn(function()
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                    while wait() do
                        if _G.FullBrightEnabled ~= LatestValue then
                            if not _G.FullBrightEnabled then
                                game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                                game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                                game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                                game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                                game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                            else
                                game:GetService("Lighting").Brightness = 1
                                game:GetService("Lighting").ClockTime = 12
                                game:GetService("Lighting").FogEnd = 786543
                                game:GetService("Lighting").GlobalShadows = false
                                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                            end
                            LatestValue = not LatestValue
                        end
                    end
                end)
            end
            
            _G.FullBrightExecuted = true
            _G.FullBrightEnabled = not _G.FullBrightEnabled
        end)

        ItemBtn:Button("Get Item", function()
            for i,v in pairs(game.workspace.Map_C1.ItemSpawns:GetDescendants()) do
                if v.name == "ItemSpawn" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                    wait(0.1)
                end
            end
        end)

        ItemBtn:Button("Sent Items", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(371.54364013671875, 45.604129791259766, 132.65687561035156)
        end)

        elseif game.PlaceId == 1962086868 then
            local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
            local win = DiscordLib:Window("SmoxHub (Tower of Hell)")
            local serv = win:Server("Preview", "")
            local MainBtn = serv:Channel("Main")
            local MessageBotBtn = serv:Channel("MessageBot")


            MainBtn:Button("God Mode", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/MSZAznxp", true))()
            end)

            MainBtn:Button("Control TP", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/rS2DBx4Y", true))()
            end)

            MainBtn:Button("Control TP", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/rS2DBx4Y", true))()
            end)

            MainBtn:Button("Give All Tools", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/ngVWmQ8m", true))()
            end)

            MainBtn:Button("Instant Win", function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.tower.sections.finish.exit.ParticleBrick.CFrame
            end)

            MainBtn:Button("Inf Jump", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/WUquqYN0", true))()
            end)

            MainBtn:Button("AntiKick", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/BMGbkQ71", true))()
            end)

            MessageBotBtn:Button("Send Bot Message", function()
                loadstring(game:HttpGet("https://pastebin.com/raw/sqkeaRjG", true))()
            end)

            elseif game.PlaceId == 4003872968 then
                local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
                local win = DiscordLib:Window("SmoxHub (Giant Survival!)")
                local serv = win:Server("Preview", "")
                local WeaponsBtn = serv:Channel("Weapons")
                local MoneyBtn = serv:Channel("Money")

                WeaponsBtn:Button("Best Weapons", function()
                    local A_1 =
                    {
                        [1] =
                    {
                        [1] = false
                    },
                        [2] =
                    {
                        [1] = 2
                    }
                    }
                    local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].weaponunequipped
                    Event:FireServer(A_1)
                    
                    local A_1 =
                    {
                        [1] =
                    {
                        [1] = "Crazy Futuristic Minigun"
                    },
                        [2] =
                    {
                        [1] = false
                    }
                    }

                    local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].weaponequipped
                    Event:FireServer(A_1)

                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                end)

                MoneyBtn:Button("Unlimited Money", function()
                    local args = {{false}, {2}}
                    _G.d = true

                    while _G.d == true and wait() do
                        local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].currencycollected
                        Event:FireServer(args)
                    end
                end)

                elseif game.PlaceId == 4924922222 then

                local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
                local win = DiscordLib:Window("SmoxHub (Brookhaven 🏡 RP)")
                local serv = win:Server("Preview", "")
                local PlayerBtn = serv:Channel("Player")
                local LoadStringBtn = serv:Channel("LoadString")   

                PlayerBtn :Slider("WalkSpeed",0, 1000, 16, function(v)
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
                end)
        
                PlayerBtn:Slider("JumpPower", 0, 1000, 16, function(v)
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
                end)

                LoadStringBtn:Button("Reviz Admin", function()
                    loadstring(game:HttpGet(("https://raw.githubusercontent.com/RealJasonJaco/Reviz-Admin/main/Reviz%20Admin.lua"), true))()
                end)

                elseif game.PlaceId == 2768379856 then

                    local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
                    local win = DiscordLib:Window("SmoxHub (3008)")
                    local serv = win:Server("Preview", "")
                    local MainBtn = serv:Channel("Main")

                    local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/RealJasonJaco/ESP/main/ESP.lua"))()
                    ESP:Toggle(true)
                    ESP.Players = false
                    ESP.Tracers = false
                    ESP.Boxes = false
                    ESP.Names = false

                    local function notify(message)
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "CheatSub";
                            Text = message;
                            Icon = "";
                            Duration = 5;
                        })
                     end

                     local function teleportToItem(itemName)
                        local donesearch = false
                        for i,v in pairs(game:GetService("Workspace").GameObjects.Physical.Items:GetDescendants()) do
                            if v.Name == "Root" and v.Parent.Name == itemName then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                                donesearch = true
                                break
                            end
                        end
                        if donesearch == false then
                            notify("Item position not defined")
                        end
                     end


                     ESP:AddObjectListener(game:GetService("Workspace").GameObjects.Physical.Items, {
                        Type = "Model",
                        Color = Color3.fromRGB(0, 119, 255),
                        IsEnabled = "itemESP"
                     })

                     ESP:AddObjectListener(game:GetService("Workspace").GameObjects.Physical.Employees, {
                        Type = "Model",
                        CustomName = "Employee",
                        Color = Color3.fromRGB(255, 0, 4),
                        IsEnabled = "employeeToggle"
                     })

                     MainBtn:Button("Unlock Third Person", function()
                        game.Players.LocalPlayer.CameraMaxZoomDistance = 50
                        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
                     end)

                     MainBtn:Label("ESP Toggle")

                     MainBtn:Toggle("ESP", false, function(Value)
                         ESP.Boxes = Value
                     end)
                     
                     MainBtn:Toggle("ESP Tracers", false, function(Value)
                        ESP.Tracers = Value
                    end)

                    MainBtn:Toggle("ESP Nametags", false, function(Value)
                        ESP.Names = Value
                    end)

                    MainBtn:Toggle("Show Players", false, function(Value)
                        ESP.Players = Value
                    end)

                    MainBtn:Toggle("Show Employees", false, function(Value)
                        ESP.employeeToggle = Value
                    end)

                    MainBtn:Toggle("Show Items", false, function(Value)
                        ESP.itemESP = Value
                    end)

                    MainBtn:Label("Teleport Location")

                    MainBtn:Button("Teleport to Hotdog", function()
                        teleportToItem("Hotdog")
                     end)

                     MainBtn:Button("Teleport to Pizza", function()
                        teleportToItem("Pizza")
                     end)

                     MainBtn:Button("Teleport to Burger", function()
                        teleportToItem("Burger")
                     end)


                     MainBtn:Button("Teleport to Medkit", function()
                        teleportToItem("Medkit")
                     end)
    end
