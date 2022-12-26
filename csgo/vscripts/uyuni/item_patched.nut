// Original script created by sweetS (https://steamcommunity.com/id/sweets125/) on ze_copy_escape_v2_3
// Modified by koen and lzyorha for uyuni cooldowns (with help from Luffaren)

// EndlessMode Decides which name/discription to display (Boolean: 0 = Not endless mode, 1 = Endless mode)
// level_case will set this global variable to 1/0 depand on what case it is on right now add following:
// OnCase03 > item_script > RunScriptCode > EndlessMode=1; > 0.00
EndlessMode <- 0;

items_pickup <- [
    ["Cool Light (Ice)\n\nDuration: 7s | Cooldown: 60s\nFreeze zombies within an area",
    "Blizzard (Ice)\n\nDuration: 10s | Cooldown: 75s | Activation: 5s\nFreeze everything within a large area"],

    ["Warm Light (Fire)\n\nDuration: 6s | Cooldown: 60s\nSlows and burn zombies within an area",
    "Sun Light (Fire)\n\nDuration: 7s | Cooldown: 75s | Activation: 5s\nSummon the sun to burn everything"],

    ["Gale Light (Wind)\n\nDuration: 7s | Cooldown: 60s\nSpawn a wind vortex that pushes zombies away",
    "Anemoi (Wind)\n\nDuration: 7s | Cooldown: 75s | Activation: 5s\nSpawn a larger wind vortex that pushes zombies away "],

    ["Holy Light (Heal)\n\nDuration: 7s | Cooldown: 60s\nMax Health 200 (Static)",
    "Holy Light (Heal)\n\nDuration: 7s | Cooldown: 60s\nMax Health 200 (Static)"]
];

// if Item cd -2, the item is didn't picked up.
// if Item cd -1, the item is ready to use.
// if item cd upper than -1, the item is cool down.
items <- [-2, -2, -2, -2];

//On item pickup, find a game_text entity, update it, and display it to the player add following to the item pistol:
//(Ice pistol)	OnPlayerPickup > item_script > RunScriptCode > DisplayItemDescription(0); > 0.00
//(Fire pistol)	OnPlayerPickup > item_script > RunScriptCode > DisplayItemDescription(1); > 0.00
//(Wind pistol)	OnPlayerPickup > item_script > RunScriptCode > DisplayItemDescription(2); > 0.00
//(Heal pistol)	OnPlayerPickup > item_script > RunScriptCode > DisplayItemDescription(3); > 0.00
function DisplayItemDescription(index)
{
    // On pickup, unlock the items
    items[index] = -1;
    local gametext_handle = Entities.FindByName(null, "item_text");
    gametext_handle.__KeyValueFromString("message", items_pickup[index][EndlessMode]);
    EntFireByHandle(gametext_handle, "Display", "", 0.00, activator, null);
}

// Enable entwatch system; Set to false if you want to disable
show_item_cd <- true

// How many items on the server
// 0: ice	|	blizzard
// 1: fire	|	sunlight
// 2: wind	|	anemoi
// 3: heal	|	heal
item_count <- 4

// Item name(s)
items_text <- [
    ["Ice", "Blizzard"],
    ["Fire", "Sunlight"],
    ["Wind", "Anemoi"],
    ["Heal", "Heal"]
]

//This will be changed when item pickedup and pressed the button, add following to the items button:
// (Ice button) 		OnTrigger > item_script > RunScriptCode > ItemUsed(0); > 0.00
// (Blizzard button) 	OnTrigger > item_script > RunScriptCode > ItemUsed(0); > 0.00
// (Fire button) 		OnTrigger > item_script > RunScriptCode > ItemUsed(1); > 0.00
// (Sunlight button) 	OnTrigger > item_script > RunScriptCode > ItemUsed(1); > 0.00
// (Wind button) 		OnTrigger > item_script > RunScriptCode > ItemUsed(2); > 0.00
// (Anemoi button) 		OnTrigger > item_script > RunScriptCode > ItemUsed(2); > 0.00
// (Heal button) 		OnTrigger > item_script > RunScriptCode > ItemUsed(3); > 0.00
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
    if (items[index] >= 0) {
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
    for (local i = 0; i < item_count; i++) {
        if (items[i] > -2) {
            txt += "[" + (items[i] >= 0 ? items[i].tointeger() : "R") + "] " + items_text[i][EndlessMode] + "\n";
        }
    }
    if (show_item_cd) {
        EntFire("cd_text", "SetText", txt, 0);
        if (txt != "") EntFire("cd_text", "Display", null, 0.05);
    }
    EntFire("item_script", "RunScriptCode", "UpdateDisplayItemText()", 0.1);
}