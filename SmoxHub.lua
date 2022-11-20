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
end
