
## Darkerz Entwatch

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

### Available Colors

- {red}
- {darkred}
- {lightblue}
- {blue}
- {yellow}
- {olive}
- {green}
- {lightgreen}
- {lime}
- {orange}
- {darkorange}
- {default}
- {purple}
- {pink}

### Extra Commands for Entwatch

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

## BossHP

```
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
