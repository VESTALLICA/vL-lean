local QBCore = exports['qb-core']:GetCoreObject()
isPlayingScenario = false


------------------
---- DRINKING ----




local function leaneffect()
	local playerPed = PlayerPedId()

	RequestAnimSet("move_m@drunk@slightlydrunk") 
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
      Wait(0)
    end 
	
    SetPedMotionBlur(playerPed, true)
    SetPedAccuracy(playerPed, 0)
    SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
	StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
	StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    SetPedIsDrunk(playerPed, true)
	ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    Wait(Config.LeanHigh * 1000) ---10 mins
	--start to sober player 
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('mc-lean:drinksprite', function(source)
    isPlayingScenario = true
    local Player = QBCore.Functions.GetPlayerData()
	
	RequestAnimDict("mp_player_intdrink") 
    while not HasAnimDictLoaded("mp_player_intdrink") do
      Wait(0)
    end 
	
	TaskPlayAnim(PlayerPedId(), "mp_player_intdrink", "loop_bottle", 2.0, 2.0, Config.DrinkSprite * 1000, 120, 0, 0, 0, 0)
	Wait(500)
	TriggerServerEvent("consumables:server:addThirst", Player.metadata.thirst + Config.SpriteThirst)
	QBCore.Functions.Progressbar("drinkingsprite", Config.SpriteText, Config.DrinkSprite * 1000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		ClearPedTasks(PlayerPedId())
		isPlayingScenario = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isPlayingScenario = false
	end)
end)

RegisterNetEvent('mc-lean:drinklean', function(source)
    isPlayingScenario = true
    local Player = QBCore.Functions.GetPlayerData(source)

	RequestAnimDict("mp_player_intdrink") 
    while not HasAnimDictLoaded("mp_player_intdrink") do
      Wait(0)
    end 
	
	TaskPlayAnim(PlayerPedId(), "mp_player_intdrink", "loop_bottle", 2.0, 2.0, Config.DrinkLean * 1000, 120, 0, 0, 0, 0)
	Wait(500)
	TriggerServerEvent("consumables:server:addThirst", Player.metadata.thirst + Config.LeanThirst)
	QBCore.Functions.Progressbar("drinkinglean", Config.LeanText, Config.DrinkLean * 1000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		leaneffect()
		ClearPedTasks(PlayerPedId())
		isPlayingScenario = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isPlayingScenario = false
	end)
end)

RegisterNetEvent('mc-lean:eatjolly', function(source)
	local Player = QBCore.Functions.GetPlayerData()
	TriggerServerEvent("consumables:server:addHunger", Player.metadata.hunger + Config.JollyHunger)
end)

------------------
---- STEALING ----


RegisterNetEvent('mc-lean:stealsyrup', function()
    isPlayingScenario = true
	local playerPed = PlayerPedId()
	local pass = false

	if not Config.Difficulty then
		pass = true
	elseif Config.Difficulty == 'easy' then
		if exports["k5_skillcheck"]:skillCheck("easy") then
			pass = true
		end
	elseif Config.Difficulty == 'normal' then
		if exports["k5_skillcheck"]:skillCheck("normal") then
			pass = true
		end
	elseif Config.Difficulty == 'hard' then
		if exports["k5_skillcheck"]:skillCheck("hard") then
			pass = true
		end
	end
	if pass then
		TaskStartScenarioInPlace(playerPed, Config.Stealing, 0, true)
		QBCore.Functions.Progressbar("mixinglean", Config.StealingText, Config.StealTime * 1000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function()
			TriggerServerEvent('mc-lean:stolelean')
			local timeLeft = 10000 / 1000
			while timeLeft > 0 do
				Wait(1000)
				timeLeft -= 1
			end
			ClearPedTasks(PlayerPedId())
			isPlayingScenario = false
		end, function()
			ClearPedTasks(PlayerPedId())
			isPlayingScenario = false
		end)
	end
end)

CreateThread(function()
	for _, location in pairs(Config.StealLocations) do
		exports["qb-target"]:AddBoxZone(''..location..'', location.xyz, Config.BoxZoneL, Config.BoxZoneW, {
			name = ''..location.x..'',
			heading = location.w,
			debugPoly = Config.DebugPoly,
			minZ = location.z-Config.Zoffset,
			maxZ = location.z+Config.Zoffset,
		}, {
			options = {
				{
					type = "client",
					event = "mc-lean:stealsyrup",
					icon = "fas fa-hand-paper",
					label = Config.StealText,
				},
			},
		distance = 3
		})
		Wait(0)
	end
end)

