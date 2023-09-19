// ze_slackerino_mapperino_v4 lyrics
// music script modified from bxzl

//==============================
// Global Variables
//==============================
g_bEnableLyrics <- true;

lyrics_ent <- null;

// 1 = center text, 2 = game_text
display_style <- 2;

// true = cn, false = en
chinese_lyrics <- false;

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

//==============================
// Pendulum - Nothing For Free
//==============================
lyrics_nothing_for_free <- [
	{
		message = "We've got a battle of the ages"
		display_time = 5.4
	},
	{
		message = "Calling the cavalry through your phone"
		display_time = 8.9
	},
	{
		message = "An army of the shameless"
		display_time = 11.7
	},
	{
		message = "Walking the line, tipping the throne"
		display_time = 14.9
	},
	{
		message = "There'll be nothing for you, nothing for me"
		display_time = 17.8
	},
	{
		message = "Nothing to fear, nothing to see"
		display_time = 20.9
	},
	{
		message = "You wanna take my life and fade away"
		display_time = 23.6
	},
	{
		message = "If you're gonna take me away tonight"
		display_time = 65.9
	},
	{
		message = "I'll return as a soldier"
		display_time = 69.3
	},
	{
		message = "Make my way to the waterline"
		display_time = 72.3
	},
	{
		message = "Find a bridge to get over"
		display_time = 75.2
	},
	{
		message = "Hold the line... Don't forget..."
		display_time = 78.2
	},
	{
		message = "Taking arms is taking heads"
		display_time = 80.9
	},
	{
		message = "Hold the line... Don't forget..."
		display_time = 83.9
	},
	{
		message = "Taking arms is taking heads"
		display_time = 86.9
	},
	{
		message = "Hold the line"
		display_time = 90.0
	},
	{
		message = "Don't forget"
		display_time = 91.4
	},
	{
		message = "Taking arms is taking heads"
		display_time = 92.9
	},
	{
		message = "Hold the line"
		display_time = 95.9
	},
	{
		message = "Don't forget"
		display_time = 97.4
	},
	{
		message = "Taking arms is taking heads"
		display_time = 98.9
	},
	{
		message = "Taking arms is taking heads"
		display_time = 105.1
	},
	{
		message = "Taking arms is taking heads"
		display_time = 111.0
	},
]

function DisplayNothingForFreeLyrics()
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
		for (local i = 0; i < lyrics_nothing_for_free.len(); i++)
		{
			local t_message = lyrics_nothing_for_free[i].message;
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_nothing_for_free[i].display_time - t_time2;

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
		for (local i = 0; i < lyrics_nothing_for_free.len(); i++)
		{
			local t_message = lyrics_nothing_for_free[i].message;
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_nothing_for_free[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}

//==============================
// Sawano Hiroyuki[nZk], ASCA - Unti-L
//==============================
lyrics_until <- [
	{
		message = "揺らされた橋で足元見てても進めない"
		message_en = "Even though I'm taking advantage of this swaying bridge,\nI can't seem to move forward"
		message_cn = "在摇晃的桥上即使注意脚步也难以前进"
		display_time = 0.3
	},
	{
		message = "Breath in the cold world"
		message_en = ""
		message_cn = "在寒冷的世界里呼吸"
		display_time = 8.3
	},
	{
		message = "届かない場所に手をかざすだけなら"
		message_en = "Because all I can do is reach out towards the unreachable"
		message_cn = "若是对无法触及之处仅掩目视之不见"
		display_time = 11.8
	},
	{
		message = "どんな拘りも透明色に掠れていく"
		message_en = "Just what kinds of obsessions get blurred into nothingness?"
		message_cn = "无论怎样的坚持都将化作虚无掠过"
		display_time = 18.8
	},
	{
		message = "帰らない街に背を向けてるなら"
		message_en = "I've turned my back upon this town"
		message_cn = "如果不愿面对那无法归去的城市"
		display_time = 28.0
	},
	{
		message = "戻る目印と綱はいらない"
		message_en = "I won't go back,\nso I don't need any markers or directions"
		message_cn = "那么归途的标记和绳索都不需要了"
		display_time = 32.0
	},
	{
		message = "Find the way - See the sky"
		message_en = ""
		message_cn = "找寻前路，追寻寰宇"
		display_time = 36.5
	},
	{
		message = "Find a dream - See the world"
		message_en = ""
		message_cn = "找寻梦想，追寻寰球"
		display_time = 39.2
	},
	{
		message = "抗うために毛布を捨てる"
		message_en = "In order to fight,\nI must throw away my weaknesses"
		message_cn = "为了去对抗一切必须先舍弃温暖"
		display_time = 41.2
	},
	{
		message = "Breath in the cold world"
		message_en = ""
		message_cn = "在寒冷的世界里呼吸"
		display_time = 63.0
	},
	{
		message = "誰とも混じらない灯りはないから"
		message_en = "Because there's no light that shines over everyone"
		message_cn = "因无光而无法与他人产生交集"
		display_time = 66.5
	},
	{
		message = "「それでも」と足掻いた願いは消えない"
		message_en = "'Even so...' my struggling desires won't disappear"
		message_cn = "「即便如此」想挣扎的愿望也未消失"
		display_time = 73.5
	},
	{
		message = "帰らない今を通るだけなら"
		message_en = "If only the irreversible present would pass right by me"
		message_cn = "如果只想着通关这无法重来的现在"
		display_time = 82.5
	},
	{
		message = "その悲しみは何も掬えない"
		message_en = "the grief wouldn't have left me so empty"
		message_cn = "那份空虚将无法拯救任何事物"
		display_time = 87.0
	},
	{
		message = "Find the way - See the sky"
		message_en = ""
		message_cn = "找寻前路，追寻寰宇"
		display_time = 91.5
	},
	{
		message = "Find a dream - See the world"
		message_en = ""
		message_cn = "找寻梦想，追寻寰球"
		display_time = 94.0
	},
	{
		message = "気付くために過ちを知る"
		message_en = "In order to understand,\nI must learn from my failures"
		message_cn = "为了去意识到必须先知晓何谓错误"
		display_time = 96.1
	},
]

function DisplayUntilLyrics()
{
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
		for (local i = 0; i < lyrics_until.len(); i++)
		{

			local t_message = "";
			if (chinese_lyrics)
			{
				t_message = lyrics_until[i].message + "\n" + lyrics_until[i].message_cn;
			}
			else
			{
				t_message = lyrics_until[i].message + "\n" + lyrics_until[i].message_en;
			}

			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_until[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "ShowMessage", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (display_style == 2)
	{
		if (lyrics_ent == null || !lyrics_ent.IsValid())
		{
			lyrics_ent = Entities.CreateByClassname("game_text");
			lyrics_ent.__KeyValueFromString("targetname", "lyrics_text_until");

			lyrics_ent.__KeyValueFromInt("effect", 0);
			lyrics_ent.__KeyValueFromInt("channel", 2);
			lyrics_ent.__KeyValueFromInt("spawnflags", 1);
			lyrics_ent.__KeyValueFromFloat("x", -1.0);
			lyrics_ent.__KeyValueFromFloat("y", 0.10);
			lyrics_ent.__KeyValueFromVector("color", Vector(128, 220, 220));
			lyrics_ent.__KeyValueFromInt("holdtime", 8);
			lyrics_ent.__KeyValueFromFloat("fadein", 0.5);
			lyrics_ent.__KeyValueFromFloat("fadeout", 0.5);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_until.len(); i++)
		{
			local t_message = "";
			if (chinese_lyrics)
			{
				t_message = lyrics_until[i].message + "\n" + lyrics_until[i].message_cn;
			}
			else
			{
				t_message = lyrics_until[i].message + "\n" + lyrics_until[i].message_en;
			}

			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_until[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}

//==============================
// Sawano Hiroyuki[nZk]:LiSA - narrative
//==============================
lyrics_narrative <- [
	{
		message = "Sawano Hiroyuki[nZk]:LiSA - narrative"
		message_en = ""
		message_cn = ""
		display_time = 0.1
	},
	{
		message = "記憶の層に隠れてしまう"
		message_en = "Hidden in the layers of my memory"
		message_cn = "曾向往那藏在记忆深处"
		display_time = 38.1
	},
	{
		message = "夢の色に憧れた君は"
		message_en = "You longed for the colors of your dreams"
		message_cn = "向往梦中色彩的你"
		display_time = 44.0
	},
	{
		message = "強さを装った大人の陰を"
		message_en = "I search for the guiding light"
		message_cn = "武装上强大"
		display_time = 49.5
	},
	{
		message = "踏まないように光を探した"
		message_en = "To not step into the darkness of the adults"
		message_cn = "为了不落入大人的黑暗而寻找光芒"
		display_time = 55.5
	},
	{
		message = "時計の針に押されそうな"
		message_en = "Seemingly pushed by the hands of the clock"
		message_cn = "被时钟的指针狠狠推着一般"
		display_time = 60.5
	},
	{
		message = "負け惜しみなどいらない"
		message_en = "I don't need to sour my defeat"
		message_cn = "没必要死不认输"
		display_time = 66.5
	},
	{
		message = "誰かの手を掴みそうに"
		message_en = "Just grab someone's hand"
		message_cn = "若是被击倒"
		display_time = 72.1
	},
	{
		message = "倒れていくなら"
		message_en = "If you fall"
		message_cn = "就试着抓住某人的手"
		display_time = 78.5
	},
	{
		message = "痛みと立ち上がっていく涙で描く"
		message_en = "With the pain and the dripping tears"
		message_cn = "用痛苦与倾泻而出的泪水"
		display_time = 83.5
	},
	{
		message = "埃と空の間を"
		message_en = "I paint the earth and the sky"
		message_cn = "描绘出天地间的一切"
		display_time = 89.3
	},
	{
		message = "落ちかけている子供の丘で"
		message_en = "Falling from the hill where children play"
		message_cn = "从孩子们玩耍的山丘上飞奔而下"
		display_time = 98.7
	},
	{
		message = "逃げた理由を背中に隠してる"
		message_en = "You're hiding your reasons for running away"
		message_cn = "你将逃避的理由藏在身后"
		display_time = 104.7
	},
	{
		message = "未来の声に脅かされそうで"
		message_en = "Seemingly threatened\nby the voice of the future"
		message_cn = "仿佛被未来的声音威胁"
		display_time = 110.3
	},
	{
		message = "僕を守る君は震えていた"
		message_en = "You are trembling, protecting me"
		message_cn = "保护着我的你浑身颤抖"
		display_time = 116.5
	},
	{
		message = "後悔に慣れた独り言"
		message_en = "Long used to a monologue filled with regret"
		message_cn = "习以为常地后悔的自言自语"
		display_time = 121.5
	},
	{
		message = "歩き出す音で消した"
		message_en = "Just cover it with the sound of walking"
		message_cn = "就用飞奔而出的脚步声掩盖吧"
		display_time = 127.5
	},
	{
		message = "答えを出せない過去達に"
		message_en = "You don't have to seek shelter in the past"
		message_cn = "就算在无法得出答案的过去里"
		display_time = 133.2
	},
	{
		message = "庇われるなら"
		message_en = "Where you couldn't find the answer from"
		message_cn = "寻求庇护"
		display_time = 139.5
	},
	{
		message = "知らない明日を着て転べばいい"
		message_en = "It's fine to fall into an unknown tomorrow"
		message_cn = "只要和天真烂漫的愿望一起"
		display_time = 144.0
	},
	{
		message = "無邪気に咲いた願いと"
		message_en = "Accompanied by your innocent wishes"
		message_cn = "背负一切坠入位置的明日就好"
		display_time = 150.0
	},
	{
		message = "わがままな希望 幼い顔で笑う"
		message_en = "Even though you laugh like a child\nwith your indulging wishes"
		message_cn = "明明带着任性的希望 像孩子般笑着"
		display_time = 179.9
	},
	{
		message = "怯える怒りがこの身体を支えてる"
		message_en = "Your body is driven by fear and anger"
		message_cn = "你的身体却被恐惧和愤怒支配"
		display_time = 185.5
	},
	{
		message = "言葉ばかりの雨に消されないように"
		message_en = "Determined to not be erased\nby the rain of empty promises"
		message_cn = "为了不在满口空话的雨中消融"
		display_time = 191.1
	},
	{
		message = "今の灯りを目の前の答えとつなぐ"
		message_en = "I connect the brightness of this moment with my answer"
		message_cn = "我将此刻的光芒系上眼前的答案"
		display_time = 197.1
	},
	{
		message = "誰かの手を掴みそうに"
		message_en = "Just grab someone's hand"
		message_cn = "若是被击倒"
		display_time = 205.0
	},
	{
		message = "倒れていくなら"
		message_en = "If you fall"
		message_cn = "就试着抓住某人的手"
		display_time = 211.2
	},
	{
		message = "痛みと立ち上がっていく涙で描く"
		message_en = "With the pain and the dripping tears"
		message_cn = "用痛苦与倾泻而出的泪水"
		display_time = 216.5
	},
	{
		message = "埃と空の間を"
		message_en = "I paint the earth and the sky"
		message_cn = "描绘出天地间的一切"
		display_time = 222.0
	},
	{
		message = "わがままな希望 幼い顔で笑う"
		message_en = "Even though you laugh like a child\nwith your indulging wishes"
		message_cn = "明明带着任性的希望 像孩子般笑着"
		display_time = 229.0
	},
	{
		message = "怯える怒りがこの身体を支えてる"
		message_en = "Your body is driven by fear and anger"
		message_cn = "你的身体却被恐惧和愤怒支配"
		display_time = 234.8
	},
	{
		message = "言葉ばかりの雨に消されないように"
		message_en = "Determined to not be erased\nby the rain of empty promises"
		message_cn = "为了不在满口空话的雨中消融"
		display_time = 240.5
	},
	{
		message = "今の灯りを目の前の答えとつなぐ"
		message_en = "I connect the brightness of this moment with my answer"
		message_cn = "我将此刻的光芒系上眼前的答案"
		display_time = 246.5
	},
]

function DisplayNarrativeLyrics()
{
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
		for (local i = 0; i < lyrics_narrative.len(); i++)
		{
			local t_message = "";
			if (chinese_lyrics)
			{
				t_message = lyrics_narrative[i].message + "\n" + lyrics_narrative[i].message_cn;
			}
			else
			{
				t_message = lyrics_narrative[i].message + "\n" + lyrics_narrative[i].message_en;
			}
			local t_color = lyrics_colors[RandomInt(0, lyrics_colors.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_narrative[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message <font color='" + t_color.tostring() + "'>" + t_message.tostring() + "</font>", t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "ShowMessage", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
	else if (display_style == 2)
	{
		if (lyrics_ent == null || !lyrics_ent.IsValid())
		{
			lyrics_ent = Entities.CreateByClassname("game_text");
			lyrics_ent.__KeyValueFromString("targetname", "lyrics_text_narrative");

			lyrics_ent.__KeyValueFromInt("effect", 0);
			lyrics_ent.__KeyValueFromInt("channel", 2);
			lyrics_ent.__KeyValueFromInt("spawnflags", 1);
			lyrics_ent.__KeyValueFromFloat("x", -1.0);
			lyrics_ent.__KeyValueFromFloat("y", 0.8);
			lyrics_ent.__KeyValueFromVector("color", Vector(128, 220, 220));
			lyrics_ent.__KeyValueFromInt("holdtime", 8);
			lyrics_ent.__KeyValueFromFloat("fadein", 0.5);
			lyrics_ent.__KeyValueFromFloat("fadeout", 0.5);
		}

		local t_time1 = Time();
		for (local i = 0; i < lyrics_narrative.len(); i++)
		{
			local t_message = "";
			if (chinese_lyrics)
			{
				t_message = lyrics_narrative[i].message + "\n" + lyrics_narrative[i].message_cn;
			}
			else
			{
				t_message = lyrics_narrative[i].message + "\n" + lyrics_narrative[i].message_en;
			}
			local t_color = lyrics_color_rgb[RandomInt(0, lyrics_color_rgb.len() - 1)];
			local t_time2 = Time() - t_time1;
			local t_delay = lyrics_narrative[i].display_time - t_time2;

			EntFireByHandle(lyrics_ent, "AddOutput", "message " + t_message.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "AddOutput", "color " + t_color.tostring(), t_delay, lyrics_ent, lyrics_ent);
			EntFireByHandle(lyrics_ent, "Display", "", t_delay, lyrics_ent, lyrics_ent);
		}
	}
}