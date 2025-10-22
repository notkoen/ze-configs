
# CSS Config Formatting

## DarkerZ Entwatch (Nide)

```text
"entities"
{
    // Keyvalue Explanation
    "0"
    {
        "name"              ""      // Item Name (Chat)
        "shortname"         ""      // Item Name (Hud)
        "color"             ""      // Item Color (Read below for list of available colors)
        "buttonclass"       ""      // game_ui or func_button (Leave blank if only cosmetic item)
        "filtername"        ""      // filter_activator_name given to player on pickup (Leave blank if vscript assigns filtername OR AddContext output)
        "blockpickup"       "false" // Block weapon pickup
        "allowtransfer"     "true"  // Allow weapon to be etransfered
        "forcedrop"         "true"  // Force weapon to drop if player dies/disconnects
        "chat"              "true"  // Does item show up in the chat
        "chat_uses"         "true"  // Does item uses show up in chat (bypasses mode 1/chat 0)
        "hud"               "true"  // Does item show up in the hud
        "hammerid"          ""      // Hammer ID of the weapon_* entity
        "mode"              ""      // Item mode (Read Below)
        "maxuses"           ""      // Max uses item has (0 for infinite)
        "cooldown"          ""      // Item cooldown
        "trigger"           ""      // Hammer ID of entity that strips weapons (trigger_once, if applicable)
        "buttonid"          ""      // Hammer ID of button/game_ui to be tracked for items with multiple buttons (if applicable)
        "energyid"          ""      // Hammer ID of math_counter that handles the ammo count of items (if applicable)
        "buttonclass2"      ""      // game_ui or func_button of second button/game_ui (if applicable)
        "mode2"             ""      // Mode of button 2 (if applicable)
        "maxuses2"          ""      // Maxuses of button 2 (if applicable)
        "cooldown2"         ""      // Cooldown of button 2 (if applicable)
        "buttonid2"         ""      // Hammer ID of button 2 (if applicable)
        "energyid2"         ""      // Hammer ID of math_counter for ammo count of button 2 (if applicable)
        "use_priority"      ""      // Toggle use_priority feature
        "pt_spawner"        ""      // point_template for spawning the item (if applicable)
    }
    // Full
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
    // No 2nd button/game_ui
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

### Mode Explanation

Mode | Description
--- | ---
0 | No Button
1 | Spammable items with little to no CD
2 | Items with unlimited uses and normal CD
3 | Items with limited uses and no CD
4 | Items with limited uses and normal CD
5 | Items with several uses before CD (lightning on cosmo)
6 | Items with limited ammo (OnHitMin outputs)
7 | Items with limited ammo (OnHitMax outputs)

### Extra Commands

- `sm_setcooldown [hammerid] [cooldown]`
- `sm_setmaxuses [hammerid] [uses]`
- `sm_addmaxuses [hammerid] [uses]`
- `sm_ewsetmode [hammerid] [mode] [cooldown] [maxuses] [used?]`
- `sm_ewsetname [hammerid] [name]`
- `sm_ewsetshortname [hammerid] [shortname]`
- `entwatch_blockepick [0/1]`
- `sm_setcooldown2 [hammerid] [cooldown2]`
- `sm_setmaxuses2 [hammerid] [uses2]`
- `sm_addmaxuses2 [hammerid] [uses2]`
- `sm_ewsetmode2 [hammerid] [mode2] [cooldown2] [maxuses2] [used?]`
- `sm_ewblock [0/1]`
- `sm_ewlockbutton [hammerid] [0/1]`
- `sm_ewlockbutton2 [hammerid] [0/1]`

## entWatch 4.0 (Unloze)

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

## entWatch 4.1 (Unreleased)

> [!WARNING]
> This version of entWatch is still under development. Thus, config options are not final.

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

## BossHP Config

```text
"bosses"
{
    "0"
    {
        "name"              ""
        "method"            "counter"
        "trigger"           ""

        "counter"           ""
    }
    "0"
    {
        "name"              ""
        "method"            "hpbar"
        "trigger"           ""

        "counter"           ""
        "backup"            ""
        "iterator"          ""
    }
    "0"
    {
        "name"              ""
        "method"            "breakable"
        "trigger"           ""

        "breakable"         ""
    }
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

## Admin Room Config

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
