local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RVXHub - PrisonLife", "Synapse")
       
        -- Main
        local Main = Window:NewTab("Main")
        local Gun = Main:NewSection("Gun Stuff")
        Gun:NewDropdown("GiveGun", "Gives The Player Gun", {"M9", "Remington 870", "AK-74"}, function(currentOption)
            Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[currentOption].ITEMPICKUP)
        end)

        Gun:NewDropdown("Gun Modder (PATCHED)", "Mods The Gun That Is Selected", {"M9", "Remington 870", "AK-74"}, function(currentOption)
            local module = nil
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(currentOption) then
                module = require(game:GetService("Players").LocalPlayer.Backpack[currentOption].GunStates)
            elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(currentOption) then
                module = require(game:GetService("Players").LocalPlayer.Backpack[currentOption].GunStates)
            end
            if module ~= nil then
                module["MaxAmmo"] = 99999999999999
                module["CurrentAmmo"] = 99999999999999
                module["StoredAmmo"] = 99999999999999
                module["Damage"] = 99999999999999
                module["Bullets"] = 9999999999999
                module["ReloadTime"] = 0.00000001
                module["AutoFire"] = true
            end
        end)


        -- Player
        local Player = Window:NewTab("Local Player")
        local MovementSection = Player:NewSection("Movement")
        MovementSection:NewSlider("WalkSpeed", "Changes Player's Speed", 200, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        end)

        MovementSection:NewSlider("Jumppower", "Changes Player's JumpPower", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
        end)

        local HumanoidSection = Player:NewSection("Humanoid")
        
        HumanoidSection:NewButton("Noclip (PRESS E TO ACTIVATE)", "Walk Thro Walls (PRESS B TO ACTIVATE)", function()
            loadstring(game:HttpGet('https://pastebin.com/raw/aH7AFwGq'))()
        end)