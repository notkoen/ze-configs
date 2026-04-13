
# CS2 Config Formatting

> [!CAUTION]
> Config options vary from server to server due to different plugins. I will separate configs for each server and include information on differences. Do keep this in mind when you want to look at configs I have made.

**Table of Contents:**
1. [CS2Fixes](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#cs2fixes)
    - [EntWatch](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#entwatch)
    - [BossHUD](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#bosshud)
    - [AdminRoom](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#adminroom)
2. [ExG](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#exg)
    - [EntWatch](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#entwatch-1)
    - [BossHUD](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#bosshud-1)
3. [FyS](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#fys)
    - [BossHUD](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#bosshud-2)

## CS2Fixes

### EntWatch

This version of EntWatch is publicly available [here](https://github.com/Source2ZE/CS2Fixes).

Find entity classnames that start with `weapon_` as a starting point for creating EntWatch configs. For each item you're going to want a new block in the root array. The format is available below. EntWatch also supports filtering triggering from restricted players without a weapon.

List of Available Colors:
- white, default
- darkred
- team
- green
- lightgreen
- olive
- red
- gray, grey
- yellow
- silver
- blue
- darkblue
- purple, pink
- red2
- orange, gold

```jsonc
[
    {
        "name": "Item Name",            // Name of item that appears in chat
        "shortname": "Short Name",      // Name of item that appears on the HUD
        "hammerid": "",                 // Hammerid of the weapon entity
        "message": true,                // Whether to show pickup/drop messages in chat
        "ui": true,                     // Whether to show this item on the HUD
        "transfer": true,               // Whether to allow this item to be transferred (this auto detects false for knife items)
        "color": "",                    // Color of the item for chat messages (see list of colors)
        "triggers": [""],               // Array of hammerids of any triggers that this item is associated with
        "templated": true,              // Whether the entity of this handler is templated with the item weapon, (auto detected if not specified)
        "handlers": [
            {
                "name": "Handler",          // extra name to show in chat when used e.g. XXX has used Item Name (Handler)
                "type": "button",           // "button",
                                            // "counterdown" - counter stops OnHitMin
                                            // "counterup" - counter stops OnHitMax
                                            // (anything else is ignored)
                "hammerid": "",             // hammerid of the entity
                "event": "OnPressed",       // Name of the output, counterup/down types always force "OutValue"
                "mode": 2,                  // Mode of the handler
                                            //  0/1 = None
                                            //  2 = Cooldown,           3 = MaxUses (cooldown between each)
                                            //  4 = CooldownAfterUses,  5 = CounterValue
                "offset": [0,0],            // ADDS the specified offset to counter values,
                                            // First number is counter value, Second is counter max
                "cooldown": 0,              // Cooldown duration if mode = 2,3,4
                "maxuses": 0,               // Maxuses if mode = 3,4
                "message": true,            // Whether to show when this is used in chat
                "ui": true,                 // Whether to track this handler on the HUD
                "templated": true           // Whether the entity of this handler is templated with the item weapon,
            }                               //  (this will attempt to auto detect if not specified)
        ]
    }
]
```

<details>
    <summary>Clean Template</summary>

```jsonc
[
    // Full Config
    {
        "name": "",
        "shortname": "",
        "hammerid": "",
        "message": true,
        "ui": true,
        "transfer": true,
        "color": "",
        "triggers": [""],
        "templated": true,
        "handlers": [
            {
                "name": "Handler",
                "type": "button",
                "hammerid": "",
                "event": "OnPressed",
                "mode": 0,
                "cooldown": 0,
                "maxuses": 0,
                "offset": [0,0],
                "message": true,
                "ui": true,
                "templated": true
            }
        ]
    },
    // Regular button
    {
        "name": "",
        "shortname": "",
        "hammerid": "",
        "message": true,
        "ui": true,
        "transfer": true,
        "color": "",
        "triggers": [""],
        "handlers": [
            {
                "type": "button",
                "hammerid": "",
                "event": "OnPressed",
                "mode": 0,
                "cooldown": 0,
                "maxuses": 0,
                "message": true,
                "ui": true
            }
        ]
    },
    // Button and filter separate (most reliable)
    {
        "name": "",
        "shortname": "",
        "hammerid": "",
        "message": true,
        "ui": true,
        "transfer": true,
        "color": "",
        "triggers": [""],
        "handlers": [
            {
                "type": "button",
                "hammerid": ""
            },
            {
                "hammerid": "",
                "event": "OnPass",
                "mode": 0,
                "cooldown": 0,
                "maxuses": 0,
                "message": true,
                "ui": true
            }
        ]
    },
]
```
</details>

### BossHUD

> [!CAUTION]
> CS2Fixes BossHUD is still in active development and thus not yet released publicly, so config formatting **SHOULD NOT** be considered final.

Find entity classnames that are either `math_counter`, `func_breakable`, or `func_physbox` as a starting point for creating BossHUD configs. For each boss and NPC, you're going to want a new block in the root array. The format is available below. You can specify entities with either its targetname or its hammerid by starting the string with `#` (e.g. "#123456").

```jsonc
[
    {
        "name": "",                 // OPTIONAL - (string) Name of boss that appears in hud
        "breakable": "",            // Targetname/Hammerid of breakable
        "counter": "",              // Targetname/Hammerid of counter
        "iterator": "",             // OPTIONAL - Targetname/Hammerid of hp iterator (segments)
        "backup": "",               // OPTIONAL - Targetname/Hammerid of hp backup

        "trigger":                  // OPTIONAL - Specifies the event that triggers the boss
        {
            "ent": "",              // (string) Targetname/Hammerid of entity
            "output": "",           // (string) Output of entity
            "delay": 0.0            // OPTIONAL - (float) Delay after output that starts boss
        },

        "showtrigger":              // OPTIONAL - Specifies event that starts displaying boss health
        {
            "ent": "",              // (string) Targetname/Hammerid of entity
            "output": "",           // (string) Output of entity
            "delay": 0.0            // OPTIONAL - (float) Delay after event that shows boss health
        },

        "killtrigger":              // OPTIONAL - Specifies event that force kills the boss
        {
            "ent": "",              // (string) Targetname/Hammerid of entity
            "output": "",           // (string) Output of entity
            "delay": 0.0            // OPTIONAL - (float) Delay after event that force kills boss
        },

        "hurttrigger":              // OPTIONAL - Specifies event that is considered as damaging the boss
        {
            "ent": "",              // (string) Targetname/hammerid of entity
            "output": ""            // (string) Output of entity
        },

        "reversecounter": false,    // OPTIONAL - (bool) Whether counter should be reversed
        "reverseiterator": false,   // OPTIONAL - (bool) Whether iterator should be reversed
        "hitmarkeronly": false,     // OPTIONAL - (bool) Whether only hitmarkers should be shown when hitting boss
        "minorhud": false,          // OPTIONAL - (bool) Whether boss should should be displayed as no-bar hud variant
        "multitrigger": false,      // OPTIONAL - (bool) Whether boss can be triggered multiple times (multiple instances)
        "templated": false,         // OPTIONAL - (bool) Whether boss is templated and has name fixup
        "showbeaten": true,         // OPTIONAL - (bool) Whether top boss damage should be displayed after boss death
        "timeout": 0.0,             // OPTIONAL - (float) Specify time before boss health is hidden after taking no damage
        "offset": 0.0,              // OPTIONAL - (float) Specify amount of health to ADD to displayed health (negative to subtract)
        "offsetiterator": 0.0,      // OPTIONAL - (float) Specify amount of iterator segments to ADD to displayed health (negative to subtract)
        "maxhp": 0.0                // OPTIONAL - (float) If the boss has more than this HP, it will not start showing on the HUD (0.0 = no limit)
    },

    // Breakable type boss
    {
        "name": "",
        "breakable": ""
    },

    // Counter type boss
    {
        "name": "",
        "counter": ""
    },

    // Counter, backup, and iterator type boss
    {
        "name": "",
        "counter": "",
        "backup": "",
        "iterator": ""
    },

    // Counter and iterator type boss
    {
        "name": "",
        "counter": "",
        "iterator": ""
    },

    // Breakable and iterator type boss
    {
        "name": "",
        "breakable": "",
        "iterator": ""
    }
]
```

<details>
    <summary>Clean Template</summary>

```jsonc
[
    // Full config
    {
        "name": "",
        "breakable": "",
        "counter": "",
        "iterator": "",
        "backup": "",
        "trigger": { "ent": "", "output": "", "delay": 0.0 },
        "showtrigger": { "ent": "", "output": "", "delay": 0.0 },
        "killtrigger": { "ent": "", "output": "", "delay": 0.0 },
        "hurttrigger": { "ent": "", "output": "" },
        "reversecounter": false,
        "reverseiterator": false,
        "hitmarkeronly": false,
        "minorhud": false,
        "multitrigger": false,
        "templated": false,
        "showbeaten": true,
        "timeout": 0.0,
        "offset": 0.0,
        "offsetiterator": 0.0,
        "maxhp": 0.0
    },

    // Breakable type boss
    {
        "name": "",
        "breakable": ""
    },

    // Counter type boss
    {
        "name": "",
        "counter": ""
    },

    // Counter, backup, and iterator type boss
    {
        "name": "",
        "counter": "",
        "backup": "",
        "iterator": ""
    },

    // Counter and iterator type boss
    {
        "name": "",
        "counter": "",
        "iterator": ""
    },

    // Breakable and iterator type boss
    {
        "name": "",
        "breakable": "",
        "iterator": ""
    }
]
```
</details>

### AdminRoom

The AdminRoom feature is exclusive to GFL's version of CS2Fixes. All admin room coordindates are stored in one single [file](https://github.com/notkoen/ze-configs/blob/main/cs2-configs/adminroom.jsonc). Coordinates are stored with map names as the key, and coordinates as an array.

## EXG

### EntWatch

```jsonc
[
    {
        "Name": "",                     // Name of item that appears in chat
        "ShortName": "",                // Name of item that appears in HUD
        "HammerId": "",                 // Hammerid of the weapon entity
        "ButtonClass": "",              // Classname of handler: "func_button", "logic_relay"
        "ButtonHammerId": "",           // Hammerid or targetname of handler
        "ButtonInput": "",              // Outputname of handler
        "ShowHud": true,                // Whether to show this item on the HUD
        "Cooldown": 0,                  // Cooldown duration in seconds
        "MaxUses": 0                    // Maxuses in one round
    },
]
```

<details>
    <summary>Clean Template</summary>

```jsonc
[
    {
        "Name": "",
        "ShortName": "",
        "HammerId": "",
        "ButtonClass": "",
        "ButtonHammerId": "",
        "ButtonInput": "",
        "ShowHud": true,
        "Cooldown": 0,
        "MaxUses": 0
    },
]
```
</details>

### BossHUD

```jsonc
{
    "MathCounterConfigs": [             // Math counter based bosses
        {
            "DisplayName": "",          // Name of boss that appears in hud
            "HpCounter": ""             // Targetname of counter
        },
        {
            "DisplayName": "",          // Name of boss that appears in hud
            "HpCounter": "",            // Targetname of main counter
            "HpBarCounter": "",         // Targetname of iterator counter
            "HpBarCounterAdd0": true,   // (unknown, leave it at default)
            "HpBarAdd": true,           // Whether iterator is reverse (OnHitMax output)
            "HpBarMin": 0,              // Iterator min value (leave empty defaults to min)
            "HpBarMax": 0               // Iterator max value (leave empty defaults to max)
        }
    ],
    "BreakableConfigs": [               // Breakable bosses
        {
            "DisplayName": "",          // Name of boss that appears in hud
            "EntityName": ""            // Targetname of breakable
        }
    ]
}
```

<details>
    <summary>Clean Template</summary>

```jsonc
{
    "MathCounterConfigs": [
        {
            "DisplayName": "",
            "HpCounter": ""
        },
        {
            "DisplayName": "",
            "HpCounter": "",
            "HpBarCounter": "",
            "HpBarCounterAdd0": true,
            "HpBarAdd": true,
            "HpBarMin": 0,
            "HpBarMax": 0
        }
    ],
    "BreakableConfigs": [
        {
            "DisplayName": "",
            "EntityName": ""
        }
    ]
}
```
</details>

## FyS

> [!TIP]
> FyS has a public config [repository](https://github.com/fyscs/cs2) although not all configs are made public (e.g. EntWatch).

### BossHUD

> [!WARNING]
> FyS config formatting requires indentation of two spaces.

```jsonc
{
  "Proxy": true,            // (bool) Whether boss health is scripted
  "Counters": [
    {
      "iterator": "",       // (string) Targetname of boss COUNTER
      "backup": "",         // (string) Targetname of boss BACKUP counter
      "counter": "",        // (string) Targetname of boss ITERATOR
      "stages": 0.0,        // (int) Number of times boss is re-triggered (similar to multitrigger)
      "mass": 0.0,          // (int) Health per player for counter and iterator system
      "hitbox": "",         // (string) Targetname of boss hitbox
      "display": "",        // (string) Name of boss that appears on hud
      "increase": false,    // (bool) If boss COUNTER has OnHitMax outputs
      "reverse": false,     // (bool) If boss ITERATOR has OnHitMax outputs
    }
  ],
  "Breakables": [
    {
      "target": "",         // (string) Targetname of boss breakable
      "count": "",          // (string) Targetname of boss iterator counter
      "display": ""         // (string) Name of boss that appear on hud
    }
  ],
  "Monsters": [
    {
      "identity": "",       // (string) Hammerid of counter or breakable
      "display": ""         // (string) Name of boss that appears on hud
    }
  ]
}
```

<details>
    <summary>Clean Template</summary>

```jsonc
{
  "Proxy": true,
  "Counters": [
    // Full config
    {
      "iterator": "",
      "backup": "",
      "counter": "",
      "stages": 0.0,
      "mass": 0.0,
      "hitbox": "",
      "display": "",
      "increase": false,
      "reverse": false,
    },
    // Counter type boss
    {
      "iterator": "",
      "hitbox": "",
      "display": "",
    },
    // Counter, iterator, and backup type boss
    {
      "iterator": "",
      "backup": "",
      "counter": "",
      "hitbox": "",
      "display": "",
    },
    // Counter and iterator type boss
    {
      "iterator": "",
      "counter": "",
      "mass": 0.0,
      "hitbox": "",
      "display": "",
    }
  ],
  "Breakables": [
    {
      "target": "",
      "count": "",
      "display": ""
    }
  ],
  "Monsters": [
    {
      "identity": "",
      "display": ""
    }
  ]
}
```
</details>