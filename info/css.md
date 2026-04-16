
# CSS Config Formatting

> [!TIP]
> More configs are available under Nide's [ZE-Configs](https://github.com/NiDE-gg/ZE-Configs) repository.

> [!WARNING]
> Entwatch configs differ between NiDE and Unloze.

> [!WARNING]
> All configs made **MUST BE** lowercase.

## DarkerZ Entwatch

This version of EntWatch is currently in use on NiDE.gg and is available [here](https://github.com/srcdslab/sm-plugin-EntWatch).

Find entity classnames that start with `weapon_` as a starting point for creating entwatch configs. For each item you're going to create a separate block. The format is available below. This version of Entwatch supports blocking restricted players from touching triggers.

```text
"entities"
{
    "0"
    {
        "name"              ""          // Name of item that appears in chat
        "shortname"         ""          // Name of item that appears on the HUD
        "color"             ""          // Color of the item for chat messages (based on multicolors)
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

## entWatch 4.0 (Unloze)

This version of EntWatch is currently in use on Unloze.

Find entity classnames that start with `weapon_` as a starting point for creating entwatch configs. For each item you're going to create a separate block. The format is available below.

```text
"items"
{
    "0"
    {
        "name"          ""      // The "full" name of the item. (Used in CHAT)
        "short"         ""      // The "short" name of the item. (Used on the HUD)
        "color"         ""      // The HEX color code of the item.
        "filter"        ""      // The targetname maps use for filtering. (Leave empty if none)
        "weaponid"      "0"     // The HammerID of the weapon.
        "buttonid"      "0"     // The HammerID of the button.
        "triggerid"     "0"     // The HammerID of the trigger.
        "display"       "0"     // The Bitflag for displays.
                                // 1 = CHAT.
                                // 2 = USE.
                                // 3 = CHAT & USE.
                                // 4 = HUD.
                                // 5 = CHAT & HUD.
                                // 6 = USE & HUD.
                                // 7 = ALL.
        "slot"          "0"     // The weapon slot.
                                // 0 = None
                                // 1 = Primary
                                // 2 = Secondary
                                // 3 = Knife
                                // 4 = Grenades
        "mode"          "0"     // The mode of the item.
                                // 1 = Cooldown.
                                // 2 = Limited uses.
                                // 3 = Limited uses with cooldown.
                                // 4 = Cooldown after multiple uses.
        "maxuses"       "0"     // The maximum amount of uses.
        "cooldown"      "0"     // The cooldown between uses.
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
{
    "0"
    {
        "name"          ""
        "short"         ""
        "color"         ""
        "filter"        ""
        "weaponid"      "0"
        "buttonid"      "0"
        "triggerid"     "0"
        "display"       "0"
        "slot"          "0"
        "mode"          "0"
        "maxuses"       "0"
        "cooldown"      "0"
    }
}
```
</details>

## entWatch 4.1

This version of entWatch is in a Work-In-Progress state so config options may be subject to change. The code is available [here](https://github.com/notkoen/entwatch).

Find entity classnames that start with `weapon_` as a starting point for creating entwatch configs. For each item you're going to create a separate block. The format is available below. Item cooldowns and activation can be based on button press, entity outputs, or counter values.

```text
"items"
{
    "configversion"         "1"         // Int: Current version of configuration format. (Used for compatability check)

    "0"
    {
        "name"              ""          // String: The 'full' name of the item. (Used in the chat messages)
        "short"             ""          // String: The 'short' name of the item. (Used in the interface)
        "color"             "FFFFFF"    // String: The HEX color code for the item. (Without #)
        "hammerid"          ""          // Int: The HammerID of the weapon.
        "showmessages"      "1"         // Bool: Should messages be displayed for this item?
        "showinterface"     "1"         // Bool: Should this item show up on the interface?

        "buttons"
        {
            "0"
            {
                "name"              ""          // String: The name of the button/ability to display in chat
                "output"            ""          // String: The output to hook for activation. (Only used on type 2)
                "hammerid"          ""          // Int: The HammerID of the button/entity/counter used for activation.
                "type"              "1"         // Int: The type of button:
                                                        1 = +use activation
                                                        2 = output activation
                                                        3 = counter up
                                                        4 = counter down
                "mode"              "0"         // Int: The mode of activation.
                                                        1 = cooldown
                                                        2 = limited uses
                                                        3 = cooldown after multiple uses
                                                        4 = counter value
                "maxuses"           "0"         // Int: The maximum amount of uses.
                "cooldown"          "0"         // Float: The cooldown between uses.
                "itemcooldown"      "0"         // Float: The duration the item should not be able to get activated after use.
                "showactivate"      "1"         // Bool: Should messages be displayed for this activation?
                "showcooldown"      "1"         // Bool: Should the cooldown of this activation show in the interface?
            }
        }

        "triggers"
        {
            "0"
            {
                "hammerid"          "0"         // Int: The HammerID of the trigger.
                "type"              "1"         // Int: The type of trigger. (1 = strip trigger)
            }
        }
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
"items"
{
    "configversion"         "1"

    "0"
    {
        "name"              ""
        "short"             ""
        "color"             "FFFFFF"
        "hammerid"          ""
        "showmessages"      "1"
        "showinterface"     "1"

        "buttons"
        {
            "0"
            {
                "name"              ""
                "output"            ""
                "hammerid"          ""
                "type"              "1"
                "mode"              "0"
                "maxuses"           "0"
                "cooldown"          "0"
                "itemcooldown"      "0"
                "showactivate"      "1"
                "showcooldown"      "1"
            }
        }

        "triggers"
        {
            "0"
            {
                "hammerid"          ""
                "type"              "1"
            }
        }
    }

    // Human item
    "0"
    {
        "name"              ""
        "short"             ""
        "color"             "FFFFFF"
        "hammerid"          ""
        "showmessages"      "1"
        "showinterface"     "1"

        "buttons"
        {
            "0"
            {
                "hammerid"          ""
                "type"              "1"
                "mode"              "0"
                "maxuses"           "0"
                "cooldown"          "0"
                "itemcooldown"      "0"
                "showactivate"      "1"
                "showcooldown"      "1"
            }
        }
    }

    // Zombie item
    "0"
    {
        "name"              ""
        "short"             ""
        "color"             "FFFFFF"
        "hammerid"          ""
        "showmessages"      "1"
        "showinterface"     "1"

        "buttons"
        {
            "0"
            {
                "hammerid"          ""
                "type"              "1"
                "mode"              "0"
                "maxuses"           "0"
                "cooldown"          "0"
                "itemcooldown"      "0"
                "showactivate"      "1"
                "showcooldown"      "1"
            }
        }

        "triggers"
        {
            "0"
            {
                "hammerid"          ""
                "type"              "1"
            }
        }
    }
}
```
</details>

## BossHP Config

While BossHP plugins differ between NiDE.gg and Unloze, the config options are the same. Find entity classnames that are either `math_counter`, `func_breable`, `func_physbox`, or `func_physbox_multiplayer` as a starting point for creating BossHP configs. For each boss and NPC, you're going to want a new block. The format is available below. You can specified entities with either its targetname or its hammerid by starting the string with `#` (e.g. #123456). All bosses require a `"trigger"` to start detection.

```text
"bosses"
{
    "0"
    {
        "name"              ""      // Name of boss that appears in HUD
        "method"            ""      // Type of boss: "counter", "hpbar", or "breakable"
        "counter"           ""      // HP counter entity if counter/hpbar method
        "backup"            ""      // HP backup entity if hpbar method
        "iterator"          ""      // HP iterator entity if hpbar method
        "breakable"         ""      // Boss entity if breakable method
        "timeout"           ""      // Time before boss health is hidden
        "trigger"           ""      // Output that starts the boss ("entity:output:delay")
        "killtrigger"       ""      // Output that kills the boss ("entity:output")
        "hurttrigger"       ""      // Output that counts as damaging boss ("entity:output")
        "showtrigger"       ""      // Output that starts displaying the boss ("entity:output:delay")
        "multitrigger"      "0"     // Whether boss can be triggered multiple times from "trigger"
        "namefixup"         "0"     // Whether boss has namefixup if spawned from a template
        "showbeaten"        "1"     // Whether top boss damage is displayed upon boss death (Nide only)
        "showhealth"        "1"     // Whether boss health is displayed when hit (Nide only)
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
"bosses"
{
    // Counter type boss
    "0"
    {
        "name"              ""
        "method"            "counter"
        "trigger"           ""

        "counter"           ""
    }
    // HP bar type boss (counter/backup/iterator)
    "0"
    {
        "name"              ""
        "method"            "hpbar"
        "trigger"           ""

        "counter"           ""
        "backup"            ""
        "iterator"          ""
    }
    // Breakable type boss
    "0"
    {
        "name"              ""
        "method"            "breakable"
        "trigger"           ""

        "breakable"         ""
    }
    // NPC type boss
    "0"
    {
        "name"              ""
        "method"            "breakable"
        "trigger"           ""
        "showtrigger"       ""
        "namefixup"         "1"
        "multitrigger"      "1"
        "timeout"           "3"
        "showbeaten"        "0"

        "breakable"         ""
    }
    // OPTIONAL KEYVALUES
    ""
    {
        "timeout"           "" // Float: Time before hiding the health of the boss
        "killtrigger"       "" // String: Specify event that kills the boss ("entity:output")
        "hurttrigger"       "" // String: Specify event that counts as hitting boss ("entity:output")
        "multitrigger"      "" // Int: Whether boss can be triggered multiple times from "trigger" (1 = True, 0 = False)
        "namefixup"         "" // Int: Whether boss has namefixup if spawned from a template (1 = True, 0 = False)
        "showbeaten"        "" // Int: Whether top boss damage is displayed upon boss death (1 = True, 0 = False)
    }
}
```
</details>

## Admin Room Config

For each stage you're going to create a new block under the `"stages"` block. You can specify entities under `"actions"` using either its targetname or its hammerid by starting the string with `#` (e.g. #123456). All stages can have multiple triggers.

```text
"AdminRoom"
{
    "adminrooms"
    {
        "0"
        {
            "name"      "Admin Room"    // Name of admin room
            "origin"    ""              // Coordinates to teleport player to
        }
    }
    "stages"
    {
        "0"
        {
            "name"      ""              // Name of the stage
            "triggers"
            {
                "0"     ""              // Triggers used to set stage for !stage command
            }
            "actions"
            {
                "0"     ""              // Entity output when triggering stage ("entity:input")
            }
        }
    }
}
```

<details>
    <summary>Clean Template</summary>

```text
"AdminRoom"
{
    "adminrooms"
    {
        "0"
        {
            "name"      "Admin Room"
            "origin"    ""
        }
    }
    "stages"
    {
        "0"
        {
            "name"      ""
            "triggers"
            {
                "0"     ""
            }
            "actions"
            {
                "0"     ""
            }
        }
    }
}
```
</details>
