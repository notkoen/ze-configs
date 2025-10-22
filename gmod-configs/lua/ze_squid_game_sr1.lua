GM.ZEItemWatch = {
	[219233] = {
		name = "Wooden Box",
		shortname = "Box",
		color = "#808080",
		filtername = 219249,
		maxuses = 1,
	},
	[219261] = {
		name = "Metal Shelf",
		shortname = "Shelf",
		color = "#808080",
		filtername = 219268,
		maxuses = 1,
	},
	[222626] = {
		name = "Vending Machine",
		shortname = "Machine",
		color = "#808080",
		filtername = 222630,
		maxuses = 1,
	},
	[224831] = {
		name = "Squid Ball",
		shortname = "Ball",
		color = "#00FF00",
		mode = 1,
	},
}

GM.ZEBossHUD = {
	["big_doll_counter"] = {
		name = "Doll",
	},
	["mask_counter"] = {
		name = "Mask",
	},
}

local function ToggleFlashlight(bool)
	for _, pl in ipairs(player.GetAll()) do
		pl:SendLua("GAMEMODE.DisableFlashlight = " .. tostring(bool))
	end
end

hook.Add("InitPostEntityMap", "ZE.IPEM", function()
	g_hPlayers = {}
	g_bTicking = false
	g_bKilling = false
	g_bPreKilling = false
	g_sAnim = ""

	g_fTimer_Killing = 0.0
	g_fTimer_Check = 0.0

	squid_model = ents.FindByName("squid_doll")[1]
	squid_sound = ents.FindByName("awp_sound")[1]
	squid_sound1 = ents.FindByName("doll_song")[1]

	ToggleFlashlight(false)
end)

TICKRATE = 0.25

g_fTime_Check = 2.0
g_fTime_Killing = 5.0

Anim_Backward = "start"
Anim_Backward_Idle = "kill"

Anim_Forward = "forward"
Anim_Forward_Idle = "idle"

squid_scripts = {
	["Tick"] = function()
		if not g_bTicking then return end

		if g_bPreKilling or g_bKilling then
			if g_bKilling then
				if g_fTimer_Killing >= g_fTime_Killing then
					g_fTimer_Killing = 0.0
					g_bKilling = false
					g_bPreKilling = false

					if IsValid(squid_sound1) then
						squid_sound1:Fire("PlaySound")
					end

					squid_scripts["SetBackward"]()
				else
					g_fTimer_Killing = g_fTimer_Killing + TICKRATE
					squid_scripts["TickKillMovingPlayers"]()
				end
			end
		else
			if g_fTimer_Check >= g_fTime_Check then
				g_fTimer_Check = 0.0
				g_fTimer_Killing = 0.0
				g_bPreKilling = true

				squid_scripts["SetForward"]()

				if IsValid(squid_sound1) then
					squid_sound1:Fire("StopSound", "", 1.0)
				end

				timer.Simple(1.5, function()
					squid_scripts["SaveAngles"]()
					g_bKilling = true
					g_bPreKilling = false
				end)
			else
				g_fTimer_Check = g_fTimer_Check + TICKRATE
			end
		end

		timer.Simple(TICKRATE, function() squid_scripts["Tick"]() end)
	end,
	["SaveAngles"] = function()
		for pl, _ in pairs(g_hPlayers) do
			if pl:Health() > 0 then
				pl.SavedEyeAngles = pl:EyeAngles()
				continue
			end

			g_hPlayers[pl] = nil
		end
	end,
	["TickKillMovingPlayers"] = function()
		for pl, _ in pairs(g_hPlayers) do
			if pl:Health() > 0 then
				local velocity = pl:GetVelocity():LengthSqr()
				local angles = pl:EyeAngles()
				local angles2 = pl.SavedEyeAngles

				if velocity == 0 and angles == angles2 then continue end

				local timetokill = math.random(0, TICKRATE)
				--pl:Fire("SetHealth", "-1", timetokill)
				timer.Simple(timetokill, function()
					if not IsValid(pl) then return end

					if pl:Alive() then
						if IsValid(squid_sound) then
							squid_sound:SetPos(pl:GetPos())
						end

						pl:Kill()
					end
				end)

				if IsValid(squid_sound) then
					squid_sound:Fire("PlaySound", "", timetokill)
				end
			end

			g_hPlayers[pl] = nil
		end
	end,
	["Tounch"] = function(activator)
		if not g_bTicking then
			g_bTicking = true
			squid_scripts["Tick"]()
		end

		if g_hPlayers[activator] then return end

		g_hPlayers[activator] = true
		activator.SavedEyeAngles = activator:EyeAngles()
	end,
	["EndTounch"] = function(activator)
		if g_hPlayers[activator] then
			g_hPlayers[activator] = nil
		end
	end,
	["SetForward"] = function()
		if g_sAnim ~= "forward" then
			squid_scripts["SetAnimation"](Anim_Forward)
			squid_scripts["SetDefaultAnimation"](anim_Forward_Idle)
		end

		g_sAnim = "forward"
	end,
	["SetBackward"] = function()
		if g_sAnim ~= "backward" then
			squid_scripts["SetAnimation"](Anim_Backward)
			squid_scripts["SetDefaultAnimation"](Anim_Backward_Idle)
		end

		g_sAnim = "backward"
	end,
	["SetAnimation"] = function(animationName, time)
		if IsValid(squid_model) then
			squid_model:Fire("SetAnimation", animationName, time)
		end
	end,
	["SetDefaultAnimation"] = function(animationName, time)
		if IsValid(squid_model) then
			squid_model:Fire("SetDefaultAnimation", animationName, time)
		end
	end,
}

local script_run = {
	["Tounch();"] = {func = squid_scripts["Tounch"], arg = "activator"},
	["EndTounch();"] = {func = squid_scripts["EndTounch"], arg = "activator"},
}

hook.Add("AcceptInput", "ZE.AcceptInput", function(ent, input, activator, caller, value)
	if ent:GetName() == "kill_doll_tr" and ent:GetClass() == "trigger_multiple" then
		if input == "RunScriptCode" then
			local arg = script_run[value].arg == "activator" and activator or script_run[value].arg or nil
			return script_run[value].func(arg)
		elseif input == "Disable" then
			g_bTicking = false
		end
	end

	if ent:GetName() == "shar_door_02" and ent:GetClass() == "func_breakable" and input == "FireUser1" then
		ToggleFlashlight(true)
	end

	if ent:GetName() == "3_t_c_3" and ent:GetClass() == "math_counter" and input == "FireUser1" then
		ToggleFlashlight(false)
	end
end)
