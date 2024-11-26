local function white()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hastloxhsx/Bruh/main/Wh1t3"))()

---====== Create entity ======---

if not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Glitchy") then
	local Glitchy = Instance.new("ScreenGui")
	local GlitchScreen = Instance.new("Frame")
	local Glitch1 = Instance.new("ImageLabel")
	local Glitch2 = Instance.new("ImageLabel")
	local Glitch3 = Instance.new("ImageLabel")
	
	--Properties:
	
	Glitchy.Name = "Glitchy"
	Glitchy.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Glitchy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	GlitchScreen.Name = "Glitch Screen"
	GlitchScreen.Parent = Glitchy
	GlitchScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GlitchScreen.BackgroundTransparency = 1.000
	GlitchScreen.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GlitchScreen.BorderSizePixel = 0
	GlitchScreen.Size = UDim2.new(1, 1, 1, 1)
	
	Glitch1.Name = "Glitch1"
	Glitch1.Parent = GlitchScreen
	Glitch1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glitch1.BackgroundTransparency = 1.000
	Glitch1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Glitch1.BorderSizePixel = 0
	Glitch1.Visible = false
	Glitch1.Size = UDim2.new(1, 1, 1, 1)
	Glitch1.Image = "rbxassetid://15959966417"
	Glitch1.ImageTransparency = 0.800
	
	Glitch2.Name = "Glitch2"
	Glitch2.Parent = GlitchScreen
	Glitch2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glitch2.BackgroundTransparency = 1.000
	Glitch2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Glitch2.BorderSizePixel = 0
	Glitch2.Visible = false
	Glitch2.Size = UDim2.new(1, 1, 1, 1)
	Glitch2.Image = "rbxassetid://15959979240"
	Glitch2.ImageTransparency = 0.800
	
	Glitch3.Name = "Glitch3"
	Glitch3.Parent = GlitchScreen
	Glitch3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glitch3.BackgroundTransparency = 1.000
	Glitch3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Glitch3.BorderSizePixel = 0
	Glitch3.Visible = false
	Glitch3.Size = UDim2.new(1, 1, 1, 1)
	Glitch3.Image = "rbxassetid://12590547162"
	Glitch3.ImageTransparency = 0.800
end

local entity = spawner.Create({
	Entity = {
		Name = "WH1T3",
		Asset = "rbxassetid://16735149732",
		HeightOffset = 2
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {15.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 620,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz",
		Min = 18,
		Max = 20,
		Delay = 0.01
	},
	Damage = {
		Enabled = true,
		Range = 50,
		Amount = 0.01
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Death", "Hints", "Go", "Here"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 0, 0)
game.Lighting.MainColorCorrection.Contrast = 1
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(50),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://"..131489490
	sound.Looped = false
	sound.Parent = workspace.WH1T3
	sound.Volume = 3
	sound:Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    local redtweeninfo = TweenInfo.new(3)
local redinfo = {Color = Color3.new(1, 0, 0)}

----------

for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
			if v:IsA("Light") then
					game.TweenService:Create(v,redtweeninfo,redinfo):Play()
					if v.Parent.Name == "LightFixture" then
						    game.TweenService:Create(v.Parent,redtweeninfo,redinfo):Play()
					end
		  end
end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
        game.Lighting.Ambient = Color3.fromRGB(255,0,0)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(1.5), {Ambient = Color3.fromRGB(67, 51, 56)}):Play()
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
		local FPS = 5
    local clock = tick()
        while clock + 1 / FPS > tick() do end
    wait()
    clock = tick()
		if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        game.Players.LocalPlayer.Character.Humanoid.Health -= 2.5
        if game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Glitchy") then
    local Gglitchy = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Glitchy")
    local Gglitch1 = Gglitchy["Glitch Screen"].Glitch1
    local Gglitch2 = Gglitchy["Glitch Screen"].Glitch2
    local Gglitch3 = Gglitchy["Glitch Screen"].Glitch3
            if Gglitch1.Visible == false and Gglitch2.Visible == false and Gglitch3.Visible == false then
    	    	Gglitch1.Visible = true
                Gglitch1.ImageTransparency = 0.8
                game:GetService("TweenService"):Create(Gglitch1, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
        	end
        	if Gglitch1.Visible == true and Gglitch2.Visible == false then
        		Gglitch2.Visible = true
                Gglitch2.ImageTransparency = 0.8
                game:GetService("TweenService"):Create(Gglitch2, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
        		Gglitch1.Visible = false
        	elseif Gglitch2.Visible == true and Gglitch3.Visible == false then
        		Gglitch3.Visible = true
                Gglitch3.ImageTransparency = 0.8
                game:GetService("TweenService"):Create(Gglitch3, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
        		Gglitch2.Visible = false
        	elseif Gglitch3.Visible == true and Gglitch1.Visible == false then
        		Gglitch1.Visible = true
                Gglitch1.ImageTransparency = 0.8
                game:GetService("TweenService"):Create(Gglitch1, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
        		Gglitch3.Visible = false
        	end
    end
    end
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    -- Setting
	local entityModel = entity.Model
	local main = entityModel:WaitForChild("Main")
	local attachment = main:WaitForChild("Attachment")
	local AttachmentSwitch = main:WaitForChild("AttachmentSwitch")
	local sounds = {
		footsteps = main:WaitForChild("Footsteps"),
		playSound = main:WaitForChild("PlaySound"),
		switch = main:WaitForChild("Switch"),
		switchBack = main:WaitForChild("SwitchBack")
	}
	
	-- Faster Rebound
	for _, c in attachment:GetChildren() do
		c.Enabled = (not startOfRebound)
	end
	for _, c in AttachmentSwitch:GetChildren() do
		c.Enabled = startOfRebound
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    local Gglitchy = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Glitchy")
    local Gglitch1 = Gglitchy["Glitch Screen"].Glitch1
    local Gglitch2 = Gglitchy["Glitch Screen"].Glitch2
    local Gglitch3 = Gglitchy["Glitch Screen"].Glitch3
    Gglitch1.Visible = false
    Gglitch2.Visible = false
    Gglitch3.Visible = false
    caa = 0
tween = game:GetService("TweenService")
local TestMultplayer = true
if game:GetService("ReplicatedStorage"):FindFirstChild("White") then
    print("No Wh1t3")
    
    return true
end

local Test = Instance.new("Part")
Test.Name = "White"
Test.Parent = game:GetService("ReplicatedStorage")
Test = 1
    function GitPNG(GithubImg, ImageName)
    local url = GithubImg
    if not isfile(ImageName .. ".png") then
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            writefile(ImageName .. ".png", response)
        else
            error(": " .. response)
        end
    end
    return (getcustomasset or getsynasset)(ImageName .. ".png")
end
if game.Players.LocalPlayer.Character.Humanoid.Health >= 15 then
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Fought A Beast And Survived.",
    Desc = "How?",
    Reason = "Survive WH1T3.",
    Image = GitPNG("https://github.com/Hastloxhsx/Images/blob/main/Wh1t3.png?raw=true", "whitebalge")
})
end
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(50)
		game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Wh1t3"
		local Gglitchy = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Glitchy")
    local Gglitch1 = Gglitchy["Glitch Screen"].Glitch1
    local Gglitch2 = Gglitchy["Glitch Screen"].Glitch2
    local Gglitch3 = Gglitchy["Glitch Screen"].Glitch3
    Gglitch1.Visible = false
    Gglitch2.Visible = false
    Gglitch3.Visible = false
    game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "WH1T3"
    task.spawn(function()
    print("Dead")
        task.wait(15)
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
        warn("P̴̖̺̙͑̍l̸̦̘̔̈́a̸̲̰̯̙͋͒̋y̷͚͖͑͋e̴͎̤̺̗͊ȓ̴̳͙̱̒̔ ̵͈̈́͜h̶͓́͐͂̇a̶̛̞̪̯̫s̸̥͝ ̷̣̲̔̆̓d̵̡̖̈͋̊ͅí̶͚͝e̴͎̅̆̇d̸̮͍͊̔̓͝.̵̢͎̹̾̃")
        firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"H̷̡̡̧̻̼̺̖̫̰̥͚̳͎̣͓͕̼̜̆͐ͅ0̷͇̦̬̟̱̣̠̼̻̱̩̲͇̥̪̙͎̩̈́̌́̈́̓̀̿̍͜Ẃ̵̛̛̏͑̔̏̿͊͐̆̋̈͐̐͘͜"}, "Blue")
        game:Shutdown()
        elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        print("Speed 11")
			local Debuffs = Instance.new("ScreenGui")
			local WH1T3 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ImageLabel = Instance.new("ImageLabel")
			local Speed_Debuff = Instance.new("TextLabel")
			Debuffs.Name = "Debuffs"
			Debuffs.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			Debuffs.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			WH1T3.Name = "WH1T3"
			WH1T3.Parent = Debuffs
			WH1T3.BackgroundColor3 = Color3.fromRGB(90, 43, 43)
			WH1T3.BackgroundTransparency = 0.500
			WH1T3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			WH1T3.BorderSizePixel = 0
			WH1T3.Position = UDim2.new(0.830811501, -1, 0.936082482, -1)
			WH1T3.Size = UDim2.new(0.169188485, 1, 0.0639175251, 1)
			UICorner.Parent = WH1T3
			ImageLabel.Parent = WH1T3
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(4.92218874e-07, 0, 0, 0)
			ImageLabel.Size = UDim2.new(0.266129375, 1, 1, 1)
			ImageLabel.Image = "rbxassetid://12096064117"
			Speed_Debuff.Name = "Speed_Debuff"
			Speed_Debuff.Parent = WH1T3
			Speed_Debuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Speed_Debuff.BackgroundTransparency = 1.000
			Speed_Debuff.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Speed_Debuff.BorderSizePixel = 0
			Speed_Debuff.Size = UDim2.new(1, 1, 1, 1)
			Speed_Debuff.Font = Enum.Font.Unknown
			Speed_Debuff.Text = "    -50% Speed"
			Speed_Debuff.TextColor3 = Color3.fromRGB(100, 0, 0)
			Speed_Debuff.TextSize = 14.000
			Speed_Debuff.TextStrokeTransparency = 0.000
			while true do wait(3)
            if workspace:FindFirstChild("SeekMoving") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            elseif not workspace:FindFirstChild("SeekMoving") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 11
            end
            end
        end
    end)
	end
end)

---====== Run entity ======---

entity:Run()
end

if game.Players.LocalPlayer.Character.Humanoid.Health >= 0 then
white()
end
