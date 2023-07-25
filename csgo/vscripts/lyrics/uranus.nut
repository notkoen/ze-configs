// ze_uranus_attack_v1
// music script modified from bxzl

lyrics_gametext <- null;

lyrics_battlecry <- [
	{
		message = "Mazard & Philip Strange - Battlecry"
		holdtime = 2.3
		fadein = 0.1
		fadeout = 0.1
		display_time = 0.1
	},
	{
		message = "Another one hits the water"
		holdtime = 2.1
		fadein = 0.1
		fadeout = 0.1
		display_time = 3.9
	},
	{
		message = "Another one calls my name"
		holdtime = 2.2
		fadein = 0.1
		fadeout = 0.1
		display_time = 6.5
	},
	{
		message = "A daughter has lost her father\nto the killing game"
		holdtime = 4.1
		fadein = 0.1
		fadeout = 0.1
		display_time = 9.2
	},
	{
		message = "A city burned down to ashes"
		holdtime = 2.2
		fadein = 0.1
		fadeout = 0.1
		display_time = 14.5
	},
	{
		message = "Memories lost in vain"
		holdtime = 2.0
		fadein = 0.1
		fadeout = 0.1
		display_time = 17.3
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		holdtime = 3.8
		fadein = 0.1
		fadeout = 0.1
		display_time = 19.8
	},
	{
		message = "Can you hear the sirens?"
		holdtime = 2.1
		fadein = 0.1
		fadeout = 0.1
		display_time = 25.1
	},
	{
		message = "Can you see the enemy line?"
		holdtime = 2.33
		fadein = 0.1
		fadeout = 0.1
		display_time = 27.7
	},
	{
		message = "I feel it coming closer"
		holdtime = 2.07
		fadein = 0.1
		fadeout = 0.1
		display_time = 30.34
	},
	{
		message = "We're braver than a lion"
		holdtime = 2.04
		fadein = 0.1
		fadeout = 0.1
		display_time = 35.6
	},
	{
		message = "We're steady in our state of mind"
		holdtime = 2.27
		fadein = 0.1
		fadeout = 0.1
		display_time = 38.3
	},
	{
		message = "Keeping our composure"
		holdtime = 2.04
		fadein = 0.1
		fadeout = 0.1
		display_time = 41.1
	},
	{
		message = "Battlecry (battlecry)"
		holdtime = 2.33
		fadein = 0.1
		fadeout = 0.1
		display_time = 45.4
	},
	{
		message = "Can you feel it taking over"
		holdtime = 2.3
		fadein = 0.1
		fadeout = 0.1
		display_time = 48.7
	},
	{
		message = "Can you feel it taking over"
		holdtime = 3.00
		fadein = 0.1
		fadeout = 0.1
		display_time = 51.4
	},
	{
		message = "Battlecry (battlecry)"
		holdtime = 2.28
		fadein = 0.1
		fadeout = 0.1
		display_time = 56.0
	},
	{
		message = "Can you feel it taking over"
		holdtime = 2.28
		fadein = 0.1
		fadeout = 0.1
		display_time = 59.4
	},
	{
		message = "Can you feel it taking over"
		holdtime = 3.04
		fadein = 0.1
		fadeout = 0.1
		display_time = 62.1
	},
	{
		message = "Can you hear the sirens?"
		holdtime = 1.87
		fadein = 0.1
		fadeout = 0.1
		display_time = 89.2
	},
	{
		message = "Can you see the enemy line?"
		holdtime = 2.07
		fadein = 0.1
		fadeout = 0.1
		display_time = 91.6
	},
	{
		message = "I feel it coming closer"
		holdtime = 2.07
		fadein = 0.1
		fadeout = 0.1
		display_time = 94.4
	},
	{
		message = "We're braver than a lion"
		holdtime = 1.81
		fadein = 0.1
		fadeout = 0.1
		display_time = 99.7
	},
	{
		message = "We're steady in our state of mind"
		holdtime = 2.17
		fadein = 0.1
		fadeout = 0.1
		display_time = 102.4
	},
	{
		message = "Keeping our composure"
		holdtime = 1.96
		fadein = 0.1
		fadeout = 0.1
		display_time = 105.1
	},
	{
		message = "Another one breaks the silence"
		holdtime = 2.12
		fadein = 0.1
		fadeout = 0.1
		display_time = 110.4
	},
	{
		message = "Another one shuts the door"
		holdtime = 1.80
		fadein = 0.1
		fadeout = 0.1
		display_time = 113.2
	},
	{
		message = "We're never gonna be the same\nas we have been before"
		holdtime = 3.88
		fadein = 0.1
		fadeout = 0.1
		display_time = 115.8
	},
	{
		message = "A city burned down to ashes"
		holdtime = 2.08
		fadein = 0.1
		fadeout = 0.1
		display_time = 121.2
	},
	{
		message = "Memories lost in vain"
		holdtime = 1.80
		fadein = 0.1
		fadeout = 0.1
		display_time = 124.0
	},
	{
		message = "It's only gonna make us stronger,\nas we heal the pain"
		holdtime = 4.21
		fadein = 0.1
		fadeout = 0.1
		display_time = 126.6
	},
	{
		message = "Can you hear the sirens?"
		holdtime = 1.84
		fadein = 0.1
		fadeout = 0.1
		display_time = 131.8
	},
	{
		message = "Can you see the enemy line?"
		holdtime = 2.15
		fadein = 0.1
		fadeout = 0.1
		display_time = 134.4
	},
	{
		message = "I feel it coming closer"
		holdtime = 1.98
		fadein = 0.1
		fadeout = 0.1
		display_time = 137.0
	},
	{
		message = "We're braver than a lion"
		holdtime = 2.01
		fadein = 0.1
		fadeout = 0.1
		display_time = 142.3
	},
	{
		message = "We're steady in our state of mind"
		holdtime = 2.13
		fadein = 0.1
		fadeout = 0.1
		display_time = 145.0
	},
	{
		message = "Keeping our composure"
		holdtime = 1.73
		fadein = 0.1
		fadeout = 0.1
		display_time = 147.7
	},
	{
		message = "Battlecry (Battlecry)"
		holdtime = 2.68
		fadein = 0.1
		fadeout = 0.1
		display_time = 151.9
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 2.08
		fadein = 0.1
		fadeout = 0.1
		display_time = 155.5
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 3.16
		fadein = 0.1
		fadeout = 0.1
		display_time = 158.1
	},
	{
		message = "Battlecry (Battlecry)"
		holdtime = 2.37
		fadein = 0.1
		fadeout = 0.1
		display_time = 162.7
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 2.37
		fadein = 0.1
		fadeout = 0.1
		display_time = 166.1
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 3.10
		fadein = 0.1
		fadeout = 0.1
		display_time = 168.9
	},
	{
		message = "Can you hear the sirens?"
		holdtime = 2.11
		fadein = 0.1
		fadeout = 0.1
		display_time = 195.9
	},
	{
		message = "Can you see the enemy line?"
		holdtime = 1.98
		fadein = 0.1
		fadeout = 0.1
		display_time = 198.6
	},
	{
		message = "I feel it coming closer"
		holdtime = 2.15
		fadein = 0.1
		fadeout = 0.1
		display_time = 201.0
	},
	{
		message = "We're braver than a lion"
		holdtime = 1.98
		fadein = 0.1
		fadeout = 0.1
		display_time = 206.6
	},
	{
		message = "We're steady in our state of mind"
		holdtime = 2.24
		fadein = 0.1
		fadeout = 0.1
		display_time = 209.1
	},
	{
		message = "Keeping our composure"
		holdtime = 1.74
		fadein = 0.1
		fadeout = 0.1
		display_time = 211.9
	},
	{
		message = "Battlecry (Battlecry)"
		holdtime = 2.32
		fadein = 0.1
		fadeout = 0.1
		display_time = 216.2
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 2.36
		fadein = 0.1
		fadeout = 0.1
		display_time = 219.5
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 1.86
		fadein = 0.1
		fadeout = 0.1
		display_time = 222.2
	},
	{
		message = "Battlecry (Battlecry)"
		holdtime = 2.61
		fadein = 0.1
		fadeout = 0.1
		display_time = 226.7
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 2.29
		fadein = 0.1
		fadeout = 0.1
		display_time = 230.2
	},
	{
		message = "Can you feel it taking over?"
		holdtime = 1.84
		fadein = 0.1
		fadeout = 0.1
		display_time = 232.9
	},
]

function DisplayLyrics()
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
		lyrics_gametext.__KeyValueFromVector("color2", Vector(128, 220, 220));
		lyrics_gametext.__KeyValueFromInt("holdtime", 2);
	}

	local t_time1 = Time();
	for (local i = 0;i < lyrics_battlecry.len();i++)
	{

		local t_holdtime = lyrics_battlecry[i].holdtime <= 0 ? 30 : lyrics_battlecry[i].holdtime;
		local t_fadein = lyrics_battlecry[i].fadein ? 0.5 : 0;
		local t_fadeout = lyrics_battlecry[i].fadeout ? 0.5 : 0;
		local t_message = lyrics_battlecry[i].message;

		local t_time2 = Time() - t_time1;
		local t_delay = lyrics_battlecry[i].display_time - t_time2;

		EntFireByHandle(lyrics_gametext, "Addoutput", "holdtime "+ t_holdtime.tostring(), t_delay,lyrics_gametext, lyrics_gametext);
		EntFireByHandle(lyrics_gametext, "Addoutput", "fadein "+ t_fadein.tostring(), t_delay, lyrics_gametext, lyrics_gametext);
		EntFireByHandle(lyrics_gametext, "Addoutput", "fadeout "+ t_fadeout.tostring(), t_delay, lyrics_gametext, lyrics_gametext);
		EntFireByHandle(lyrics_gametext, "Addoutput", "message "+ t_message.tostring(), t_delay, lyrics_gametext, lyrics_gametext);
		EntFireByHandle(lyrics_gametext, "Display", "", t_delay, lyrics_gametext, lyrics_gametext);
	}
}