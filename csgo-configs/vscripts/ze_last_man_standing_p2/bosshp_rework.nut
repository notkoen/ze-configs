// ze_last_man_standing_p2 boss health script by koen (STEAM_1:1:114921174)
// Made for MoeUB with suggestions from 南巷的貓

// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻
// I HAD TO DO SOME VERY VERY STUPID SHIT TO GET THIS TO WORK

TICK_RATE <- 0.5;
BOSS_ACTIVE <- false;

HP_BAR_NUM <- 16;
HP_PER_PERSON <- 60;

BOSS_SEGMENT_COUNT <- HP_BAR_NUM; // Number of segments remaining
BOSS_DISPLAY_COUNT <- HP_BAR_NUM + 1;
BOSS_START_HEALTH <- 0.0 // Original health of boss
BOSS_HEALTH <- 0.0; // Boss segment health
BOSS_HP_ENT <- null; // "boss_hp" math counter ent
BOSS_CASE_ENT <- null; // "boss_hp_case" logic_case ent
BOSS_HP_COMPARE_VALUE <- 0.0; // Segment health for sprite
BOSS_HP_SEGMENT_HEALTH <- 0.0 // ???

function StartBoss() {
	// Mark boss as active
	if (!BOSS_ACTIVE) {
		BOSS_ACTIVE = true;
	}

	// Set the health based on how many humans are alive
	local p = null;
	while (null != (p = Entities.FindByClassname(p, "player"))) {
		if (p.GetTeam() == 3 && p.GetHealth() > 0 && p.IsValid()) {
			BOSS_HEALTH += HP_PER_PERSON;
		}
	}

	// Calculate health of each segment
	BOSS_HP_COMPARE_VALUE = BOSS_HEALTH / HP_BAR_NUM;

	// Set the current health count to math_counter entity
	BOSS_HP_ENT = Entities.FindByName(BOSS_HP_ENT, "boss_hp");
	EntFireByHandle(BOSS_HP_ENT, "SetValue", BOSS_HEALTH.tostring(), 0.0, null, null);

	// Store handle of logic_case
	BOSS_CASE_ENT = Entities.FindByName(BOSS_CASE_ENT, "boss_hp_case");

	// Start ticking
	EntFireByHandle(self, "RunScriptCode", "CheckHealth()", TICK_RATE, null, null);
}

function TakeDamage() {
	BOSS_HEALTH--;
	//EntFireByHandle(BOSS_HP_ENT, "Subtract", "1", 0.0, null, null);

	// Check if health is 0 to determine if boss is active
	if (BOSS_HEALTH <= 0) {
		EntFire("BossSpriteHP", "HideSprite", "", 0.0, null);
		BOSS_ACTIVE = false;
	}
}

function CheckHealth() {
	// If boss is not active, we stop ticking
	if (!BOSS_ACTIVE) {
		return;
	}

	// Calculate Segments
	local SEGMENT_HEALTH;
	SEGMENT_HEALTH = BOSS_SEGMENT_COUNT * BOSS_HP_COMPARE_VALUE;
	if (BOSS_HEALTH < SEGMENT_HEALTH) {
		BOSS_SEGMENT_COUNT--;
		BOSS_DISPLAY_COUNT--;
		EntFireByHandle(BOSS_CASE_ENT, "InValue", BOSS_DISPLAY_COUNT.tostring(), 0.0, null, null);
	}
	EntFireByHandle(self, "RunScriptCode", "CheckHealth()", TICK_RATE, null, null);
}
