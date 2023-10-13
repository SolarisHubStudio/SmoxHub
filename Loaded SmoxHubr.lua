
local Players = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("SmoxHub | Prison Life", "DarkTheme")

    local LocalPlayerTab = Window:NewTab("Local Player")
    local CombatTab = Window:NewTab("Combat")
    local UtilitiesTab = Window:NewTab("Utilities")
    local TeleportationTab = Window:NewTab("Teleportation")

    local LocalPlayerSection = LocalPlayerTab:NewSection("Local Player")
    local CombatSection = CombatTab:NewSection("Combat")
    local UtilitiesSection = UtilitiesTab:NewSection("Utilities")
    local TeleportationSection = TeleportationTab:NewSection("Teleportation")

    LocalPlayerSection:NewSlider("Walkspeed", "Makes your speed faster", 120, 15, function(v)
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    LocalPlayerSection:NewSlider("Jumppower", "Makes your jump high", 120, 50, function(v)
        Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)

    LocalPlayerSection:NewLabel("Change Team")

    LocalPlayerSection:NewButton("Guards", "Become guard team", function()
        Workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    LocalPlayerSection:NewButton("Inmates", "Become inmates team", function()
        Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)

    LocalPlayerSection:NewButton("Criminals", "Become criminals team", function()
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
    end)

    CombatSection:NewButton("Get Guns", "Get all the guns", function()
        local Start = Players.Character.HumanoidRootPart.CFrame

        Players.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP.CFrame
        wait(0.2)
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)
     
        Players.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
        wait(0.2)
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)
     
        Players.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP.CFrame
        wait(0.2)
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)
          
        Players.Character.HumanoidRootPart.CFrame = Start
    end)

    CombatSection:NewButton("M9", "Get the m9", function()
        local Start = Players.Character.HumanoidRootPart.CFrame

        Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)

        Players.Character.HumanoidRootPart.CFrame = Start
    end)

    CombatSection:NewButton("Remington 870", "Get the remington 870", function()
        local Start = Players.Character.HumanoidRootPart.CFrame

        Players.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
        wait(0.2)
        Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)

        Players.Character.HumanoidRootPart.CFrame = Start
    end)

    CombatSection:NewButton("AK-47", "Get the ak-47", function()
        local Start = Players.Character.HumanoidRootPart.CFrame

        Players.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP.CFrame
        wait(0.2)
        Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)

        Players.Character.HumanoidRootPart.CFrame = Start
    end)

    CombatSection:NewLabel("Guns Mod")

    CombatSection:NewDropdown("Guns Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
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

    UtilitiesSection:NewToggle("Doors", "Toggle for doors", function()
        if Workspace:FindFirstChild("Doors") then
            Workspace.Doors.Parent = Lighting
            
         else
            Lighting.Doors.Parent = Workspace
        end
    end)

    UtilitiesSection:NewToggle("Fences", "Toggle for fences", function()
    if Workspace:FindFirstChild("Prison_Fences") then
            Workspace.Prison_Fences.Parent = Lighting
        else
            Lighting.Prison_Fences.Parent = Workspace
        end
    end)

    TeleportationSection:NewLabel("Locations")

    TeleportationSection:NewButton("Outside Prison", "Teleport to outside prison", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731) 
    end)
    
    TeleportationSection:NewButton("Yard", "Teleport to yard", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
    end)

    TeleportationSection:NewButton("Tower", "Teleport to tower", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
    end)

    TeleportationSection:NewButton("Cafeteria", "Teleport to cafeteria", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
    end)

    TeleportationSection:NewButton("Kitchen", "Teleport to kitchen", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
    end)

    TeleportationSection:NewButton("Cells", "Teleport to cells", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
    end)
    
    TeleportationSection:NewButton("Guards Room", "Teleport to guards room", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
    end)

    TeleportationSection:NewButton("Guards Armory", "Teleport to guards armory", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
    end)

    TeleportationSection:NewButton("Sewer Enterance", "Teleport to sewer enterance", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
    end)

    TeleportationSection:NewButton("Sewer Exit", "Teleport to sewer exit", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
    end)

    TeleportationSection:NewButton("Criminal Base", "Teleport to criminal base", function()
        Players.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
    end)
end