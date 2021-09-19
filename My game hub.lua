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
    local MainSection = Main:NewSection("Main") 
    
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

elseif game.PlaceId == 5977280685 then 
    getgenv().autoFarm = false
    getgenv().autobuy = false 
    getgenv().autobuy2 = false 
    
    function doBuy2() 
        spawn(function() 
            while autobuy2 == true do 
                local args = {[1] = "buyAllItems",[2] = {["whichItems"] = "Swords", ["whichPlanet"] = "Ground",},}
                game:GetService("Players").tevitamou.saberEvent:FireServer(unpack(args))
                wait(0.5) 
            end 
        end) 
    end  
    
    function dobuy() 
        spawn(function() 
            while autobuy == true do 
                local args = {[1] = "buyAllItems",[2] = {["whichItems"] = "Crystals",["whichPlanet"] = "Ground",},}
                game:GetService("Players").tevitamou.saberEvent:FireServer(unpack(args))
                wait(0.5) 
            end 
        end) 
    end
    
    function doFarm() 
        spawn(function() 
            while autoFarm == true do 
                local args = {[1] = "swingBlade",}
                game:GetService("Players").tevitamou.saberEvent:FireServer(unpack(args)) 
                wait(0.5) 
            end 
        end) 
    end 
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() 
    local Window = Library.CreateLib("Ninja legends 2", "Sentinel") 
    local Main = Window:NewTab("TabName") 
    local MainSection = Main:NewSection("Main") 
    
        MainSection:NewToggle("Auto Blade", "Swings for you", function(state)
        if state then 
            autoFarm = state 
            doFarm()
            print("Toggle On")
        else 
            autoFarm = false
            print("Toggle Off")
        end
    end)  

        MainSection:NewToggle("Auto Blade", "Buys Blades for you", function(state)
        if state then 
            autobuy2 = state 
            doBuy2()
            print("Toggle On")
        else 
            autobuy2 = false
            print("Toggle Off")
        end
    end) 

        MainSection:NewToggle("AutoCrystal", "auto buys Crytals for you", function(state)
        if state then 
            autobuy = state 
            dobuy()
            print("Toggle On")
        else 
            autobuy = true
            print("Toggle Off")
        end
    end) 
elseif game.PlaceId == 292439477 then 
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Phantom Forces", "Sentinel") 
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main") 
    
    MainSection:NewButton("Silent Aim", "When you aim near someone it hits someone", function() 
        -- Credits to integerisqt!
        -- Have a great day!
        local Players = game:GetService("Players")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer
        local Mouse = LocalPlayer:GetMouse()
        local GameLogic, CharTable, Trajectory
        for I,V in pairs(getgc(true)) do
            if type(V) == "table" then
                if rawget(V, "gammo") then
                    GameLogic = V
                end
            elseif type(V) == "function" then
                if debug.getinfo(V).name == "getbodyparts" then
                    CharTable = debug.getupvalue(V, 1)
                elseif debug.getinfo(V).name == "trajectory" then
                    Trajectory = V
                end
            end
            if GameLogic and CharTable and Trajectory then break end
        end
        
        local function Closest()
            local Max, Close = math.huge
            for I,V in pairs(Players:GetPlayers()) do
                if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and CharTable[V] then
                    local Pos, OnScreen = Camera:WorldToScreenPoint(CharTable[V].head.Position) 
                    if OnScreen then
                        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                        if Dist < Max then
                            Max = Dist
                            Close = V
                        end
                    end
                end
            end
            return Close
        end
        local MT = getrawmetatable(game)
        local __index = MT.__index
        setreadonly(MT, false)
        MT.__index = newcclosure(function(self, K)
            if not checkcaller() and GameLogic.currentgun and GameLogic.currentgun.data and (self == GameLogic.currentgun.barrel or tostring(self) == "SightMark") and K == "CFrame" then
                local CharChosen = (CharTable[Closest()] and CharTable[Closest()].head)
                if CharChosen then
                    local _, Time = Trajectory(self.Position, Vector3.new(0, -workspace.Gravity, 0), CharChosen.Position, GameLogic.currentgun.data.bulletspeed)
                    return CFrame.new(self.Position, CharChosen.Position + (Vector3.new(0, -workspace.Gravity / 2, 0)) * (Time ^ 2) + (CharChosen.Velocity * Time))
                end
            end
            return __index(self, K)
        end)
        setreadonly(MT, true)
                print("Clicked")
            end) 
        
    
    MainSection:NewButton("Silent Aim (body)", "ButtonInfo", function() 
        -- Credits to integerisqt!
        -- Have a great day!
        local Players = game:GetService("Players")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer
        local Mouse = LocalPlayer:GetMouse()
        local GameLogic, CharTable, Trajectory
        for I,V in pairs(getgc(true)) do
            if type(V) == "table" then
                if rawget(V, "gammo") then
                    GameLogic = V
                end
            elseif type(V) == "function" then
                if debug.getinfo(V).name == "getbodyparts" then
                    CharTable = debug.getupvalue(V, 1)
                elseif debug.getinfo(V).name == "trajectory" then
                    Trajectory = V
                end
            end
            if GameLogic and CharTable and Trajectory then break end
        end
        
        local function Closest()
            local Max, Close = math.huge
            for I,V in pairs(Players:GetPlayers()) do
                if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and CharTable[V] then
                    local Pos, OnScreen = Camera:WorldToScreenPoint(CharTable[V].HumanoidRootPart.Position)
                    if OnScreen then
                        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                        if Dist < Max then
                            Max = Dist
                            Close = V
                        end
                    end
                end
            end
            return Close
        end
        local MT = getrawmetatable(game)
        local __index = MT.__index
        setreadonly(MT, false)
        MT.__index = newcclosure(function(self, K)
            if not checkcaller() and GameLogic.currentgun and GameLogic.currentgun.data and (self == GameLogic.currentgun.barrel or tostring(self) == "SightMark") and K == "CFrame" then
                local CharChosen = (CharTable[Closest()] and CharTable[Closest()].head)
                if CharChosen then
                    local _, Time = Trajectory(self.Position, Vector3.new(0, -workspace.Gravity, 0), CharChosen.Position, GameLogic.currentgun.data.bulletspeed)
                    return CFrame.new(self.Position, CharChosen.Position + (Vector3.new(0, -workspace.Gravity / 2, 0)) * (Time ^ 2) + (CharChosen.Velocity * Time))
                end
            end
            return __index(self, K)
        end)
        setreadonly(MT, true)
        print("Clicked")
    end)
    
    
    local Gun = Window:NewTab("Gun")
    local GunSection = Gun:NewSection("Gun") 
    
    GunSection:NewButton("Rainbow Gun", "Makes your gun rainbow", function() 
        loadstring(game:HttpGet('https://pastebin.com/raw/3aKUrGRF'))()
        print("Clicked")
    end) 

    local Esp = Window:NewTab("Esp")
    local EspSection = Esp:NewSection("Esp")    
    
    EspSection:NewButton("Esp (Not Mine)", "Makes you see through walls", function() 
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua', true))()  
    end) 
    
    MainSection:NewKeybind("Toggle ui", "KeybindInfo", Enum.KeyCode.F, function()
	    Library:ToggleUI()
    end)
end
       
        		
