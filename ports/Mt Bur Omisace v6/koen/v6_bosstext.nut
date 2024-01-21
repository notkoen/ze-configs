// ze_FFXII_Mt_Bur_Omisace_v6_beta6 boss text script by koen (STEAM_1:1:114921174)
// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻

text_ent <- null;

function CheckDisplay()
{
	if (text_ent == null || !text_ent.IsValid())
	{
		text_ent = Entities.CreateByClassname("game_text");
		text_ent.__KeyValueFromString("targetname", "attack_text");

		text_ent.__KeyValueFromInt("effect", 0);
		text_ent.__KeyValueFromInt("channel", 5);
		text_ent.__KeyValueFromInt("spawnflags", 1);
		text_ent.__KeyValueFromFloat("x", 0.17);
		text_ent.__KeyValueFromFloat("y", 0.12);
		text_ent.__KeyValueFromInt("holdtime", 3);
		text_ent.__KeyValueFromFloat("fadein", 0.25);
		text_ent.__KeyValueFromFloat("fadeout", 0.25);
	}
	return;
}

// NORMAL MODE - TYRANT
// 1 - Infernal Storm
// 2 - Flame Wrath
// 3 - Acid Rush
// 4 - Arcane Energy
// 5 - Hex of the Void
// 6 - Entangling Orb
// 7 - Blessing of Ancestors
// 8 - Sanctimony of Armor
// 9 - Chaos Ray
// 10 - Rain of Burning Souls
tyrant_attacks <- [
	{
		text = "Infernal Storm"
		color = Vector(230, 126, 0)
	},
	{
		text = "Flame Wrath"
		color = Vector(255, 140, 0)
	},
	{
		text = "Acid Rush"
		color = Vector(80, 120, 15)
	},
	{
		text = "Arcane Energy"
		color = Vector(0, 128, 255)
	},
	{
		text = "Hex of the Void"
		color = Vector(255, 70, 255)
	},
	{
		text = "Entangling Orb"
		color = Vector(175, 70, 175)
	},
	{
		text = "Blessing of Ancestors"
		color = Vector(255, 215, 0)
	},
	{
		text = "Sanctimony of Armor"
		color = Vector(77, 255, 77)
	},
	{
		text = "Chaos Ray",
		color = Vector(135, 10, 120)
	},
	{
		text = "Rain of Burning Souls"
		color = Vector(200, 25, 75)
	},
];

function TyrantAttack(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", tyrant_attacks[iNum-1].color);
	text_ent.__KeyValueFromString("message", tyrant_attacks[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}

// HARD MODE - SANCTUARY KEEPER
// 1 - Carnage of Phantoms
// 2 - Ancestor's Explosion
// 3 - Shadow Blast
// 4 - Blessing of Ancestors
// 5 - Wave of Redemption
// 6 - Personal Ice (?)
// 7 - Mind Tempest
// 8 - Solar Orb
// 9 - Interruption Seal
// 10 - Annihilate
// 11 - Wind Rage
sanctuary_keeper_attacks <- [
	{
		text = "Carnage of Phantoms"
		color = Vector(125, 125, 125)
	},
	{
		text = "Ancestor's Explosion"
		color = Vector(100, 160, 155)
	},
	{
		text = "Shadow Blast"
		color = Vector(135, 170, 190)
	},
	{
		text = "Blessing of Ancestors"
		color = Vector(255, 128, 80)
	},
	{
		text = "Wave of Redemption"
		color = Vector(200, 250, 125)
	},
	{
		text = "Personal Ice"
		color = Vector(0, 255, 255)
	},
	{
		text = "Mind Tempest"
		color = Vector(160, 10, 130)
	},
	{
		text = "Solar Orb"
		color = Vector(255, 140, 65)
	},
	{
		text = "Interruption Seal"
		color = Vector(255, 255, 0)
	},
	{
		text = "Annihilate"
		color = Vector(190, 90, 230)
	},
	{
		text = "Wind Rage"
		color = Vector(255, 255, 255)
	},
];

function KeeperAttack(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", sanctuary_keeper_attacks[iNum-1].color);
	text_ent.__KeyValueFromString("message", sanctuary_keeper_attacks[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}

// ULTIMATE MODE - Judge Bergan (Phase 1)
// 1 - 1000 Needles
// 2 - Mystic Hail
// 3 - Blade
// 4 - Flash of Burning Souls
// 5 - Dedication Aura
// 6 - Aura of Water
// 7 - Rage of Magic
// 8 - Flash of Shattering
phase1_attacks <- [
	{
		text = "1000 Needles"
		color = Vector(255, 215, 0)
	},
	{
		text = "Mystic Hail"
		color = Vector(135, 210, 170)
	},
	{
		text = "Blade"
		color = Vector(255, 15, 100)
	},
	{
		text = "Flash of Burning Souls"
		color = Vector(255, 120, 10)
	},
	{
		text = "Dedication Aura"
		color = Vector(230, 60, 125)
	},
	{
		text = "Aura of Water"
		color = Vector(30, 190, 210)
	},
	{
		text = "Rage of Magic"
		color = Vector(190, 90, 230)
	},
	{
		text = "Flash of Shattering"
		color = Vector(240, 200, 60)
	},
];

function PhaseOneAttack(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", phase1_attacks[iNum-1].color);
	text_ent.__KeyValueFromString("message", phase1_attacks[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}

// ULTIMATE MODE - Judge Bergan (Phase 2)
// 1 - Clarity of Fear
// 2 - Vision of Life
// 3 - Inferno Orb
// 4 - Demonic Rain
// 5 - Spell of Demon Blade
// 6 - Ceremony of the Nether
// 7 - Carnage of Energy
// 8 - Concentration of Reason
// 9 - Rain of Magic
phase2_attacks <- [
	{
		text = "Clarity of Fear"
		color = Vector(200, 75, 75)
	},
	{
		text = "Vision of Life"
		color = Vector(230, 210, 80)
	},
	{
		text = "Inferno Orb"
		color = Vector(255, 120, 10)
	},
	{
		text = "Demonic Rain"
		color = Vector(210, 30, 85)
	},
	{
		text = "Spell of Demon Blade"
		color = Vector(255, 15, 100)
	},
	{
		text = "Ceremony of the Nether"
		color = Vector(125, 125, 125)
	},
	{
		text = "Carnage of Energy"
		color = Vector(110, 20, 210)
	},
	{
		text = "Concentration of Reason"
		color = Vector(5, 115, 70)
	},
	{
		text = "Rain of Magic"
		color = Vector(180, 220, 230)
	},
];

function PhaseTwoAttack(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", phase2_attacks[iNum-1].color);
	text_ent.__KeyValueFromString("message", phase2_attacks[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}

// ULTIMATE MODE - Judge Bergan (Phase 3)
// 1 - Vision of Life
// 2 - Illusion of Souls
// 3 - Frost Bolt
// 4 - Wind Salvo
// 5 - Blazing Surge
// 6 - Spell of Demon Fire
// 7 - Spellshield of the Eclipse
// 8 - Severance of the Arcane
phase3_attacks <- [
	{
		text = "Vision of Life"
		color = Vector(15, 230, 45)
	},
	{
		text = "Illusion of Souls"
		color = Vector(230, 30, 100)
	},
	{
		text = "Frost Bolt"
		color = Vector(180, 220, 230)
	},
	{
		text = "Wind Salvo"
		color = Vector(100, 165, 85)
	},
	{
		text = "Blazing Surge"
		color = Vector(255, 120, 10)
	},
	{
		text = "Spell of Demon Fire"
		color = Vector(255, 120, 10)
	},
	{
		text = "Spellshield of the Eclipse"
		color = Vector(255, 60, 85)
	},
	{
		text = "Severance of the Arcane"
		color = Vector(120, 255, 255)
	},
];

function PhaseThreeAttack(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", phase3_attacks[iNum-1].color);
	text_ent.__KeyValueFromString("message", phase3_attacks[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}

// ULTIMATE MODE - Judge Bergan Summons
// 1 - Bahamut Limit
// 2 - Chaos Limit
// 3 - Dark Bahamut Limit
// 4 - Exodus Limit
// 5 - Famfrit Limit
summon_case <- [
	{
		text = "Bahamut Limit"
		color = Vector(255, 60, 200)
	},
	{
		text = "Chaos Limit"
		color = Vector(250, 200, 20)
	},
	{
		text = "Dark Bahamut Limit"
		color = Vector(65, 120, 255)
	},
	{
		text = "Exodus Limit"
		color = Vector(190, 65, 210)
	},
	{
		text = "Famfrit Limit"
		color = Vector(200, 245, 255)
	},
];

function SummonsCase(iNum)
{
	CheckDisplay();
	text_ent.__KeyValueFromVector("color", summon_case[iNum-1].color);
	text_ent.__KeyValueFromString("message", summon_case[iNum-1].text);
	EntFireByHandle(text_ent, "Display", "", 0.0, null, null);
}