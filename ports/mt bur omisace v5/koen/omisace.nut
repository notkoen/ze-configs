// MAP TEXT
function PrintMapText()
{
	local text = "FFXII Mt-Bur Omisace\n---------------------------\nMap by Ma/l/go\nThanks to Tupu, Spxctator, =iXi=, Moltared, Dakotec";
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, null, null);
}

// ITEM TEXT
function PrintItemText(iNum)
{
	local text = "";
	switch (iNum)
	{
		case 1: // Betelgeuse
		{
			text = "Name: Betelgeuse\nDescription: Powerful weapon hiding many secrets\nCooldown: Only 1 use";
			break;
		}
		case 2: // Ultimate Blade
		{
			text = "Name: Ultimate Blade\nDescription: Give ammo to all nearby humans\nCooldown: 60 Secs";
			break;
		}
		case 3: // King Bomb
		{
			text = "Name: King Bomb\nDescription: Summons King Bomb\nDuration: 5 Secs\nCooldown: Only 1 use";
			break;
		}
		case 4: // Cactus
		{
			text = "Name: Cactuar\nDescription: Summons Super-Cactuar\nDuration: 6 Secs\nCooldown: Only 1 use";
			break;
		}
		case 5: // Chaos Blade
		{
			text = "Name: Chaos Blade\nDescription: Summons tornado that pushes everything away within range\nCooldown: 75 Secs";
			break;
		}
		case 6: // Crossbow
		{
			text = "Name: Penetrator Crossbow\nDuration: 2 Secs\nCooldown: 5 Secs";
			break;
		}
		case 7: // Underworld Rod
		{
			text = "Name: Underworld Rod\nDescription: Summons plague destroying all in his way\nDuration: 4 Secs\nCooldown: 65 Secs";
			break;
		}
		case 8: // Silver Mace
		{
			text = "Name: Silver Mace\nDescription: Ancient weapon that summons the destruction power\nCooldown: 90 Secs";
			break;
		}
		case 9: // Thunder
		{
			text = "Name: Thunder Magick\nDescription: Damage and slow all nearby zombies\nCooldown: 65 Secs";
			break;
		}
		case 10: // Gunblade
		{
			text = "Name: Gunblade\nDescription: Damage all touched zombies\nDuration: 3 Secs\nCooldown: 15 Secs"
			break;
		}
		case 11: // Heal
		{
			text = "Name: Cure Magick\nDescription: Heal all nearby humans\nCooldown: 70 Secs";
			break;
		}
		case 12: // HP Potion
		{
			text = "Name: HP Potion\nDescription: Regenerate Health\nDuration: 5 Secs\nCooldown: Only 1 use";
			break;
		}
		case 13: // Sand
		{
			text = "Name: Sandstorm Magick\nDescription: Slow and lure all nearby zombies\nCooldown: 75 Sec";
			break;
		}
		case 14: // Shield
		{
			text = "Name: Ensanguined Shield\nDuration: 2 Secs\nCooldown: 65 Secs";
			break;
		}
		case 15: // Speed Potion
		{
			text = "Name: Speed Potion\nDescription: Makes you a lot stronger and faster\nCooldown: Only 1 use";
			break;
		}
		case 16: // Sword of Kings
		{
			text = "Name: Sword of Kings\nDescription: Greatsword belonged to the Dynast King Raithwal\nDuration: 18 Secs\nCooldown: Only 1 use";
			break;
		}
		case 17: // ZM Belias Spear
		{
			text = "Name: Belias Spear\nDescription: Summons Belias Fire\nCooldown: 80 Secs";
			break;
		}
		case 18: // ZM Bergan Sword
		{
			text = "Name: Bergan Axe\nDescription: Slow and damage humans\nCooldown: 70 Secs";
			break;
		}
		case 19: // ZM Critical Exploiter
		{
			text = "Name: Critical Exploiter Ability\nDuration: 5 Secs\nCooldown: 70 Secs";
			break;
		}
		case 20: // ZM Fear
		{
			text = "Name: Fear Ability\nDescription: Slows all humans in spell range\nDuration: 4 Secs\nCooldown: 70 Secs";
			break;
		}
		case 21: // ZM Fire
		{
			text = "Name: Flame Magick\nDescription: Summons Fire Bomb\nDuration: 3 Secs\nCooldown: 70 Secs";
			break;
		}
		case 22: // ZM Gravity
		{
			text = "Name: Gravity Ability\nDescription: Lure all nearby humans\nDuration: 3 Secs\nCooldown: 65 Secs";
			break;
		}
		case 23: // ZM Heal
		{
			text = "Name: Cure Ability\nDescription: Heal zombies within spell range\nCooldown: 70 Secs";
			break;
		}
		case 24: // ZM Highway Star
		{
			text = "Name: Highway Star\nDescription: Kill a random player in attack range\nCooldown: 70 Secs";
			break;
		}
		case 25: // ZM Mateus Spear
		{
			text = "Name: Mateus Spear\nDescription: Spear filled with the power of Mateus\nDuration: 4 Secs\nCooldown: 80 Secs";
			break;
		}
		case 26: // ZM Warp
		{
			text = "Name: Weakness Ability\nDescription: Kill all humans within spell range\nCooldown: 70 Secs";
			break;
		}
		case 27: // ZM Zargabaath Sword
		{
			text = "Name: Zargabaath Sword\nDescription: Slow and damage all humans in range\nCooldown: 70 Secs";
			break;
		}
	}
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, activator, null);
}