// Map text info (Modified by koen [STEAM_1:1:114921174])

function Mapinfo()
{
	EntFire("Game_text_map", "SetText", "Map by Runa\nThanks to Tianli, Dakotec, and i7 for providing models", 0.00, null);
	EntFire("Game_text_map", "Display", "", 0.05, null);
}

function Gravity()
{
	EntFire("heal2_Gametext", "SetText", "Name: Gravity \nCD: 70s \nEffect: Cast a gravity ball in front for 7s", 0.00, null);
	EntFire("heal2_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 454927 \"Astro[Grav]\"", 0.1, null);
}

function Heal2()
{
	EntFire("heal2_Gametext", "SetText", "Name: Heal \nCD: 70s \nEffect: Cast a healing aura in front where humans heal to 300 HP instantly", 0.00, null);
	EntFire("heal2_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 454927 \"Astro[Heal]\"", 0.1, null);
}

function Mage_Ballad()
{
	EntFire("Mage_Ballad_Gametext", "SetText", "Name: Mage's Ballad \nCD: 60s \nEffect: Gives infinite ammo to nearby humans", 0.00, null);
	EntFire("Mage_Ballad_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 462134 \"Bard[Ammo]\"", 0.1, null);
}

function Peloton()
{
	EntFire("Mage_Ballad_Gametext", "SetText", "Name: Peloton \nCD: 60s \nEffect: Gives speed to nearby humanss", 0.00, null);
	EntFire("Mage_Ballad_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 462134 \"Bard[Speed]\"", 0.1, null);
}

function ELECTRIC()
{
	EntFire("electric_Gametext", "SetText", "Name: Electric \nCD: 65s \nEffect: Create a thunder to slow down zombies for 7s", 0.00, null);
	EntFire("electric_Gametext", "Display", "", 0.05, null);
}

function HEAL()
{
	EntFire("heal_Gametext", "SetText", "Name: Heal \nCD: 60s \nEffect: Heal humans for 25 HP every second", 0.00, null);
	EntFire("heal_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 454983 \"Mage[Heal]\"", 0.1, null);
}

function HOLY()
{
	EntFire("heal_Gametext","SetText","Name: Holy \nCD: 60s \nEffect: Cast an exploding light that freezes nearby zombies", 0.00, null);
	EntFire("heal_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 454983 \"Mage[Holy]\"", 0.1, null);
}

function HEAL3()
{
	EntFire("heal3_Gametext", "SetText", "Name: Heal \nCD: 60s \nEffect: Heal humans for 20 HP every second",0.00,null);
	EntFire("heal3_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 2286340 \"Scholar[Heal]\"", 0.1, null);
}

function Sacred_Soi()
{
	EntFire("heal3_Gametext","SetText","Name: Sacred_Soi \nCD: 60s \nEffect: Cast a shield in place for 10s",0.00,null);
	EntFire("heal3_Gametext", "Display", "", 0.05, null);
	EntFire("cmd", "Command", "sm_ewsetshortname 2286340 \"Scholar[Sheld]\"", 0.1, null);
}

function Zombies_Ice()
{
	EntFire("Zombies_ice_Gametext","SetText","Name: Zombie Ice \nCD: 70s \nEffect: Makes you immunte to electric and holy freezing effects for 4s",0.00,null);
	EntFire("Zombies_ice_Gametext", "Display", "", 0.05, null);
}

function Zombies_Electric()
{
	EntFire("Zombies_electric_Gametext", "SetText", "Name: Zombie Electric \nCD: 60s \nEffect: Gives Speed to nearby zombies for 8s", 0.00, null);
	EntFire("Zombies_electric_Gametext", "Display", "", 0.05, null);
}

function Zombies_fire()
{
	EntFire("Zombies_fire_Gametext", "SetText", "Name: Zombies Fire \nCD: 60s \nEffect: Kill nearby humans instantly", 0.00, null);
	EntFire("Zombies_fire_Gametext", "Display", "", 0.05, null);
}

function Zombies_wind()
{
	EntFire("Zombies_wind_Gametext", "SetText", "Name: Zombies Wind \nCD: 70s \nEffect: Pull nearby humans to the user",0.00,null);
	EntFire("Zombies_wind_Gametext", "Display", "", 0.05, null);
}

function Zombies_earth()
{
	EntFire("Zombies_earth_Gametext", "SetText", "Name: Zombies earth \nCD: 70s \nEffect: Generate a shield for 7s",0.00,null);
	EntFire("Zombies_earth_Gametext", "Display", "", 0.05, null);
}