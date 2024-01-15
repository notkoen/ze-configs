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
	"48 108 40",
	"58 255 255",
	"255 12 88",
	"255 255 2",
	"222 250 252",
];

lyrics_sirens <- [
	{
		text = "Blaine Stranger - Sirens ft. Voicians"
		display_time = 0.1
	},
	{
		text = "All I hear is sirens"
		display_time = 23.0
	},
	{
		text = "What I need is silence"
		display_time = 28.9
	},
	{
		text = "Everything is fading"
		display_time = 34.5
	},
	{
		text = "Away from me"
		display_time = 40.0
	},
	{
		text = "I'm holding on while staring at the ground"
		display_time = 46.2
	},
	{
		text = "Rising up to only fall back down"
		display_time = 52.2
	},
	{
		text = "This silence screams that crying make no sound"
		display_time = 57.4
	},
	{
		text = "And I'm looking down"
		display_time = 62.3
	},
	{
		text = "But I never let go"
		display_time = 65.1
	},
	{
		text = "But I never let go"
		display_time = 87.0
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 91.0
	},
	{
		text = "But I never let go"
		display_time = 92.6
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 96.6
	},
	{
		text = "But I never let go"
		display_time = 98.3
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 102.0
	},
	{
		text = "The only thing I know is that I'm never letting go"
		display_time = 104.6
	},
	{
		text = "I'm holding on while staring at the ground"
		display_time = 134.5
	},
	{
		text = "Nothing else can hold me down"
		display_time = 140.5
	},
	{
		text = "I'm waiting for the life I used to know"
		display_time = 145.8
	},
	{
		text = "And I'm looking down"
		display_time = 150.6
	},
	{
		text = "But I never let go"
		display_time = 153.4
	},
	{
		text = "But I never let go"
		display_time = 178.5
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 179.3
	},
	{
		text = "But I never let go"
		display_time = 181.4
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 184.8
	},
	{
		text = "But I never let go"
		display_time = 186.6
	},
	{
		text = "Woah-oh-eh-oh"
		display_time = 190.4
	},
	{
		text = "The only thing I know is that I'm never letting go"
		display_time = 192.8
	},
];

lyrics_battlecry <- [
	{
		message = "Mazard & Philip Strange - Battlecry"
		display_time = 0.1
	},
	{
		message = "Another one hits the water"
		display_time = 3.9
	},
	{
		message = "Another one calls my name"
		display_time = 6.5
	},
	{
		message = "A daughter has lost her father\nto the killing game"
		display_time = 9.2
	},
	{
		message = "A city burned down to ashes"
		display_time = 14.5
	},
	{
		message = "Memories lost in vain"
		display_time = 17.3
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		display_time = 19.8
	},
	{
		message = "Can you hear the sirens?"
		display_time = 25.1
	},
	{
		message = "Can you see the enemy line?"
		display_time = 27.7
	},
	{
		message = "I feel it coming closer"
		display_time = 30.34
	},
	{
		message = "We're braver than a lion"
		display_time = 35.6
	},
	{
		message = "We're steady in our state of mind"
		display_time = 38.3
	},
	{
		message = "Keeping our composure"
		display_time = 41.1
	},
	{
		message = "Battlecry (battlecry)"
		display_time = 45.4
	},
	{
		message = "Can you feel it taking over"
		display_time = 48.7
	},
	{
		message = "Can you feel it taking over"
		display_time = 51.4
	},
	{
		message = "Battlecry (battlecry)"
		display_time = 56.0
	},
	{
		message = "Can you feel it taking over"
		display_time = 59.4
	},
	{
		message = "Can you feel it taking over"
		display_time = 62.1
	},
	{
		message = "Can you hear the sirens?"
		display_time = 89.2
	},
	{
		message = "Can you see the enemy line?"
		display_time = 91.6
	},
	{
		message = "I feel it coming closer"
		display_time = 94.4
	},
	{
		message = "We're braver than a lion"
		display_time = 99.7
	},
	{
		message = "We're steady in our state of mind"
		display_time = 102.4
	},
	{
		message = "Keeping our composure"
		display_time = 105.1
	},
	{
		message = "Another one breaks the silence"
		display_time = 110.4
	},
	{
		message = "Another one shuts the door"
		display_time = 113.2
	},
	{
		message = "We're never gonna be the same\nas we have been before"
		display_time = 115.8
	},
	{
		message = "A city burned down to ashes"
		display_time = 121.2
	},
	{
		message = "Memories lost in vain"
		display_time = 124.0
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		display_time = 126.6
	},
	{
		message = "Can you hear the sirens?"
		display_time = 131.8
	},
	{
		message = "Can you see the enemy line?"
		display_time = 134.4
	},
	{
		message = "I feel it coming closer"
		display_time = 137.0
	},
	{
		message = "We're braver than a lion"
		display_time = 142.3
	},
	{
		message = "We're steady in our state of mind"
		display_time = 145.0
	},
	{
		message = "Keeping our composure"
		display_time = 147.7
	},
	{
		message = "Battlecry (Battlecry)"
		display_time = 151.9
	},
	{
		message = "Can you feel it taking over?"
		display_time = 155.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 158.1
	},
	{
		message = "Battlecry (Battlecry)"
		display_time = 162.7
	},
	{
		message = "Can you feel it taking over?"
		display_time = 166.1
	},
	{
		message = "Can you feel it taking over?"
		display_time = 168.9
	},
	{
		message = "Can you hear the sirens?"
		display_time = 195.9
	},
	{
		message = "Can you see the enemy line?"
		display_time = 198.6
	},
	{
		message = "I feel it coming closer"
		display_time = 201.0
	},
	{
		message = "We're braver than a lion"
		display_time = 206.6
	},
	{
		message = "We're steady in our state of mind"
		display_time = 209.1
	},
	{
		message = "Keeping our composure"
		display_time = 211.9
	},
	{
		message = "Battlecry (Battlecry)"
		display_time = 216.2
	},
	{
		message = "Can you feel it taking over?"
		display_time = 219.5
	},
	{
		message = "Can you feel it taking over?"
		display_time = 222.2
	},
	{
		message = "Battlecry (Battlecry)"
		display_time = 226.7
	},
	{
		message = "Can you feel it taking over?"
		display_time = 230.2
	},
	{
		message = "Can you feel it taking over?"
		display_time = 232.9
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
			local t_color = lyrics_color[RandomInt(0, lyrics_color.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_sirens[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (iNum == 2)
	{
		for (local i = 0; i < lyrics_battlecry.len(); i++)
		{
			local t_message = lyrics_battlecry[i].message;
			local t_color = lyrics_color[RandomInt(0, lyrics_color.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_battlecry[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
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