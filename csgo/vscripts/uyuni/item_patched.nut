// Original script created by sweetS (https://steamcommunity.com/id/sweets125/) on ze_copy_escape_v2_3
// Modified by koen and lzyorha for uyuni cooldowns (with help from Luffaren)

// EndlessMode Decides which name/discription to display (Boolean: 0 = Not endless mode, 1 = Endless mode)
EndlessMode <- 0;

items_pickup <- [
    ["Ice\n\nDuration: 7s | CD: 60s\nFreeze zombies within an area",
    "Blizzard\n\nDuration: 10s | CD: 75s | Activation: 5s\nFreeze everything within a large area"],

    ["Warm Light (Fire)\n\nDuration: 6s | CD: 60s\nBurn zombies within an area",
    "Sun Light (Fire)\n\nDuration: 7s | CD: 75s | Activation: 5s\nSummon the sun to burn everything"],

    ["Gale Light (Wind)\n\nDuration: 7s | CD: 60s\nSpawn a wind vortex that pushes zombies away",
    "Anemoi (Wind)\n\nDuration: 7s | CD: 75s | Activation: 5s\nSpawn a larger wind vortex that pushes zombies away"],

    ["Holy Light (Heal)\n\nDuration: 7s | CD: 60s\nHeal to 200 HP",
    "Holy Light (Heal)\n\nDuration: 7s | CD: 60s\nHeal to 200 HP"]
];

// if Item cd -2, the item has not been picked up
// if Item cd -1, the item is ready to use.
// if item cd more than -1, the item is on cool down.
items <- [-2, -2, -2, -2];

//On item pickup, find a game_text entity, update it, and display it to the player add following to the item pistol:
function DisplayItemDescription(index)
{
    // On pickup, unlock the items
    items[index] = -1;

    // Display item text
    local gametext_handle = Entities.FindByName(null, "item_text");
    gametext_handle.__KeyValueFromString("message", items_pickup[index][EndlessMode]);

    if (index == 0)
    {
        gametext_handle.__KeyValueFromString("color", "0 255 255");
    }
    else if (index == 1)
    {
        gametext_handle.__KeyValueFromString("color", "237 73 18");
    }
    else if (index == 2)
    {
        gametext_handle.__KeyValueFromString("color", "128 255 0");
    }
    else if (index == 3)
    {
        gametext_handle.__KeyValueFromString("color", "255 255 0");
    }

    EntFireByHandle(gametext_handle, "Display", "", 0.01, activator, null);
}

// Enable entwatch system; Set to false if you want to disable
show_item_cd <- true

// How many items on the server
// 0: ice | blizzard
// 1: fire | sunlight
// 2: wind | anemoi
// 3: heal | heal
item_count <- 4

// Item name(s)
items_text <- [
    ["Ice", "Blizzard"],
    ["Fire", "Sunlight"],
    ["Wind", "Anemoi"],
    ["Heal", "Heal"]
]

//This will be changed when item pickedup and pressed the button, add following to the items button:
item_cd <- [
    [60,75],
    [60,75],
    [60,75],
    [60,60]
]

function ItemUsed(index)
{
    items[index] = item_cd[index][EndlessMode];
    local cmd = "ItemCDUpdate(" + index.tostring() + ")";
    EntFire("item_script", "RunScriptCode", cmd, 1);
}

function ItemCDUpdate(index)
{
    if (items[index] >= 0)
    {
        items[index] -= 1;
        local cmd = "ItemCDUpdate(" + index.tostring() + ")";
        EntFire("item_script", "RunScriptCode", cmd, 1);
    }
}


//Call the following function at begining on each round:
//logic_auto > OnMapSpawn > item_script > RunScriptCode > UpdateDisplayItemText() > 0.00

function UpdateDisplayItemText()
{
    local txt = "";
    for (local i = 0; i < item_count; i++)
    {
        if (items[i] > -2)
        {
            txt += items_text[i][EndlessMode] + "[" + (items[i] >= 0 ? items[i].tointeger() : "R") + "]" + "\n";
        }
    }

    if (show_item_cd)
    {
        EntFire("cd_text", "SetText", txt, 0);
        local iPlayer = null;
        while ((iPlayer = Entities.FindByClassname(iPlayer, "player")) != null)
        {
            if (iPlayer.GetTeam() == 3 && txt != "")
            {
                EntFire("cd_text", "Display", null, 0.05);
            }
        }
    }
    EntFire("item_script", "RunScriptCode", "UpdateDisplayItemText()", 0.1);
}