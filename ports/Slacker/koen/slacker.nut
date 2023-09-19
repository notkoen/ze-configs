// ITEM TEXT
function PrintItemText(iNum)
{
	local text = "";
	switch (iNum)
	{
		case 1: // Beserk
		{
			text = "ITEM - ULTIMA SWORD\nEFFECT - GIVE INFINITE AMMO TO NEARBY HUMANS\nDURATION - 5 SECONDS";
			break;
		}
		case 2: // Blizzard
		{
			text = "ITEM - ICE MAGICK (BLIZZAGA)\nEFFECT - FREEZES ALL NEARBY ZOMBIES\nDURATION - 6 SECONDS";
			break;
		}
		case 3: // Dark
		{
			text = "ITEM - DARK MAGICK (DARKAGA)\nEFFECT - PULLS ALL NEARBY ZOMBIES\nDURATION - 8 SECONDS";
			break;
		}
		case 4: // Electro
		{
			text = "ITEM - ELECTRO MAGICK (THUNDAGA)\nEFFECT - SLOWS AND DAMAGES ALL NEARBY ZOMBIES\nDURATION - 7 SECONDS\nWARNING: CANCELS OUT ICE EFFECT";
			break;
		}
		case 5: // Fire
		{
			text = "ITEM - FIRE MAGICK (FIRAGA)\nEFFECT - IGNITES ALL NEARBY ZOMBIES\nDURATION - 9 SECONDS";
			break;
		}
		case 6: // Heal
		{
			text = "ITEM - HEAL MAGICK (CURAGA)\nEFFECT - HEALS AND PROTECTS ALL NEARBY HUMANS FROM ZOMBIES\nDURATION - 5 SECONDS";
			break;
		}
		case 7: // HP Potion
		{
			text = "ITEM: HEAL POTION\nEFFECT: HEAL HUMANS TO 225 HP\nSINGLE USE";
			break;
		}
		case 8: // Wind
		{
			text = "ITEM - WIND MAGICK (AEROGA)\nEFFECT - MAKES A TORNADO THAT PUSHES ALL NEARBY ZOMBIES AWAY\nDURATION - 7 SECONDS";
			break;
		}
		case 9: // ZM Dark
		{
			text = "ITEM - DARK MAGICK (DARKAGA)\nEFFECT - PULLS ALL NEARBY HUMANS\nDURATION - 3 SECONDS";
			break;
		}
		case 10: // ZM Fire
		{
			text = "ITEM - FIRE MAGICK (FIRAGA)\nEFFECT - IGNITES ALL NEARBY\nHUMANS DURATION - 4 SECONDS";
			break;
		}
		case 11: // ZM Heal
		{
			text = "ITEM - HEAL MAGICK (CURAGA)\nEFFECT - HEALS ALL NEARBY ZOMBIES AND PROTECTS FROM HUMANS";
			break;
		}
		case 12: // ZM Warp
		{
			text = "ITEM - WARP MAGICK\nEFFECT - KILLS ALL NEARBY HUMANS IN LARGER RADIUS\nDURATION - MOMENTARY";
			break;
		}
	}
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, activator, null);
}