
## Entwatch (Nide)

```
"entities"
{
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
        "hud"               "true"
        "hammerid"          ""
        "mode"              ""
        "maxuses"           ""
        "cooldown"          ""
        "trigger"           ""
        "buttonid"          ""
        "energyid"          ""
        "buttonclass2"      ""
        "mode2"             ""
        "maxuses2"          ""
        "cooldown2"         ""
        "buttonid2"         ""
        "energyid2"         ""
        "pt_spawner"        ""
    }
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

## Entwatch (Unloze)

```
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

## BossHP Config

```
"bosses"
{
    "0"
    {
        "name"              ""
        "method"            "counter"
        "trigger"           ""
        "hurttrigger"       ""
        "counter"           ""
    }
    "0"
    {
        "name"              ""
        "method"            "hpbar"
        "trigger"           ""
        "hurttrigger"       ""
        "counter"           ""
        "iterator"          ""
        "backup"            ""
    }
    "0"
    {
        "name"              ""
        "method"            "breakable"
        "breakable"         ""
    }
    // OPTIONAL KEYVALUES
    ""
    {
        "timeout"           "" //
        "killtrigger"       "" // Name of trigger to kill boss
        "multitrigger"      "" // 1/0 - If the boss can spawn multiple times by point_template
        "namefixup"         "" // Entities that get unique name when spawned by point_template (mainly for NPCs)
        "showbeaten"        "" // (Nide only) 1/0 - Disable top boss damage display
    }
}
```