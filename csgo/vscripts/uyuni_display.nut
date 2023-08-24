// Script by koen (STEAM_1:1:114921174)
// with help from LzYorHa and Luffaren

// EndlessMode Decides which name/discription to display (Boolean: 0 = Not endless mode, 1 = Endless mode)
EndlessMode <- 0;

items_pickup <- [
	["COOL LIGHT - FREEZES NEARBY ZOMBIES\nDuration: 7s\nCooldown: 60s",
	"ABSOLUTE TEMPERATURE - FREEZE EVERYTHING\nDuration: 10s\nActivation: 5s\nCooldown: 75s"],

	["WARM LIGHT - BURNS NEARBY ZOMBIES\nDuration: 6s\nCooldown: 60s",
	"SUNLIGHT - BURN EVERYTHINGnDuration: 7s\nActivation: 5s\nCooldown: 75s"],

	["GALE LIGHT - PUSHES NEARBY ZOMBIES\nDuration: 7s\nCooldown: 60s",
	"ANEMOI - BLOW EVERYTHING AWAY\nDuration: 7s\nCooldown: 75s\nActivation: 5s"],

	["HOLY LIGHT - HEAL NEARBY HUMANS\nDuration: 7s\nCooldown: 60s",
	"HOLY LIGHT - HEAL NEARBY HUMANS\nDuration: 7s\nCooldown: 60s"]
];

// Cooldown array
items <- [-1, -1, -1, -1];

// Display item information
function DisplayItemDescription(index)
{
	self.__KeyValueFromString("message", items_pickup[index][EndlessMode]);
	EntFireByHandle(self, "Display", "", 0.1, activator, null);
}

show_item_cd <- true

item_count <- 4

items_text <- [
	["Ice", "Blizzard"],
	["Fire", "Sunlight"],
	["Wind", "Anemoi"],
	["Heal", "Heal"]
]

item_cd <- [
	[60,75],
	[60,75],
	[60,75],
	[60,60]
]

function ItemUsed(index)
{
	items[index] = item_cd[index][EndlessMode];
	EntFireByHandle(self, "RunScriptCode", "ItemCDUpdate(" + index.tostring() + ")", 1.0, null, null);
}

function ItemCDUpdate(index)
{
	if (items[index] > 0)
	{
		items[index] -= 1;
		EntFireByHandle(self, "RunScriptCode", "ItemCDUpdate(" + index.tostring() + ")", 1.0, null, null);
	}
}

// Call the following function at begining on each round:
function UpdateDisplayItemText()
{
	if (!show_item_cd)
	{
		return;
	}

	local txt = "";
	for (local i = 0; i < item_count; i++)
	{
		if (items[i] > -1)
		{
			txt += items_text[i][EndlessMode] + "[" + (items[i] > 0 ? items[i].tointeger() : "R") + "]" + "\n";
		}
	}

	if (txt != "")
	{
		self.__KeyValueFromString("message", txt);
		iPlayer <- null;

		while ((iPlayer = Entities.FindByClassname(iPlayer, "player")) != null)
		{
			if (iPlayer.GetTeam() == 3)
			{
				EntFireByHandle(self, "Display", "", 0.05, iPlayer, null);
			}
		}
	}
	EntFireByHandle(self, "RunScriptCode", "UpdateDisplayItemText()", 0.1, null, null);
}