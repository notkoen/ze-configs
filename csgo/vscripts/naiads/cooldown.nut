// Cooldown vscript by koen (STEAM_1:1:114921174)

// Enable cooldown tracking system; Run an output "cd_script > RunScriptCode > show_item_cd = false" to disable it
show_item_cd <- true

// Number of items to be tracked
items_count <- 3

// Item ability text
items_text <- [
	["Framberge", "Flash Over", "Giga Flare"],
	["Heal", "Freezing Wall", "Frozen Field"],
	["Speed", "Gravity", "Fog"]
]

// Item cooldowns array
// 1 - Salamander: [Framberge, Flash Over, Giga Flare]
// 2 - Undine: [Heal, Freezing Wall, Frozen Field]
// 3 - Neikos: [Speed, Gravity, Fog]
items_cd <- [
	[80, 70, 150],
	[80, 80, 200],
	[60, 100, 100]
];

// Item cooldown statuses
items <- [
	[-2, -2, -2],
	[-2, -2, -2],
	[-2, -2, -2]
];

// Item description/guide
items_pickup <- [
	"Salamander:\n---------------\n[E] Fireball: Slow & burn zombies\n[Up E] Giga Flare (150s CD): Boost zombies up\n[Down E] Flash Over (70s CD): Cast a fire area to slow zombies\n[RC] Framberge (10 / 80s CD): Cast 10 lasers that deal massive damage",
	"Undine:\n---------------\n[E] Ice Crystals: Freeze zombies\n[Up E] Frozen Field (200s CD): Ultima\n[Down E] Freezing Wall (80s CD): Spawn large water wall\n[RC] Heal (80s CD): Heal your teammates",
	"Neikos:\n---------------\n[E] Gravity (100s CD): Pull humans to you\n[Down E] Fog (100s CD): Blocks human vision and slows them\n[RC] Heal (60s CD): Heal and speed up zombies near you"
];

// Display item description to the player that picks up the item
// (Salamander) OnPlayerPickup > cd_script > RunScriptCode > DisplayItemDescription(0);
// (Undine)     OnPlayerPickup > cd_script > RunScriptCode > DisplayItemDescription(1);
// (Neikos)     OnPlayerPickup > cd_script > RunScriptCode > DisplayItemDescription(2);
function DisplayItemDescription(index)
{
	// Unlock all item abilities on pickup
	for (local i = 0; i < 3; i++)
		items[index][i] = -1;

	// Display the item description to the item text entity
	local description_handle = Entities.FindByName(null, "item_text");
	description_handle.__KeyValueFromString("message", items_pickup[index]);
	EntFireByHandle(description_handle, "Display", "", 0.00, activator, null);
}

// Item usage functions
// Index is the item index, ability is the ability used index; See items_cd array for info
// To run this: <output> > cd_script > RunScriptCode > ItemUsed(<item index>, <ability index>) > 0
function ItemUsed(index, ability)
{
	items[index][ability] = items_cd[index][ability];
	local cmd = "ItemCDUpdate(" + index.tostring() + ", " + ability.tostring() + ")";
	EntFire("cd_script", "RunScriptCode", cmd, 1);
}

function ItemCDUpdate(index, ability)
{
	if (items[index][ability] >= 0)
	{
		items[index][ability] -= 1;
		local cmd = "ItemCDUpdate(" + index.tostring() + ", " + ability.tostring() + ")";
		EntFire("cd_script", "RunScriptCode", cmd, 1);
	}
}

// Update cd display function
// Call this at the start of each round via logic auto: logic_auto > OnMapSpawn > cd_script > RunScriptCode > UpdateDisplayItemText() > 0.00
function UpdateDisplayItemText()
{
	local salamander_text = "Salamander:\n";
	local undine_text = "Undine:\n";
	local neikos_text = "Neikos:\n";

	for (local i = 0; i < items_count; i++) // Loop through all items
	{
		for (local j = 0; j < 3; j++) // Loop through all ability for the item
		{
			if (items[i][j] > -2)
			{
				if (i == 0)
					salamander_text += "[" + (items[i][j] >= 0 ? items[i][j].tointeger() : "R") + "]: " + items_text[i][j] + "\n";
				if (i == 1)
					undine_text += "[" + (items[i][j] >= 0 ? items[i][j].tointeger() : "R") + "]: " + items_text[i][j] + "\n";
				if (i == 2)
					neikos_text += "[" + (items[i][j] >= 0 ? items[i][j].tointeger() : "R") + "]: " + items_text[i][j] + "\n";
			}
		}
	}

	if (show_item_cd) // If show item cd feature is enabled, set the text and then display it
	{
		EntFire("salamander_text", "SetText", salamander_text, 0);
		EntFire("undine_text", "SetText", undine_text, 0);
		EntFire("neikos_text", "SetText", neikos_text, 0);

		local iPlayer = null;
		while ((iPlayer = Entities.FindByClassname(iPlayer, "player")) != null)
		{
			if (iPlayer.GetTeam() == 3)
			{
				if (salamander_text != "Salamander:\n" && undine_text != "Undine:\n")
				{
					EntFire("salamander_text", "Display", "", 0.05, iPlayer);
					EntFire("undine_text", "Display", "", 0.05, iPlayer);
				}
				else if (salamander_text != "Salamander:\n")
					EntFire("salamander_text", "Display", "", 0.05, iPlayer);
				else if (undine_text != "Undine:\n")
					EntFire("undine_text", "Display", "", 0.05, iPlayer);
			}
			else if (iPlayer.GetTeam() == 2 && neikos_text != "Neikos:\n")
				EntFire("neikos_text", "Display", "", 0.05, iPlayer);
		}
	}
	EntFire("cd_script", "RunScriptCode", "UpdateDisplayItemText()", 0.1);
}