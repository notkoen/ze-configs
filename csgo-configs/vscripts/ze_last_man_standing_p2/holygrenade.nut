// ze_last_man_standing_p2 holy grenade script by koen (STEAM_1:1:114921174)
// Made for MoeUB with suggestions from 南巷的貓

// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻

// Holy Grenade Settings
EXPLOSION_RADIUS <- 1500.0;
HUMAN_SPEEDMOD <- 0.15;
HUMAN_SLOWDOWN_TIME <- 15.00;


function BlowShitUp() {
	local grenade_origin = self.GetOrigin();
	local p = null;
	while (p = Entities.FindByClassnameWithin(p, "player", grenade_origin, EXPLOSION_RADIUS)) {
		if (p.GetTeam() == 3 && p.GetHealth() > 0 && p.IsValid()) {
			EntFire("Global_Speed", "ModifySpeed", HUMAN_SPEEDMOD.tostring(), 0.0, p);
			EntFire("Global_Speed", "ModifySpeed", "1", HUMAN_SLOWDOWN_TIME, p);
		}

		if (p.GetTeam() == 2 && p.GetHealth() > 0 && p.IsValid()) {
			EntFireByHandle(p, "SetHealth", "-1", 0.0, p, p);
		}
	}
}