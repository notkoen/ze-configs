// ze_FFXII_Mt_Bur_Omisace_v6_beta6 map text scripts by koen (STEAM_1:1:114921174)
// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻

// ROUND START TEXT
function PrintMapText()
{
	local text = "FFXII Mt Bur Omisace\n------------------------------\nMap by Ma/l/go\nThanks to NiDE.gg, Koen, Moltard, =iXi=,\nTupu, Shady, Creepy, Tianli\n \nPort by: koen";
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, null, null);
}

// MIDDLE HUD HINT TEXT
hudhint_text <- [
	"WARMUP MODE - PREPARE YOURSELF...",
	"NORMAL MODE - DISCOVER KILTIAN TEMPLE",
	"HARD MODE - FIND GRAN KILTIAS",
	"ULTIMATE MODE - DEFEAT BERGAN IN THE FINAL\nBATTLE OF MT BUR-OMISACE"
];

function PrintHudHintText(iNum)
{
	self.__KeyValueFromString("message", hudhint_text[iNum]);
	EntFireByHandle(self, "Display", "", 0.1, null, null);
}

// SONG NAME TEXT
song_names <- [
	["Aero Chord - Boundless"],
	["FFXII: The Zodiac Age OST - Abandoning Power", "FFXIV OST - Amdapor Keep HM Theme", "FFXII: The Zodiac Age OST - Boss Battle", "Epic Score - Blaze of Glory"],
	["Pendulum - Spiral", "Taylor Swift - Anti-Hero (Pendulum Cover)", "Leader - Warrior Inside", "FFXIV OST - Stormblood Boss Theme", "Antti Martikainen - Ruins of the Future World"],
	["Pendulum - Colourfast (Like A Version)", "Maduk - Poison", "Markus Schukowski - What It Feels Like (Zardonic Remix)", "Remnant 2 OST - The Imposter Kings", "Antti Martikainen - The Bringer of Justice", "Antti Martikainen - Onward!", "Blaine Stranger & Voicians - Sirens", "Mazare & Philip Strand - Battlecry", "MUZZY & Voicians - Back To You"]
];

function PrintMusicText(iStage, iNum)
{
	local text = "Now Playing:\n" + song_names[iStage][iNum];
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, null, null);
}

// BOSS CAPTION
caption_ent <- null;
boss_text <- [
	["[Judge Bergan]:\nAh, our vagrant princess...", "[Judge Bergan]:\nSwift has your lust for revenge led you\nto the Sword of Kings", "[Judge Bergan]:\nA fitting blade for a true Dynast-King!", "[Judge Bergan]:\nRaithwall did but pretend the title...\na cur begging Nethicite scraps from his Master's table!"],
	["[Judge Bergan]:\nThe new Ivalice holds no place for the name Dalmasca", "[Judge Bergan]:\nThe stain of Raithwall's blood shall be washed clean\nfrom history's weave!"],
	["[Judge Bergan]:\nHis time is nigh!"],
	["[Judge Zargabaath]:\nSo found his Excellency, Lord Gramis.", "[Judge Zargabaath]:\nYou would do well to mind your tongue, Drace.", "[Judge Zargabaath]:\nThat matter is long passed!"]
];

function DisplayBossCaption(iNum)
{
	if (caption_ent == null || !caption_ent.IsValid())
	{
		caption_ent = Entities.CreateByClassname("game_text");
		caption_ent.__KeyValueFromString("targetname", "boss_caption");

		caption_ent.__KeyValueFromInt("effect", 0);
		caption_ent.__KeyValueFromInt("channel", 5);
		caption_ent.__KeyValueFromInt("spawnflags", 1);
		caption_ent.__KeyValueFromFloat("x", 0.17);
		caption_ent.__KeyValueFromFloat("y", 0.15);
		caption_ent.__KeyValueFromVector("color", Vector(128, 220, 220));
		caption_ent.__KeyValueFromInt("holdtime", 5);
		caption_ent.__KeyValueFromFloat("fadein", 0.1);
		caption_ent.__KeyValueFromFloat("fadeout", 0.1);
	}

	switch (iNum)
	{
		case 1:
		{
			caption_ent.__KeyValueFromVector("color", Vector(255, 215, 0));
			EntFireByHandle(caption_ent, "SetText", boss_text[0][0], 0.0, null, null);
			EntFireByHandle(caption_ent, "Display", "", 0.02, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[0][1], 3.0, null, null);
			EntFireByHandle(caption_ent, "Display", "", 3.06, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[0][2], 8.0, null, null);
			EntFireByHandle(caption_ent, "Display", "", 8.02, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[0][3], 12.4, null, null);
			EntFireByHandle(caption_ent, "Display", "", 12.5, null, null);
			break;
		}
		case 2:
		{
			caption_ent.__KeyValueFromVector("color", Vector(255, 215, 0));
			EntFireByHandle(caption_ent, "SetText", boss_text[1][0], 0.6, null, null);
			EntFireByHandle(caption_ent, "Display", "", 0.62, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[1][1], 5.1, null, null);
			EntFireByHandle(caption_ent, "Display", "", 5.12, null, null);
			break;
		}
		case 3:
		{
			caption_ent.__KeyValueFromVector("color", Vector(255, 215, 0));
			caption_ent.__KeyValueFromString("message", boss_text[2][0]);
			EntFireByHandle(caption_ent, "Display", "", 0.0, null, null);
			break;
		}
		case 4:
		{
			caption_ent.__KeyValueFromVector("color", Vector(255, 0, 255));
			EntFireByHandle(caption_ent, "SetText", boss_text[0][0], 0.08, null, null);
			EntFireByHandle(caption_ent, "Display", "", 0.10, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[0][1], 2.88, null, null);
			EntFireByHandle(caption_ent, "Display", "", 2.90, null, null);
			EntFireByHandle(caption_ent, "SetText", boss_text[0][2], 5.18, null, null);
			EntFireByHandle(caption_ent, "Display", "", 5.20, null, null);
			break;
		}
	}
}

// HAPPY NEW YEAR
function HappyNewYear()
{
	self.__KeyValueFromFloat("x", -1.0);
	self.__KeyValueFromFloat("y", 0.7);
	self.__KeyValueFromInt("holdtime", 4);

	self.__KeyValueFromString("message", " ** HAPPY CHINESE NEW YEAR !!! **\n** 新春快樂~ **\n \n \n愛來自koen~");
	EntFireByHandle(self, "Display", "", 0.1, null, null);
}