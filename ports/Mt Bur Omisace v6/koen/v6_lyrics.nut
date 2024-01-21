// ze_FFXII_Mt_Bur_Omisace_v6_beta6 lyrics script by koen (STEAM_1:1:114921174)
// DO NOT JUDGE ME FOR HOW SHIT THESE SCRIPTS ARE (╯°□°)╯︵ ┻━┻

lyrics_enable <- true;

lyrics_ent <- null;

lyrics_color <- [
	"222 242 25",
	"238 18 244",
	"182 91 158",
	"211 30 247",
	"2 234 233",
	"255 255 255",
	"212 28 28",
	"58 255 255",
	"255 12 88",
	"255 255 2",
	"222 250 252",
];

lyrics_sirens <- [
	{
		text = "All I hear is sirens"
		display_time = 23.34
		holdtime = 2.44
	},
	{
		text = "What I need is silence"
		display_time = 28.93
		holdtime = 2.34
	},
	{
		text = "Everything is fading"
		display_time = 34.4
		holdtime = 3.58
	},
	{
		text = "Away from me"
		display_time = 39.61
		holdtime = 1.96
	},
	{
		text = "I'm holding on while staring at the ground"
		display_time = 46.38
		holdtime = 2.68
	},
	{
		text = "Rising up to only fall back down"
		display_time = 52.2
		holdtime = 2.35
	},
	{
		text = "This silence screams that crying make no sound"
		display_time = 57.4
		holdtime = 2.8
	},
	{
		text = "And I'm looking down"
		display_time = 62.3
		holdtime = 0.6
	},
	{
		text = "But I never let go"
		display_time = 65.05
		holdtime = 0.5
	},
	{
		text = "But I never let go"
		display_time = 87.1
		holdtime = 0.5
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 91.0
		holdtime = 0.65
	},
	{
		text = "But I never let go"
		display_time = 92.7
		holdtime = 0.4
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 96.55
		holdtime = 0.9
	},
	{
		text = "But I never let go"
		display_time = 98.3
		holdtime = 0.4
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 102.0
		holdtime = 0.8
	},
	{
		text = "The only thing I know is that I'm never letting go"
		display_time = 104.4
		holdtime = 4.0
	},
	{
		text = "I'm holding on while staring at the ground"
		display_time = 134.5
		holdtime = 2.6
	},
	{
		text = "Nothing else can hold me down"
		display_time = 140.5
		holdtime = 2.4
	},
	{
		text = "I'm waiting for the life I used to know"
		display_time = 145.7
		holdtime = 2.7
	},
	{
		text = "And I'm looking down"
		display_time = 150.6
		holdtime = 0.6
	},
	{
		text = "But I never let go"
		display_time = 153.3
		holdtime = 0.4
	},
	{
		text = "But I never let go"
		display_time = 175.5
		holdtime = 0.5
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 179.3
		holdtime = 0.7
	},
	{
		text = "But I never let go"
		display_time = 181.0
		holdtime = 0.4
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 184.8
		holdtime = 0.7
	},
	{
		text = "But I never let go"
		display_time = 186.5
		holdtime = 0.5
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 190.3
		holdtime = 0.85
	},
	{
		text = "The only thing I know is that I'm never letting go"
		display_time = 192.7
		holdtime = 3.9
	},
];

lyrics_battlecry <- [
	{
		message = "Another one hits the water"
		display_time = 3.8
		holdtime = 1.5
	},
	{
		message = "Another one calls my name"
		display_time = 6.5
		holdtime = 1.4
	},
	{
		message = "A daughter has lost her father\nto the killing game"
		display_time = 9.2
		holdtime = 3.4
	},
	{
		message = "A city burned down to ashes"
		display_time = 14.4
		holdtime = 1.6
	},
	{
		message = "Memories lost in vain"
		display_time = 17.3
		holdtime = 1.2
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		display_time = 19.8
		holdtime = 3.1
	},
	{
		message = "Can you hear the sirens?"
		display_time = 25.1
		holdtime = 1.2
	},
	{
		message = "Can you see the enemy line?"
		display_time = 27.7
		holdtime = 1.4
	},
	{
		message = "I feel it coming closer"
		display_time = 30.34
		holdtime = 1.0
	},
	{
		message = "We're braver than a lion"
		display_time = 35.6
		holdtime = 1.2
	},
	{
		message = "We're steady in our state of mind"
		display_time = 38.3
		holdtime = 1.5
	},
	{
		message = "Keeping our composure"
		display_time = 41.1
		holdtime = 1.0
	},
	{
		message = "Battlecry"
		display_time = 45.4
		holdtime = 1.6
	},
	{
		message = "Can you feel it taking over?"
		display_time = 48.7
		holdtime = 1.1
	},
	{
		message = "Can you feel it taking over?"
		display_time = 51.4
		holdtime = 2.0
	},
	{
		message = "Battlecry"
		display_time = 56.0
		holdtime = 1.6
	},
	{
		message = "Can you feel it taking over?"
		display_time = 59.4
		holdtime = 1.2
	},
	{
		message = "Can you feel it taking over?"
		display_time = 62.1
		holdtime = 1.9
	},
	{
		message = "Can you hear the sirens?"
		display_time = 89.2
		holdtime = 1.1
	},
	{
		message = "Can you see the enemy line?"
		display_time = 91.6
		holdtime = 1.2
	},
	{
		message = "I feel it coming closer"
		display_time = 94.4
		holdtime = 1.4
	},
	{
		message = "We're braver than a lion"
		display_time = 99.7
		holdtime = 1.3
	},
	{
		message = "We're steady in our state of mind"
		display_time = 102.4
		holdtime = 1.5
	},
	{
		message = "Keeping our composure"
		display_time = 105.1
		holdtime = 1.0
	},
	{
		message = "Another one breaks the silence"
		display_time = 110.4
		holdtime = 1.4
	},
	{
		message = "Another one shuts the door"
		display_time = 113.2
		holdtime = 1.3
	},
	{
		message = "We're never gonna be the same\nas we have been before"
		display_time = 115.8
		holdtime = 3.3
	},
	{
		message = "A city burned down to ashes"
		display_time = 121.2
		holdtime = 1.8
	},
	{
		message = "Memories lost in vain"
		display_time = 124.0
		holdtime = 1.2
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		display_time = 126.6
		holdtime = 3.2
	},
	{
		message = "Can you hear the sirens?"
		display_time = 131.8
		holdtime = 1.2
	},
	{
		message = "Can you see the enemy line?"
		display_time = 134.4
		holdtime = 1.3
	},
	{
		message = "I feel it coming closer"
		display_time = 137.0
		holdtime = 1.3
	},
	{
		message = "We're braver than a lion"
		display_time = 142.3
		holdtime = 1.4
	},
	{
		message = "We're steady in our state of mind"
		display_time = 145.0
		holdtime = 1.7
	},
	{
		message = "Keeping our composure"
		display_time = 147.7
		holdtime = 1.3
	},
	{
		message = "Battlecry"
		display_time = 151.9
		holdtime = 1.6
	},
	{
		message = "Can you feel it taking over?"
		display_time = 155.5
		holdtime = 1.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 158.1
		holdtime = 2.0
	},
	{
		message = "Battlecry"
		display_time = 162.7
		holdtime = 1.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 166.1
		holdtime = 1.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 168.9
		holdtime = 2.0
	},
	{
		message = "Can you hear the sirens?"
		display_time = 195.9
		holdtime = 1.0
	},
	{
		message = "Can you see the enemy line?"
		display_time = 198.6
		holdtime = 1.2
	},
	{
		message = "I feel it coming closer"
		display_time = 201.0
		holdtime = 1.3
	},
	{
		message = "We're braver than a lion"
		display_time = 206.6
		holdtime = 1.25
	},
	{
		message = "We're steady in our state of mind"
		display_time = 209.1
		holdtime = 1.6
	},
	{
		message = "Keeping our composure"
		display_time = 211.9
		holdtime = 1.2
	},
	{
		message = "Battlecry"
		display_time = 216.2
		holdtime = 1.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 219.5
		holdtime = 1.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 222.2
		holdtime = 2.0
	},
	{
		message = "Battlecry"
		display_time = 226.7
		holdtime = 1.7
	},
	{
		message = "Can you feel it taking over?"
		display_time = 230.2
		holdtime = 1.6
	},
	{
		message = "Can you feel it taking over?"
		display_time = 232.9
		holdtime = 2.1
	},
];

lyrics_gravity <- [
	{
		text = "We slip away, yeah"
		display_time = 21.0
		holdtime = 1.8
	}
	{
		text = "Let gravity defy"
		display_time = 24.28
		holdtime = 1.8
	},
	{
		text = "We're falling through the light"
		display_time = 27.14
		holdtime = 3.3
	},
	{
		text = "We slip away, yeah"
		display_time = 32.00
		holdtime = 1.8
	},
	{
		text = "Let gravity defy"
		display_time = 35.3
		holdtime = 1.8
	},
	{
		text = "We're falling through the light"
		display_time = 38.2
		holdtime = 3.5
	},
	{
		text = "Oh-whoa~"
		display_time = 44.7
		holdtime = 0.9
	},
	{
		text = "Oh-whoa~"
		display_time = 47.5
		holdtime = 0.9
	},
	{
		text = "Oh-whoa~"
		display_time = 50.2
		holdtime = 0.9
	},
	{
		text = "Gravity defy"
		display_time = 52.4
		holdtime = 1.4
	},
	{
		text = "Oh-whoa~"
		display_time = 55.5
		holdtime = 1.0
	},
	{
		text = "Oh-whoa~"
		display_time = 58.4
		holdtime = 0.8
	}
	{
		text = "We're falling through the light"
		display_time = 60.3
		holdtime = 3.5
	},
	{
		text = "We slip away, yeah"
		display_time = 87.3
		holdtime = 1.7
	},
	{
		text = "Let gravity defy"
		display_time = 90.7
		holdtime = 1.4
	},
	{
		text = "We're falling through the light"
		display_time = 93.4
		holdtime = 2.8
	},
	{
		text = "We slip away, yeah"
		display_time = 98.3
		holdtime = 1.6
	},
	{
		text = "Let gravity defy"
		display_time = 101.7
		holdtime = 1.4
	},
	{
		text = "We're falling through the light"
		display_time = 104.4
		holdtime = 3.6
	},
	{
		text = "Oh-whoa~"
		display_time = 132.7
		holdtime = 1.4
	},
	{
		text = "Oh-whoa~"
		display_time = 135.7
		holdtime = 1.0
	},
	{
		text = "Oh-whoa~"
		display_time = 138.4
		holdtime = 1.0
	},
	{
		text = "Gravity defy"
		display_time = 140.7
		holdtime = 1.2
	},
	{
		text = "Oh-whoa~"
		display_time = 144.0
		holdtime = 1.1
	},
	{
		text = "Oh-whoa~"
		display_time = 146.5
		holdtime = 1.1
	},
	{
		text = "Oh-whoa~"
		display_time = 149.5
		holdtime = 1.3
	}
	{
		text = "We slip away, yeah"
		display_time = 153.6
		holdtime = 1.5
	},
	{
		text = "Let gravity defy"
		display_time = 156.7
		holdtime = 1.7
	},
	{
		text = "We're falling through the light"
		display_time = 159.6
		holdtime = 2.9
	},
	{
		text = "We're falling through the light"
		display_time = 165.0
		holdtime = 3.4
	},
	{
		text = "Let gravity defy"
		display_time = 170.8
		holdtime = 1.2
	},
	{
		text = "We slip away, yeah"
		display_time = 197.6
		holdtime = 1.6
	},
	{
		text = "Let gravity defy"
		display_time = 201.0
		holdtime = 1.4
	},
	{
		text = "We're falling through the light"
		display_time = 203.6
		holdtime = 2.9
	},
	{
		text = "We slip away, yeah"
		display_time = 208.6
		holdtime = 1.7
	},
	{
		text = "Let gravity defy"
		display_time = 212.0
		holdtime = 1.5
	},
	{
		text = "We're falling through the light"
		display_time = 214.7
		holdtime = 3.7
	},
	{
		text = "I'm falling..."
		display_time = 221.65
		holdtime = 1.4
	},
	{
		text = "I'm falling..."
		display_time = 227.4
		holdtime = 0.6
	},
	{
		text = "Gravity defy"
		display_time = 229.0
		holdtime = 1.0
	},
	{
		text = "I'm falling..."
		display_time = 232.7
		holdtime = 1.2
	},
	{
		text = "I'm falling..."
		display_time = 235.5
		holdtime = 0.3
	},
	{
		text = "We're falling through the light"
		display_time = 236.8
		holdtime = 3.4
	},
];

function DisplayLyrics(iNum)
{
	if (!lyrics_enable)
	{
		return;
	}

	if (lyrics_ent == null || !lyrics_ent.IsValid())
	{
		lyrics_ent = Entities.CreateByClassname("game_text");
		lyrics_ent.__KeyValueFromString("targetname", "lyrics_text");

		lyrics_ent.__KeyValueFromInt("effect", 0);
		lyrics_ent.__KeyValueFromInt("channel", 2);
		lyrics_ent.__KeyValueFromInt("spawnflags", 1);
		lyrics_ent.__KeyValueFromFloat("x", -1.0);
		lyrics_ent.__KeyValueFromFloat("y", 0.12);
		lyrics_ent.__KeyValueFromVector("color", Vector(128, 220, 220));
		lyrics_ent.__KeyValueFromInt("holdtime", 4);
		lyrics_ent.__KeyValueFromFloat("fadein", 0.5);
		lyrics_ent.__KeyValueFromFloat("fadeout", 0.5);
	}

	local t_time1 = Time();
	if (iNum == 1)
	{
		for (local i = 0; i < lyrics_sirens.len(); i++)
		{
			local t_message = lyrics_sirens[i].text;
			local t_holdtime = lyrics_sirens[i].holdtime;
			local t_color = lyrics_color[RandomInt(0, lyrics_color.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_sirens[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "SetText", t_message, t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "holdtime " + t_holdtime.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (iNum == 2)
	{
		for (local i = 0; i < lyrics_battlecry.len(); i++)
		{
			local t_message = lyrics_battlecry[i].message;
			local t_holdtime = lyrics_battlecry[i].holdtime;
			local t_color = lyrics_color[RandomInt(0, lyrics_color.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_battlecry[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "SetText", t_message, t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "holdtime " + t_holdtime.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (iNum == 3)
	{
		for (local i = 0; i < lyrics_gravity.len(); i++)
		{
			local t_message = lyrics_gravity[i].text;
			local t_holdtime = lyrics_gravity[i].holdtime;
			local t_color = lyrics_color[RandomInt(0, lyrics_color.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_gravity[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "SetText", t_message, t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "holdtime " + t_holdtime.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else
	{
		lyrics_ent.__KeyValueFromString("message", "ERROR: INVALID LYRIC NUMBER SPECIFIED");
		EntFireByHandle(lyrics_ent, "Display", "", 0.0, null, null);
	}
}