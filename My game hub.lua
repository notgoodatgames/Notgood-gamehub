if game.PlaceId == 3956818381 then 
 

    getgenv().autoTap = false 
    getgenv().autoSword = false 
    getgenv().autoBelt = false 
    getgenv().autoRank = false 
    function doTap() 
        spawn(function() 
             while autoTap == true do 
                local A_1 = "swingKatana" 
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1)
                wait(0.1) 
            end  
        end) 
    end 

    
    function doSword() 
        spawn(function() 
            while autoSword == true do 
                local A_1 = "buyAllSwords"
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2)
                wait(0.5) 
            end 
        end) 
    end
    
    function doBelt() 
        spawn(function() 
            while autoBelt == true do 
                local A_1 = "buyAllBelts" 
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2) 
                wait(0.5) 
            end 
        end) 
    end 
    
   
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Tevita Gui", "Synapse") 
    
    local Main = Window:NewTab("Main")
    local Section = Main:NewSection("Main") 
    
    MainSection:NewToggle("AutoSwings", "auto swings for you", function(state)
        if state then 
            autoTap = state 
            doTap()
            print("Toggle On")
        else 
            autoTap = false 
            print("Toggle Off")
        end
    end) 
    
    MainSection:NewToggle("autoSword", "buys Swords for you", function(state)
        if state then 
            autoSword = state 
            doSword()
            print("Toggle On")
        else 
             autoSword = false 
            print("Toggle Off")
        end
    end) 
    
    MainSection:NewToggle("AutoBelt", "Auto Buys Belts for you", function(state)
         if state then 
            autoBelt = state 
            doBelt()
            print("Toggle On")
        else 
            autoBelt = false 
            print("Toggle Off")
        end
    end) 
    
    MainSection:NewToggle("Auto Sell", "Makes your player autosell", function(v)
        getgenv().autosell = v
            while true do 
                if getgenv().autoswing == false then return end
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait(0.1)
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
                wait(0.1)
            end
        end) 
        MainSection:NewButton("Unlock all islands", "Unlocks all islands", function()
            local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(0.1)
            end
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
        end) 
     

elseif game.PlaceId == 155615604 then 
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()local Window = Library.CreateLib("Prison Life", "Sentinel") 

    local Main = Window:NewTab("Main")  
    local MainSection = Main:NewSection("Main")
        
    MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end) 

    MainSection:NewButton("Gun mod", "Makes your gun op", function(v) 
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end 
        if module ~= nil then 
            module["Damage"] = math.huge 
            print("Clicked") 
        end
    end)  

    MainSection:NewToggle("Noclip", "Makes you go through walls", function(state)
        if state then 
            noclip = state
            game:GetService('RunService').Stepped:connect(function()
            if noclip then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
            end)
            plr = game.Players.LocalPlayer
            mouse = plr:GetMouse()
            
            print("Toggle On")
        else 
            noclip = false
            print("Toggle Off")
        end
    end) 
    
     MainSection:NewToggle("KillArua", "Kills people when they are near you", function(state)
        if state then 
           _G.Runningg = true
            while _G.Runningg == true do wait()
		    for i,v in pairs(game.Players:GetChildren()) do
		    	if v.Name ~= game.Players.LocalPlayer.Name then
				    local tbl_main = 
					    {
						    v
					    }
			    	game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(tbl_main))
		    	end
	    	end
	    end
         print("Toggle On")
        else 
            _G.Runningg = false
            print("Toggle Off")
        end
    end) 

    MainSection:NewButton("GodMode", "No one can kill you", function() 
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character.Humanoid
        
        print('Godmode working.')
        
        Humanoid.MaxHealth = 999999
        Humanoid.Health = Humanoid.MaxHealth / 2
        
        Humanoid.HealthChanged:connect(function()
        	if Humanoid.Health < 10 then
        		Humanoid.Health = Humanoid.MaxHealth
	        end
        end)
        print("Clicked")
    end) 
    
    MainSection:NewButton("Invis", "No one can see you", function() 
        local player = game.Players.LocalPlayer
        position = player.Character.HumanoidRootPart.Position
        wait(0.1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(0.1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(0.1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait()

        print("Clicked")
    end) 
    
    MainSection:NewButton("Removes Walls", "Takes away Walls", function() 
        wait(0.1)
        game.Workspace.Prison_Guard_Outpost:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.building:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.glass:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.oven:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.shelves:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.vents:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.accents:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.vendingmachine:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.Prison_table1:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.counter:Remove()
         
        wait(0.1)
        game.Workspace.Prison_Cafeteria.boxes:Remove()
        print("Clicked")
    end)
        
    MainSection:NewButton("ArrestsCrims", "arrests all Crims", function() 
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
        local i = 10
            repeat
            wait()
            i = i-1
            game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        Player.Character.HumanoidRootPart.CFrame = cpos
        print("Clicked")
    end)    
        
    MainSection:NewButton("Lag server", "", function() 
        while true do
            workspace.Remote.TeamEvent:FireServer("Bright blue")
            for i = 10,500 do
                for i,v in pairs(Workspace.Prison_ITEMS.clothes:GetChildren()) do
                lol = Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
                print("Epic script from PLG")
            end
        end
    end
        print("Clicked")
    end)  


    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player") 

    PlayerSection:NewSlider("Speed", "Makes you faster", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end) 

    PlayerSection:NewSlider("JumpPower", "Makes you jump higher", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end) 


    local Teleport = Window:NewTab("Teleport")
    local TeleportSection = Teleport:NewSection("Teleport") 

    TeleportSection:NewButton("Crimainals base", "Takes you to the Crimainals base", function(v) 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943, 96, 2055)
        print("Clicked")
    end) 

    TeleportSection:NewButton("Prison", "Takes you to a Prison", function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(922.099487, 97.1302185, 2448.29956)
        print("Clicked")
    end) 

    TeleportSection:NewButton("Yard", "Takes you to the Yard", function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798.999756, 95.1383057, 2540.5)
        print("Clicked")
    end) 


elseif game.PlaceId == 5490351219 then 
    getgenv().autoClick = false
    getgenv().autoReb = false
    getgenv().autoEgg = false
    
    function doEgg() 
        spawn(function() 
            while autoEgg == true do 
                local args = {[1] = v,}
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.EggService.Purchase:FireServer(unpack(args))
                wait() 
                
            end 
        end) 
    end 
    
    function doClick() 
        spawn(function() 
            while autoClick == true do 
                local clickMod = require(game:GetService("Players").tevitamou.PlayerScripts.Aero.Controllers.UI.Click)
                clickMod:Click() 
                wait() 
            end 
        end) 
    end 
    
    function doReb() 
        spawn(function() 
            while autoReb == true do 
                local args = {[1] = currentOption,}
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths:FireServer(unpack(args))    
                wait(0.5) 
            end 
        end) 
    end 
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("TITLE", "DarkTheme")     
    local Main = Window:NewTab("Main") 
    local Section = Main:NewSection("Main") 
    
    Section:NewToggle("Auto Clicker", "Clicks for you", function(state)
        if state then 
            autoClick = state 
            doClick()
            print("Toggle On")
        else
            autoClick = false
            print("Toggle Off")
        end
    end) 
    
   
    local Section = Main:NewSection("Rebirth")
    Section:NewToggle("1", "Rebirths Once", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("10", "Rebirths 10 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("100", "Rebirths 100 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("1k", "Rebirths 1000 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("10k", "Rebirths 10,000 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("100k", "Rebirths 100000 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("1M", "Rebirths 1000000 times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("10M", "Rebirths 10M times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("1B", "Rebirths 1B times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("10B", "Rebirths 10B times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 10000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("100B", "Rebirths 10B times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 100000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("1T", "Rebirths 1T times", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = 1000000000000
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    

    local Tab = Window:NewTab("Upgrades")
    local Section = Tab:NewSection("Shop Upgrades (All of these Costs Gems)")
    
    Section:NewToggle("Click Multiplier", "Auto Buy Click Multiplier", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "ClickMultiply"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "ClickMultiply"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("Cursor Damage", "Auto Buy Cursor Damage", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "CursorDamage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "CursorDamage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("Health", "Auto Buy Health Upgrade", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "Health"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "Health"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("Jump Upgrade", "Auto Buy Jump Updgrades", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "JumpPower"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "JumpPower"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("Pet Storage", "Auto Buy Pet Storage", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "PetStorage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "PetStorage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    Section:NewToggle("Speed Updgrade (just use the one in misc)", "Auto Buy Walkspeed", function(state)
        if state then
            _G.Condition = true -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "PetStorage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        else
            _G.Condition = false -- true turns it on, false turns it off
            while _G.Condition == true do
            local A_1 = "PetStorage"
            local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade
            Event:FireServer(A_1)
            wait()
            end
        end
    end)
    
    local Tab = Window:NewTab("Teleports")
    local Section = Tab:NewSection("Teleport Locations")
    
    Section:NewButton("King Of Hill", "hi", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(546.53064, 32.5750542, -173.389252)
    end)
    
    Section:NewButton("Boss", "how", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(748.271484, 9.2008543, -274.674805)
    end)
    
    Section:NewButton("Chest", "are", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(623.256104, 9.67012691, -345.602203)
    end)
    
    Section:NewButton("Rebith Shop (more rebirths here)", "you", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(483.421722, 9.22905445, -338.502625)
    end)
    
    Section:NewButton("Upgrade Shop", ":)", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(493.48526, 9.5162096, -312.879272)
    end)
    
    local Tab = Window:NewTab("Misc.")
    local Section = Tab:NewSection("Miscellaneous")
    
    Section:NewSlider("WalkSpeed", "Modifies the Walk Speed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    Section:NewSlider("Jump Power", "Modifies the Jump Power", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    Section:NewButton("Ctrl Click Teleport", "I dont know what to put here :p", function()
        local Plr = game:GetService("Players").LocalPlayer
        local Mouse = Plr:GetMouse()
        Mouse.Button1Down:connect(function()
        if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
        if not Mouse.Target then return end
        Plr.Character:MoveTo(Mouse.Hit.p)
        end)
    end) 

    Section:NewToggle("Noclip", "Makes you go through walls", function(state)
        if state then 
            noclip = state
            game:GetService('RunService').Stepped:connect(function()
            if noclip then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
            end)
            plr = game.Players.LocalPlayer
            mouse = plr:GetMouse()
            
            print("Toggle On")
        else 
            noclip = false
            print("Toggle Off")
        end
    end) 
	    Section:NewToggle("Inf Jump", "What do i put here", function(state)
        if state then 
            _G.InfJump = state 
            while true do
                game:GetService("UserInputService").JumpRequest:connect(function()
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")       
                end) 
                end
            print("Toggle On")
        else 
           _G.InfJump = false
        end
    end) 
end  
