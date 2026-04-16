
# CS:GO Config Formatting

> [!WARNING]
> I am no longer maintaining CS:GO configs due to the release of CS2. All configs should be considered final.

> [!CAUTION]
> All vscripts should be uploaded in the exact same folder structure.

> [!WARNING]
> All entwatch configs are made to work with **DarkerZ's Entwatch-DZ Plugin**, and all BossHP configs are made to work with **GFL's BossHP Plugin** or **AntiTeal's BossHUD Plugin**.

## Darkerz Entwatch

Find entity classnames that start with `weapon_` as a starting point for creating entwatch configs. For each item you're going to create a separate block. The format is available below. This version of Entwatch supports blocking restricted players from touching triggers.

```text
"entities"
{
    "0"
    {
        "name"              ""          // Name of item that appears in chat
        "shortname"         ""          // Name of item that appears on the HUD
        "color"             ""          // Color of the item for chat messages
                                        // Available colors: {red}, {darkred}, {lightblue}, {blue}, {yellow},
                                        //                   {olive}, {green}, {lightgreen}, {lime}, {orange},
                                        //                   {darkorange}, {default}, {purple}, {pink}
        "buttonclass"       ""          // Item activation method: "game_ui" or "func_button" (leave blank if neither)
        "filtername"        ""          // Targetname given to player on pickup (Leave blank if vscript assigns filtername OR AddContext output)
        "blockpickup"       "false"     // Whether to block weapon pickup
        "allowtransfer"     "true"      // Whther to allow this item to be transferred
        "forcedrop"         "true"      // Whether to drop item if player dies or disconnects
        "chat"              "true"      // Whether to print item pickup in chat
        "chat_uses"         "true"      // Whether to print item uses in chat (bypasses both mode 1 and chat false)
        "hud"               "true"      // Whether to display item on the HUD
        "hammerid"          ""          // Hammer ID of the weapon entity
        "mode"              ""          // Item mode
                                        // 0 = No button            1 = Spammable items
                                        // 2 = Cooldown             3 = MaxUses (no cooldown)
                                        // 4 = MaxUses (cooldown)   5 = CooldownAfterUses
                                        // 6 = OnHitMin Counter     7 = OnHitMax Counter
        "maxuses"           ""          // Item max uses if mode 3/4/5
        "cooldown"          ""          // Item cooldown duration if mode 2/4/5
        "trigger"           ""          // Hammer ID of trigger to block restricted players
        "buttonid"          ""          // Hammer ID of button/game_ui to be tracked
        "energyid"          ""          // Hammer ID of math_counter to be tracked
        "buttonclass2"      ""          // Item activation method of second button/game_ui (leave blank if neither)
        "mode2"             ""          // Item mode of second activation
        "maxuses2"          ""          // Item max uses of second activation
        "cooldown2"         ""          // Item cooldown duration of second activation
        "buttonid2"         ""          // Hammer ID of second button/game_ui to be tracked
        "energyid2"         ""          // Hammer ID of second math_counter to be trackied
        "use_priority"      ""          // Whether to enable use_priority on item
        "pt_spawner"        ""          // Targetname of item point_template
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
{
    // Full config
    "0"
    {
        "name"              ""
        "shortname"         ""
        "color"             ""
        "buttonclass"       ""
        "buttonclass2"      ""
        "filtername"        ""
        "blockpickup"       "false"
        "allowtransfer"     "true"
        "forcedrop"         "true"
        "chat"              "true"
        "chat_uses"         "true"
        "hud"               "true"
        "hammerid"          ""
        "mode"              ""
        "maxuses"           ""
        "cooldown"          ""
        "buttonid"          ""
        "energyid"          ""
        "mode2"             ""
        "maxuses2"          ""
        "cooldown2"         ""
        "buttonid2"         ""
        "energyid2"         ""
        "trigger"           ""
        "use_priority"      ""
        "pt_spawner"        ""
    }
    // No second ability
    "0"
    {
        "name"              ""
        "shortname"         ""
        "color"             ""
        "buttonclass"       ""
        "filtername"        ""
        "blockpickup"       "false"
        "allowtransfer"     "true"
        "forcedrop"         "true"
        "chat"              "true"
        "chat_uses"         "true"
        "hud"               "true"
        "hammerid"          ""
        "mode"              ""
        "maxuses"           ""
        "cooldown"          ""
        "trigger"           ""
        "buttonid"          ""
        "energyid"          ""
        "pt_spawner"        ""
    }
}
```
</details>

DarkerZ's version of Entwatch has additional commands that can be used by an admin or via `point_servercommand` on a map to modify the values of an item ingame. The `[hammerid]` parameter of the command refers to the hammer ID of the item. Parameters in `[]` brackets are required, and parameters in `<>` brackets are optional.

- `sm_setcooldown [hammerid] [cooldown]`: Sets the cooldown of an item
- `sm_setmaxuses [hammerid] [uses]`: Sets the max uses of an item
- `sm_addmaxuses [hammerid] [uses]`: Adds uses to an item
- `sm_ewsetmode [hammerid] [mode] [cooldown] [maxuses] <used?>`: Modifies the mode of an item (`<used?>` parameter specifies whether to override item mode if already used)
- `sm_ewsetname [hammerid] [name]`: Sets the name of an item
- `sm_ewsetshortname [hammerid] [shortname]`: Sets the short name of an item
- `sm_setcooldown2 [hammerid] [cooldown2]`: Sets the cooldown of second ability of an item
- `sm_setmaxuses2 [hammerid] [uses2]`: Sets the max uses of second ability of an item
- `sm_addmaxuses2 [hammerid] [uses2]`: Adds uses to second ability
- `sm_ewsetmode2 [hammerid] [mode2] [cooldown2] [maxuses2] <used?>`: Modifies mode of second ability (`<used>` parameter specifies whether to override item mode if already used)
- `sm_ewblock [0/1]`: Blocks item pickups
- `sm_ewlockbutton [hammerid] [0/1]`: Toggles item activation
- `sm_ewlockbutton2 [hammerid] [0/1]`: Toggles secondary item activation

## BossHP

While BossHP plugins differ between NiDE.gg and Unloze, the config options are the same. Find entity classnames that are either `math_counter`, `func_breable`, `func_physbox`, or `func_physbox_multiplayer` as a starting point for creating BossHP configs. For each boss and NPC, you're going to want a new block. The format is available below. You can specified entities with either its targetname or its hammerid by starting the string with `#` (e.g. #123456). All bosses require a `"trigger"` to start detection.

```text
"math_counter"
{
    "config"
    {
        "HitMarkerOnly"             ""      // Whether to only display hitmarkers
        "BossBeatenShowTopDamage"   ""      // Whether to display top boss damage after death
        "MaxBreakableHP"            ""      // Maximum health of breakable to be considered a boss
        "MinBars"                   ""      // Minimum amount of HP bars to display in HUD
        "MaxBars"                   ""      // Maximum amount of HP bars to display in HUD
        "ForceBars"                 ""      // Whether to force display HP bars in HUD
    }
    "0" // HP Bar Type BOss
    {
        "HP_counter"        ""              // Targetname of health counter
        "HPinit_counter"    ""              // Targetname of backup counter
        "HPbar_counter"     ""              // Targetname of iterator counter
        "HPbar_max"         ""              // Maximum value of iterator
        "HPbar_min"         ""              // Minimum value of iterator
        "HPbar_default"     ""              // Starting value of iterator
        "HPbar_mode"        ""              // Health iterator mode (1 = OnHitMin, 2 = OnHitMax)
        "CustomText"        ""              // Name of boss to display in HUD
    }
    "0" // Counter Type Boss
    {
        "HP_counter"        ""              // Targetname of health counter
        "CustomText"        ""              // Name of boss to display in HUD
    }
    "1" // Breakable Type Boss
    {
        "Type"              "breakable"     // Type of boss (only "breakable")
        "BreakableName"     ""              // Targetname of breakable
        "CustomText"        ""              // Name of boss to display in HUD
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
"math_counter"
{
    "config"
    {
        "HitMarkerOnly"             ""
        "BossBeatenShowTopDamage"   ""
        "MaxBreakableHP"            ""
        "MinBars"                   ""
        "MaxBars"                   ""
        "ForceBars"                 ""
    }
    "0"
    {
        "HP_counter"        ""
        "HPinit_counter"    ""
        "HPbar_counter"     ""
        "HPbar_max"         ""
        "HPbar_min"         ""
        "HPbar_default"     ""
        "HPbar_mode"        ""
        "CustomText"        ""
    }
    "0"
    {
        "HP_counter"        ""
        "CustomText"        ""
    }
    "1"
    {
        "Type"              "breakable"
        "BreakableName"     ""
        "CustomText"        ""
    }
}
```
</details>
