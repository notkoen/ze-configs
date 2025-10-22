// ze_last_man_standing_p2 event system script by NiceShot, modified by koen (STEAM_1:1:114921174)
// Modified for MoeUB with suggestions from 南巷的貓

// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻

// All events in the map
EVENT_ARRAY <- [
	["EVENT_CRANE_BREAKABLE", "null", "St1 Crane"], // 0
	["EVENT_TANK_REACHES_END", "null", "St1 Tank"], // 1
	["EVENT_GENERATOR_ACTIVATED", "null", "St1 Generator"], // 2
	["EVENT_HELICOPTER_ESCAPES", "null", "St1 Helicopter"], // 3
	["EVENT_HUMAN_ESCAPE_STAGE1", "null", "St1 Escape"], // 4
	["EVENT_STAGE2_TRUCK_ESCAPES", "null", "St2 Truck Escape"], // 5
	["EVENT_STAGE2_TRUCK_ESCAPES_WITHHUMANS", "null", "St2 Escape"], // 6
	["EVENT_STAGE2_PORTAL_GUN", "null", "St2 Portal Gun"], // 7
	["EVENT_STAGE2_THUNDER_GUN", "null", "St2 Thunder Gun"], // 8
	["EVENT_STAGE2_INMUNIZER_GUN", "null", "St2 Inmunizer Gun"], // 9
	["EVENT_STAGE2_MUTATOR", "null", "St2 Mutator Gun"], // 10
	["EVENT_STAGE2_ZEROGRAVITY", "null", "St2 ZeroGrav Gun"], // 11
	["EVENT_STAGE2_TURRET", "null", "St2 Turret Gun"], // 12
	["EVENT_STAGE2_GENERATOR", "null", "St2 Generator"], // 13
	["EVENT_STAGE3_GENERATOR", "null", "St3 Generator"], // 14
	["EVENT_ZMITEM_SUMMONER", "null", "ZM item Summoner"], // 15
	["EVENT_ZMITEM_JUMPER", "null", "ZM item Jumper"], // 16
	["EVENT_ZMITEM_ALMA", "null", "ZM item Alma"], // 17
	["EVENT_ZMITEM_VORTIGAUNT", "null", "ZM item Vortigaunt"], // 18
	["EVENT_ZMITEM_ANTLION", "null", "ZM item Antlion"], // 19
	["EVENT_ZMITEM_SHOCKWAVE", "null", "ZM item ShockWave"], // 20
	["EVENT_ZMITEM_PREDATOR", "null", "ZM item Predator"], // 21
	["EVENT_STAGE3_TRUCK_REACHES_END", "null", "St3 Escape"], // 22
	["EVENT_STAGE4_HUMAN_ESCAPES", "null", "St4 Escape"], // 23
	["EVENT_STAGE4_GENERATOR_ACTIVATED", "null", "St4 Generator"], // 24
	["EVENT_STAGE4_ULTRALISK_DIES", "null", "St4 Ultralisk"], // 25
	["EVENT_STAGE4_PLANE_ESCAPE", "null", "St4 Plane"], // 26
	["EVENT_STAGE4_APACHE_ESCAPES", "null", "St4 Apache"], // 27
	["EVENT_STAGE4_MECH_ESCAPES", "null", "St4 Mech"], // 28
	["EVENT_STAGE4_MECH_UNLOCK_FLAMETHROWER", "null", "St4 Mech Flamethrower"], // 29
	["EVENT_STAGE4_MECH_UNLOCK_ROCKETLAUNCHER", "null", "St4 Mech RocketLauncher"], // 30
	["EVENT_STAGE4_MECH_UNLOCK_MINIGUN", "null", "St4 Mech Minigun"] // 31
];

// Global variables
TEMP_EVENTS_ARRAY <- [];
EVENTS_COMPLETED <- [];
TEXT_EVENT <- "";
COUNT_TEXT <- 0;

// Event counter for supreme trigger
EVENT_COUNT <- 0;

EVENTS_NOTCOMPLETED <- [];

// Functions
function SaveEvents() {
	for (local i = 0; i < TEMP_EVENTS_ARRAY.len(); i++) {
		for (local a = 0; a < EVENT_ARRAY.len(); a++) {
			if (TEMP_EVENTS_ARRAY[i] == EVENT_ARRAY[a][0]) {
				EVENT_ARRAY[a][1] = "COMPLETED";
			}
		}
	}

	// Easter Egg
	EntFire("Mode_Extreme_Counter", "Add", EVENT_COUNT.tostring(), 0, null);
}

function CompleteAllEvents() {
	for (local i = 0; i < EVENT_ARRAY.len(); i++) {
		EVENT_ARRAY[i][1] = "COMPLETED";
	}
}

function ResetEvents() {
	for (local i = 0; i < EVENT_ARRAY.len(); i++) {
		EVENT_ARRAY[i][1] = "null";
	}
}

function CheckEventsPrint() {
	EVENTS_COMPLETED = [];
	COUNT_TEXT = 0;
	for (local i = 0; i < EVENT_ARRAY.len(); i++) {
		if (EVENT_ARRAY[i][1] == "COMPLETED") {
			local event = EVENT_ARRAY[i][2].tostring();
			EVENTS_COMPLETED.push(event);
		}
	}

	if (EVENTS_COMPLETED.len() == 0) {
		EVENTS_COMPLETED = "\nNo events are completed";
		EntFireByHandle(self, "RunScriptCode", "CheckEventsNotCPrint();", 4.00, null, null);
		return ScriptPrintMessageCenterAll("COMPLETED EVENTS: " + EVENTS_COMPLETED);
	}
	SortArrayText();
}

function SortArrayText() {
	TEXT_EVENT = "";
	local SortCount = 0;
	for (COUNT_TEXT; COUNT_TEXT < EVENTS_COMPLETED.len(); COUNT_TEXT++) {
		if (EVENTS_COMPLETED.len() > 0) {
			if (SortCount >= 5) {
				return PrintEventMess();
			}

			TEXT_EVENT += "\n" + EVENTS_COMPLETED[COUNT_TEXT].tostring();
			SortCount++;
		}
	}
	EntFireByHandle(self, "RunScriptCode", "CheckEventsNotCPrint();", 5.00, null, null);
	return ScriptPrintMessageCenterAll("COMPLETED EVENTS " + EVENTS_COMPLETED.len()+"/" + EVENT_ARRAY.len() + ": " + TEXT_EVENT);;
}

function CheckEventsNotCPrint() {
	EVENTS_NOTCOMPLETED = [];
	COUNT_TEXT = 0;
	for (local i = 0; i < EVENT_ARRAY.len(); i++) {
		if (EVENT_ARRAY[i][1] == "null") {
			local event = EVENT_ARRAY[i][2].tostring();
			EVENTS_NOTCOMPLETED.push(event);
		}
	}

	if (EVENTS_NOTCOMPLETED.len() == 0) {
		EVENTS_NOTCOMPLETED = "\nAll events are completed";
		return ScriptPrintMessageCenterAll("NOT COMPLETED EVENTS: " + EVENTS_NOTCOMPLETED);
	}
	SortArrayNotCText();
}

function SortArrayNotCText() {
	TEXT_EVENT = "";
	local SortCount = 0;
	for (COUNT_TEXT; COUNT_TEXT < EVENTS_NOTCOMPLETED.len(); COUNT_TEXT++) {
		if (EVENTS_NOTCOMPLETED.len() > 0) {
			if (SortCount >= 5) {
				return PrintEventNotCMess();
			}

			TEXT_EVENT += "\n" + EVENTS_NOTCOMPLETED[COUNT_TEXT].tostring();
			SortCount++;
		}
	}
	return ScriptPrintMessageCenterAll("NOT COMPLETED EVENTS " + EVENTS_NOTCOMPLETED.len() + "/" + EVENT_ARRAY.len() + ": " + TEXT_EVENT);
}

function PrintEventMess() {
	ScriptPrintMessageCenterAll("COMPLETED EVENTS " + EVENTS_COMPLETED.len() + "/" + EVENT_ARRAY.len() + ": " + TEXT_EVENT);
	EntFireByHandle(self, "RunScriptCode", "SortArrayText();", 4.00, null, null);
}

function PrintEventNotCMess() {
	ScriptPrintMessageCenterAll("NOT COMPLETED EVENTS " + EVENTS_NOTCOMPLETED.len() + "/" + EVENT_ARRAY.len() + ": " + TEXT_EVENT);
	EntFireByHandle(self, "RunScriptCode", "SortArrayNotCText();", 4.00, null, null);
}

// EVENTS
function CompleteEventCrane() {
	local event = "EVENT_CRANE_BREAKABLE"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventTankEnd() {
	local event = "EVENT_TANK_REACHES_END"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventGenerator() {
	local event = "EVENT_GENERATOR_ACTIVATED"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventHelicopter() {
	local event = "EVENT_HELICOPTER_ESCAPES"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventHumanEscapeStage1() {
	local event = "EVENT_HUMAN_ESCAPE_STAGE1"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2TruckEscapes() {
	local event = "EVENT_STAGE2_TRUCK_ESCAPES"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2TruckEscapesWH() {
	local event = "EVENT_STAGE2_TRUCK_ESCAPES_WITHHUMANS"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2PortalGun() {
	local event = "EVENT_STAGE2_PORTAL_GUN"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2ThunderGun() {
	local event = "EVENT_STAGE2_THUNDER_GUN"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2ImmunizerWeapon() {
	local event = "EVENT_STAGE2_INMUNIZER_GUN"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2Mutator() {
	local event = "EVENT_STAGE2_MUTATOR"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2ZeroGravityGun() {
	local event = "EVENT_STAGE2_ZEROGRAVITY"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2Turret() {
	local event = "EVENT_STAGE2_TURRET"
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage2Generator() {
	local event = "EVENT_STAGE2_GENERATOR";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage3Generator() {
	local event = "EVENT_STAGE3_GENERATOR";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemSummoner() {
	local event = "EVENT_ZMITEM_SUMMONER";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemJumper() {
	local event = "EVENT_ZMITEM_JUMPER";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemAlma() {
	local event = "EVENT_ZMITEM_ALMA";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemVortigaunt() {
	local event = "EVENT_ZMITEM_VORTIGAUNT";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemAntlion() {
	local event = "EVENT_ZMITEM_ANTLION";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemShockwave() {
	local event = "EVENT_ZMITEM_SHOCKWAVE";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteItemPredator() {
	local event = "EVENT_ZMITEM_PREDATOR";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteStage3TruckReachEnd() {
	local event = "EVENT_STAGE3_TRUCK_REACHES_END";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteStage4End() {
	local event = "EVENT_STAGE4_HUMAN_ESCAPES";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventStage4Generator() {
	local event = "EVENT_STAGE4_GENERATOR_ACTIVATED";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventUltraliskD() {
	local event = "EVENT_STAGE4_ULTRALISK_DIES";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventPlane() {
	local event = "EVENT_STAGE4_PLANE_ESCAPE";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventApaches() {
	local event = "EVENT_STAGE4_APACHE_ESCAPES";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventMech() {
	local event = "EVENT_STAGE4_MECH_ESCAPES";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventMechFlame() {
	local event = "EVENT_STAGE4_MECH_UNLOCK_FLAMETHROWER";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventMechRocket() {
	local event = "EVENT_STAGE4_MECH_UNLOCK_ROCKETLAUNCHER";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

function CompleteEventMechMini() {
	local event = "EVENT_STAGE4_MECH_UNLOCK_MINIGUN";
	return TEMP_EVENTS_ARRAY.push(event);
	EVENT_COUNT++;
}

STAGE <- 0;

// Call this at the start of rounds
function Init() {
	// Check completed events
	CheckCompletedEvents();

	// Reset events in temporary buffer
	if (TEMP_EVENTS_ARRAY.len() > 0) {
		TEMP_EVENTS_ARRAY.clear();
	}
	EVENT_COUNT = 0;

}

function CheckCompletedEvents() {
	if (EVENT_ARRAY[0][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_cargo_heli_track_train", "AddOutput", "OnUser1 !self:FireUser3::0:1",2.00,null);
	}

	if (EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 4) {
		EntFire("stage_x_end_rescue_helicopter", "Enable", "",2.00,null);
		EntFire("stage_nuke_inmuzer1", "Kill", "",3.00,null);
	}
	
	if (EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Spawn_Tank_Teleport_Stage_5", "Teleport", "",2.00,null);
	}

	if (EVENT_ARRAY[2][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_top_door_to_east", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[3][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_cargo_heli_track_train", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
		EntFire("stage_x_helicopter_tracktrain", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[4][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_lower_door_relay_reinforcements_5", "Enable", "",2.00,null);
	}

	if (EVENT_ARRAY[5][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_relay", "Enable", "",2.00,null);
		EntFire("stage_x2_escape_vehicle", "FireUser2", "",2.00,null);
	}

	if (EVENT_ARRAY[6][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_lower_door_relay_reinforcements_7", "Enable", "",2.00,null);
	}

	if (EVENT_ARRAY[7][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp1", "AddOutput", "EntityTemplate Weapon_PortalGun_Template",2.00,null);
	}

	if (EVENT_ARRAY[8][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp2", "AddOutput", "EntityTemplate Weapon_Thundergun_Template",2.00,null);
	}

	if (EVENT_ARRAY[9][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp3", "AddOutput", "EntityTemplate Weapon_Inmunizer_Template",2.00,null);
	}

	if (EVENT_ARRAY[10][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp4", "AddOutput", "EntityTemplate Weapon_Mutator_Template",2.00,null);
	}

	if (EVENT_ARRAY[11][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp5", "AddOutput", "EntityTemplate Weapon_ZeroGravity_Template",2.00,null);
	}

	if (EVENT_ARRAY[12][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_reward_vehicle_with_weapons_wp6", "AddOutput", "EntityTemplate Weapon_Turret_Template",2.00,null);
	}

	if (EVENT_ARRAY[13][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_top_door_to_south", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[14][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_top_door_to_north", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[15][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Summoner_Template", "AddOutput", "origin 4752 4792 10780",0.00,null);
		EntFire("Zombie_Item_Summoner_Template", "ForceSpawn", "",0.50,null);
	}

	if (EVENT_ARRAY[16][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Jumper_Template", "AddOutput", "origin 6295.77 4737.17 10780",30.00,null);
		EntFire("Zombie_Item_Jumper_Template", "ForceSpawn", "",30.50,null);
	}

	if (EVENT_ARRAY[17][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Alma_Template", "AddOutput", "origin 4260.98 3755.62 10780",0.00,null);
		EntFire("Zombie_Item_Alma_Template", "ForceSpawn", "",0.50,null);
	}

	if (EVENT_ARRAY[18][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Vortigaunt_Template", "AddOutput", "origin 5005.31 3296.61 10780",0.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template", "ForceSpawn", "",0.50,null);
	}

	if (EVENT_ARRAY[19][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Antlion_Template", "AddOutput", "origin 530 2687 11331",40.00,null);
		EntFire("Zombie_Item_Antlion_Template", "ForceSpawn", "",40.50,null);
	}

	if (EVENT_ARRAY[20][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Shockwave_Template", "AddOutput", "origin 2655.39 4574.21 10780",40.00,null);
		EntFire("Zombie_Item_Shockwave_Template", "ForceSpawn", "",40.50,null);
	}

	if (EVENT_ARRAY[21][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Zombie_Item_Predator_Template", "AddOutput", "origin 6981 278 11948",50.00,null);
		EntFire("Zombie_Item_Predator_Template", "ForceSpawn", "",50.50,null);
	}

	if (EVENT_ARRAY[22][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_reward_stage_3_truck_*", "Enable", "",2.00,null);
		EntFire("stage_5_reward_stage_3_truck_*", "EnableCollision", "",2.00,null);
		EntFire("Weapon_Extra_Unlimmited_Template", "AddOutput", "origin 3560.83 -2181.05 9951.18",2.00,null);
		EntFire("Weapon_Extra_Unlimmited_Template", "ForceSpawn", "",2.05,null);
		EntFire("Weapon_Extra_Inmunizer_Template", "AddOutput", "origin 3672 -2120 9951.18",2.00,null);
		EntFire("Weapon_Extra_Inmunizer_Template", "ForceSpawn", "",2.05,null);
	}

	if (EVENT_ARRAY[23][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_lower_door_relay_reinforcements_1", "Enable", "",2.00,null);
	}

	if (EVENT_ARRAY[24][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_top_door_to_west", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[25][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_5_lower_ultralisk", "Disable", "",2.00,null);
	}

	if (EVENT_ARRAY[26][1] == "COMPLETED" && STAGE == 5) {
		EntFire("pidaras_temp", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[27][1] == "COMPLETED" && STAGE == 5) {
		EntFire("stage_x_part_1_maker_apache", "AddOutput", "OnUser1 !self:FireUser2::0:1",2.00,null);
	}

	if (EVENT_ARRAY[28][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Human_Item_Mech_Knife", "AddOutput", "origin 3952 -1536 9890",2.00,null);
		EntFire("Human_Item_Mech_Model", "SetAnimation", "idle",2.00,null);
		EntFire("Human_Item_Mech_Model", "SetDefaultAnimation", "idle",2.00,null);
	}

	if (EVENT_ARRAY[29][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Human_Item_Mech_Logic", "AddOutput", "OnCase02 !self:FireUser2::0.01:0",2.00,null);
	}

	if (EVENT_ARRAY[30][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Human_Item_Mech_Logic", "AddOutput", "OnCase03 !self:FireUser3::0.01:0",2.10,null);
	}

	if (EVENT_ARRAY[31][1] == "COMPLETED" && STAGE == 5) {
		EntFire("Human_Item_Mech_Logic", "AddOutput", "OnCase04 !self:FireUser4::0.01:0",2.20,null);
	}
}
