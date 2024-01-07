// ze_ffxii_mt_bur_omisace_v5_k2 lyrics
// music script modified from bxzl

g_bEnableLyrics <- true;

lyrics_ent <- null;

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
]

function DisplaySirenLyrics()
{
	if (!g_bEnableLyrics)
	{
		return;
	}

	if (display_style == 1)
	{
		if (lyrics_ent == null || !lyrics_ent.IsValid())
		{
			lyrics_ent = Entities.CreateByClassname("env_message");
			lyrics_ent.__KeyValueFromString("targetname", "lyrics_text");
			lyrics_ent.__KeyValueFromInt("spawnflags", 2);
			lyrics_ent.__KeyValueFromInt("messagevolume", 0);
			lyrics_ent.__KeyValueFromInt("messageattenuation", 0);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_sirens.len(); i++)
		{
			local t_message = lyrics_sirens[i].text;
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_sirens[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "ShowMessage", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (display_style == 2)
	{
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
		for (local i = 0; i < lyrics_sirens.len(); i++)
		{
			local t_message = lyrics_sirens[i].text;
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_sirens[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}

lyrics_gravity <- [
	{
		text = "Metrik - Gravity"
		display_time = 0.1
	},
	{
		text = "Let gravity defy"
		display_time = 2.2
	},
	{
		text = "We're falling through the light"
		display_time = 4.9
	},
	{
		text = "We slip away, yeah"
		display_time = 9.8
	},
	{
		text = "Let gravity defy"
		display_time = 13.1
	},
	{
		text = "We're falling through the light"
		display_time = 16.0
	},
	{
		text = "Oh-whoa~"
		display_time = 22.3
	},
	{
		text = "Oh-whoa~"
		display_time = 24.8
	},
	{
		text = "Oh-whoa~"
		display_time = 27.5
	},
	{
		text = "Gravity defy"
		display_time = 30.1
	},
	{
		text = "Oh-whoa"
		display_time = 33.4
	},
	{
		text = "Oh-whoa"
		display_time = 36.0
	}
	{
		text = "We're falling through the light"
		display_time = 38.3
	},
	{
		text = "We slip away, yeah"
		display_time = 65.1
	},
	{
		text = "Let gravity defy"
		display_time = 68.2
	},
	{
		text = "We're falling through the light"
		display_time = 71.2
	},
	{
		text = "We slip away, yeah"
		display_time = 76.1
	},
	{
		text = "Let gravity defy"
		display_time = 79.4
	},
	{
		text = "We're falling through the light"
		display_time = 82.1
	},
	{
		text = "Oh-whoa~"
		display_time = 110.5
	},
	{
		text = "Oh-whoa~"
		display_time = 113.3
	},
	{
		text = "Oh-whoa~"
		display_time = 116.0
	},
	{
		text = "Gravity defy"
		display_time = 118.2
	},
	{
		text = "Oh-whoa~"
		display_time = 121.6
	},
	{
		text = "Oh-whoa~"
		display_time = 127.1
	},
	{
		text = "We slip away, yeah"
		display_time = 131.2
	},
	{
		text = "Let gravity defy"
		display_time = 134.5
	},
	{
		text = "We're falling through the light"
		display_time = 137.3
	},
	{
		text = "We're falling through the light"
		display_time = 142.8
	},
	{
		text = "Let gravity defy"
		display_time = 148.4
	},
	{
		text = "We slip away, yeah"
		display_time = 175.4
	},
	{
		text = "Let gravity defy"
		display_time = 178.7
	},
	{
		text = "We're falling through the light"
		display_time = 181.5
	},
	{
		text = "We slip away, yeah"
		display_time = 186.4
	},
	{
		text = "Let gravity defy"
		display_time = 189.7
	},
	{
		text = "We're falling through the light"
		display_time = 192.6
	},
]

function DisplayGravityLyrics()
{
	if (!g_bEnableLyrics)
	{
		return;
	}

	if (display_style == 1)
	{
		if (lyrics_ent == null || !lyrics_ent.IsValid())
		{
			lyrics_ent = Entities.CreateByClassname("env_message");
			lyrics_ent.__KeyValueFromString("targetname", "lyrics_text");
			lyrics_ent.__KeyValueFromInt("spawnflags", 2);
			lyrics_ent.__KeyValueFromInt("messagevolume", 0);
			lyrics_ent.__KeyValueFromInt("messageattenuation", 0);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_gravity.len(); i++)
		{
			local t_message = lyrics_gravity[i].text;
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_gravity[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "ShowMessage", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (display_style == 2)
	{
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
		for (local i = 0; i < lyrics_gravity.len(); i++)
		{
			local t_message = lyrics_gravity[i].text;
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_gravity[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}

lyrics_come_alive <- [
	{
		text = "Pendulum - Come Alive"
		display_time = 0.1
	},
	{
		text = "Slave to a vision"
		display_time = 28.0
	},
	{
		text = "Stranger from the outside"
		display_time = 32.6
	},
	{
		text = "Eyes against a prism"
		display_time = 37.45
	},
	{
		text = "Caught you in the headlights"
		display_time = 42.0
	},
	{
		text = "Head against the wire"
		display_time = 65.3
	},
	{
		text = "Helping me get closer"
		display_time = 70.0
	},
	{
		text = "Set yourself on fire"
		display_time = 74.7
	},
	{
		text = "And show me when it's over"
		display_time = 79.1
	},
	{
		text = "'Cause I come alive when you're alone"
		display_time = 83.4
	},
	{
		text = "You've got nothing to fear"
		display_time = 90.3
	},
	{
		text = "Restless eyes on your shadow"
		display_time = 94.8
	},
	{
		text = "This time, you'll know I'm here"
		display_time = 100.0
	},
	{
		text = "Hail to the seeker"
		display_time = 111.9
	},
	{
		text = "Waiting on a breakthrough"
		display_time = 116.7
	},
	{
		text = "Ears for every hour"
		display_time = 121.3
	},
	{
		text = "This is what it's come to"
		display_time = 125.9
	},
	{
		text = "'Cause I come alive when you're alone"
		display_time = 129.9
	},
	{
		text = "You've got nothing to fear"
		display_time = 136.9
	},
	{
		text = "Restless eyes on your shadow"
		display_time = 141.3
	},
	{
		text = "This time, you'll know I'm here"
		display_time = 146.3
	},
	{
		text = "'Cause I come alive when you're alone"
		display_time = 204.6
	},
	{
		text = "You've got nothing to fear"
		display_time = 211.6
	},
	{
		text = "Restless eyes on your shadow"
		display_time = 215.9
	},
	{
		text = "This time, you'll know I'm here"
		display_time = 220.8
	},
]

function DisplayComeAliveLyrics()
{
	if (!g_bEnableLyrics)
	{
		return;
	}

	if (display_style == 1)
	{
		if (lyrics_ent == null || !lyrics_ent.IsValid())
		{
			lyrics_ent = Entities.CreateByClassname("env_message");
			lyrics_ent.__KeyValueFromString("targetname", "lyrics_text");
			lyrics_ent.__KeyValueFromInt("spawnflags", 2);
			lyrics_ent.__KeyValueFromInt("messagevolume", 0);
			lyrics_ent.__KeyValueFromInt("messageattenuation", 0);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_come_alive.len(); i++)
		{
			local t_message = lyrics_come_alive[i].text;
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_come_alive[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "ShowMessage", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (display_style == 2)
	{
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
		for (local i = 0; i < lyrics_come_alive.len(); i++)
		{
			local t_message = lyrics_come_alive[i].text;
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_come_alive[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}