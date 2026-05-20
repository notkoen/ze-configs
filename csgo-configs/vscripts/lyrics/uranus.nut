// ze_uranus_attack_v1
// music script modified from bxzl

lyrics_gametext <- null;

// 1 = center text, 2 = game_text
display_style <- 1;

lyrics_colors <- [
	"#def219",
	"#ee12f4",
	"#b65b9e",
	"#d31ef7",
	"#02eae9",
	"#ffffff",
	"#d41c1c",
	"#306c28",
	"#3affff",
	"#ff0c58",
	"#ffff02",
	"#defafc",
]

lyrics_color_rgb <- [
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
]

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
]

function DisplayLyrics()
{
	if (display_style == 1)
	{
		if (lyrics_gametext == null || !lyrics_gametext.IsValid())
		{
			lyrics_gametext = Entities.CreateByClassname("env_message");
			lyrics_gametext.__KeyValueFromString("targetname", "lyrics_text");
			lyrics_gametext.__KeyValueFromInt("spawnflags", 2);
			lyrics_gametext.__KeyValueFromInt("messagevolume", 0);
			lyrics_gametext.__KeyValueFromInt("messageattenuation", 0);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_battlecry.len(); i++)
		{

			local t_message = lyrics_battlecry[i].text;
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_battlecry[i].display_time - t_time2;

			EntFireByHandle(lyrics_gametext, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_gametext, lyrics_gametext);
			EntFireByHandle(lyrics_gametext, "ShowMessage", "", t_delay, lyrics_gametext, lyrics_gametext);
		}
	}
	else if (display_style == 2)
	{
		if (lyrics_gametext == null || !lyrics_gametext.IsValid())
		{
			lyrics_gametext = Entities.CreateByClassname("game_text");
			lyrics_gametext.__KeyValueFromString("targetname", "lyrics_text_battlecry");

			lyrics_gametext.__KeyValueFromInt("effect", 0);
			lyrics_gametext.__KeyValueFromInt("channel", 2);
			lyrics_gametext.__KeyValueFromInt("spawnflags", 1);
			lyrics_gametext.__KeyValueFromFloat("x", -1.0);
			lyrics_gametext.__KeyValueFromFloat("y", 0.8);
			lyrics_gametext.__KeyValueFromVector("color", Vector(128, 220, 220));
			lyrics_gametext.__KeyValueFromInt("holdtime", 2);
			lyrics_gametext.__KeyValueFromInt("holdtime", 4);
			lyrics_gametext.__KeyValueFromFloat("fadein", 0.5);
			lyrics_gametext.__KeyValueFromFloat("fadeout", 0.5);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_battlecry.len(); i++)
		{

			local t_message = lyrics_battlecry[i].message;
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_battlecry[i].display_time - t_time2;

			EntFireByHandle(lyrics_gametext, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_gametext, lyrics_gametext);
			EntFireByHandle(lyrics_gametext, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_gametext, lyrics_gametext);
			EntFireByHandle(lyrics_gametext, "Display", "", t_delay, lyrics_gametext, lyrics_gametext);
		}
	}
}