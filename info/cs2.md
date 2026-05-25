
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
4. [DarkerZ](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#darkerz)
    - [EntWatchSharp/MS-EntWatch](https://github.com/notkoen/ze-configs/blob/main/info/cs2.md#entwatch-2)

## CS2Fixes

### EntWatch

This version of EntWatch is publicly available [here](https://github.com/Source2ZE/CS2Fixes).

Find entity classnames that start with `weapon_` as a starting point for creating EntWatch configs. For each item you're going to want a new block in the root array. The format is available below. EntWatch also supports filtering triggering from restricted players without a weapon.

List of available colors:
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
      }                             //  (this will attempt to auto detect if not specified)
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
      "ent": "",                // (string) Targetname/Hammerid of entity
      "output": "",             // (string) Output of entity
      "delay": 0.0              // OPTIONAL - (float) Delay after output that starts boss
    },

    "showtrigger":              // OPTIONAL - Specifies event that starts displaying boss health
    {
      "ent": "",                // (string) Targetname/Hammerid of entity
      "output": "",             // (string) Output of entity
      "delay": 0.0              // OPTIONAL - (float) Delay after event that shows boss health
    },

    "killtrigger":              // OPTIONAL - Specifies event that force kills the boss
    {
      "ent": "",                // (string) Targetname/Hammerid of entity
      "output": "",             // (string) Output of entity
      "delay": 0.0              // OPTIONAL - (float) Delay after event that force kills boss
    },

    "hurttrigger":              // OPTIONAL - Specifies event that is considered as damaging the boss
    {
      "ent": "",                // (string) Targetname/hammerid of entity
      "output": ""              // (string) Output of entity
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

The AdminRoom feature is exclusive to GFL's version of CS2Fixes. All admin room coordindates are stored in one single [file](https://github.com/notkoen/ze-configs/blob/main/cs2-configs/cs2fixes/adminroom.jsonc). Coordinates are stored with map names as the key, and coordinates as an array.

## EXG

### EntWatch

```jsonc
[
  {
    "Name": "",                 // Name of item that appears in chat
    "ShortName": "",            // Name of item that appears in HUD
    "HammerId": "",             // Hammerid of the weapon entity
    "ButtonClass": "",          // Classname of handler: "func_button", "logic_relay"
    "ButtonHammerId": "",       // Hammerid or targetname of handler
    "ButtonInput": "",          // Outputname of handler
    "ShowHud": true,            // Whether to show this item on the HUD
    "Cooldown": 0,              // Cooldown duration in seconds
    "MaxUses": 0                // Maxuses in one round
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
  "MathCounterConfigs": [         // Math counter based bosses
    {
      "DisplayName": "",          // Name of boss that appears in hud
      "HpCounter": ""             // Targetname of counter
    },
    {
      "DisplayName": "",          // Name of boss that appears in hud
      "HpCounter": "",            // Targetname of main counter
      "HpBarCounter": "",         // Targetname of iterator counter
      "HpBarCounterAdd0": true,   // (unknown, leave it at default)
      "HpBarAdd": false,          // Whether iterator is reverse (OnHitMax output)
      "HpBarMin": 0,              // Iterator min value (leave empty defaults to min)
      "HpBarMax": 0               // Iterator max value (leave empty defaults to max)
    }
  ],
  "BreakableConfigs": [           // Breakable bosses
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

FyS has a public config [repository](https://github.com/fyscs/cs2) although not all configs are made public (e.g. EntWatch).

> [!WARNING]
> FyS config formatting requires indentation of two spaces.

### BossHUD

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

## DarkerZ

### EntWatch

This version of EntWatch is publicly available [here](https://github.com/darkerz7/MS-EntWatch) (ModSharp version) or [here](https://github.com/darkerz7/EntWatchSharp) (CounterStrikeSharp version). The same config can be used for both plugins.

Find entity classnames that start with `weapon_` as a starting point for creating EntWatch configs. For each item you're going to want a new block in the root array. The format is available below.

List of available colors:
- {default} - [255,255,255,1]
- {darkred} - [255,0,0,1]
- {purple} - [128,0,128,1]
- {green} - [0,255,0,1]
- {lightgreen} - [0,255,0,1]
- {lime} - [0,255,0,1]
- {red} - [255,0,0,1]
- {grey} - [128,128,128,1]
- {team}
- {red2} - [255,0,0,1]
- {olive} - [128,128,0,1]
- {a}
- {lightblue} - [0,255,255,1]
- {blue} - [0,255,255,1]
- {d}
- {pink} - [255,105,180,1]
- {darkorange} - [255,165,0,1]
- {orange} - [255,165,0,1]
- {darkblue} - [0,0,255,1]
- {gold} - [255,255,0,1]
- {white} - [255,255,255,1]
- {yellow} - [255,255,0,1]
- {magenta} - [255,105,180,1]
- {silver} - [128,128,128,1]
- {bluegrey} - [0,255,255,1]
- {lightred} - [255,0,0,1]
- {cyan} - [0,255,255,1]
- {gray} - [128,128,128,1]
- {lightyellow} - [255,255,0,1]

```jsonc
[
  {
    "Name": "",                     // String, Name of item that appears in chat
    "ShortName": "",                // String, Name of item that appears on the HUD
    "Color": "",                    // String, Color of the item for chat messages (see list of colors)
    "HammerID": "",                 // String, HammerID of the weapon entity
    "GlowColor": [0,0,0,0],         // Array[4], Color of the item for weapon glow
    "BlockPickup": false,           // Bool, Whether to allow this item to be picked up
    "AllowTransfer": false,         // Bool, Whether to allow this item to be transferred
    "ForceDrop": false,             // Bool, Whether to drop this item on player death/disconnect
    "Chat": false,                  // Bool, Whether to show pickup/drop messages in chat
    "Hud": false,                   // Bool, Whether to show this item on the HUD
    "TriggerID": "",                // String, HammerID of trigger associated with the item such as strip trigger
    "UsePriority": false,           // Bool, enabled by default. Whether to enable auto button press on +use detection
    "SpawnerID": "",                // String, HammerID of item template
    "AbilityList": [                // Array of abilities
      {
        "Name": "",                 // String, Custom ability name, can be omitted
        "ButtonID": "",             // String, HammerID of button or game_ui entity
        "ButtonClass": "",          // String, Button class
                                    // "func_button" - button activation
                                    // "game_ui::PressedAttack" - game_ui PressedAttack activation
                                    // "game_ui::PressedAttack2" - game_ui PressedAttack2 activation
        "Filter": "",               // String, Item activation filter
                                    // Targetname - filter_activator_name
                                    // $attribute - filter_activator_attribute_int
                                    // context:value - filter_activator_context
        "Chat_Uses": false,         // Bool, Whether to show item use messages if chat is disabled
        "Mode": 0,                  // Integer, Mode for item.
                                    //  0 = No button            1 = Spammable items,
                                    //  2 = Cooldown             3 = MaxUses (no cooldown)
                                    //  4 = MaxUses (cooldown)   5 = CooldownAfterUses
                                    //  6 = OnHitMin counter     7 = OnHitMax counter
                                    //  8 = ButtonHealth
        "MaxUses": 0,               // Integer, Maxuses if mode = 3,4,5
        "CoolDown": 0,              // Integer, Cooldown duration if mode = 2,4,5
        "Ignore": false,            // Bool, Whether to show item cooldown on HUD
        "LockItem": false,          // Bool, Whether to block item activation
        "MathID": "",               // String, Counter HammerID if mode = 6,7
        "MathNameFix": false,       // Bool, Whether to account for name fixup for counter
        "MathFindSpawned": false,   // Bool, Whether to look for counter after weapon spawn
                                    //  (For counters not in item template and item spawns later)
        "MathDontShowMax": false,   // Bool, Whether to show counter max value
        "MathZero": false           // Bool, Whether to allow button press when counter value is zero
      }
    ]
  }
]
```

<details>
    <summary>Clean Template</summary>

```jsonc
[
  {
    "Name": "",
    "ShortName": "",
    "Color": "",
    "HammerID": "",
    "GlowColor": [0,0,0,0],
    "BlockPickup": false,
    "AllowTransfer": false,
    "ForceDrop": false,
    "Chat": false,
    "Hud": false,
    "TriggerID": "",
    "UsePriority": false,
    "SpawnerID": "",
    "AbilityList": [
      {
        "Name": "",
        "ButtonID": "",
        "ButtonClass": "",
        "Filter": "",
        "Chat_Uses": false,
        "Mode": 0,
        "MaxUses": 0,
        "CoolDown": 0,
        "Ignore": false,
        "LockItem": false,
        "MathID": "",
        "MathNameFix": false,
        "MathFindSpawned": false,
        "MathDontShowMax": false,
        "MathZero": false
      }
    ]
  }
]
```
</details>

DarkerZ's version of EntWatch has additional commands that can be used to modify items midround. The `[hammerid]` parameter refers to the item HammerID. Parameters in `<>` are required, and parameters in `[]` are optional.

- `ew_setcooldown <int hammerid> <int buttonid> <int cooldown> [override]`: Sets cooldown duration of a button (`[override]` - whether to override cooldown if button is on cooldown)
- `ew_setmaxuses <int hammerid> <int buttonid> <int maxuses> [bool override]`: Sets max uses of a button (`[override]` - whether to override max uses if button was used)
- `ew_setuses <int hammerid> <int buttonid> <int value> [bool override]`: Sets current uses of a button (`[override]` - whether to override uses)
- `ew_addmaxuses <int hammerid> <int buttonid> [bool override]`: Adds uses to max use count of a button (`[override]` - whether to add max uses even if button use count reached max)
- `ew_setmode [int hammerid] [buttonid] [mode] [cooldown] [maxuses] <override>`: Change the mode of a button (`[override]` - whether to override button mode if already used)
- `ew_lockbutton <int hammerid> <int buttonid> <bool value>`: Lock/unlock a button
- `ew_setabilityname <int hammerid> <int buttonid> <string name>`: Sets the name of a button
- `ew_setname <int hammerid> <string name>`: Sets the name of an item that appears in chat
- `ew_setshortname <int hammerid> <string name>`: Sets the name of an item that appears on the HUD
- `ew_block <int hammerid> <bool value>`: Sets whether an item can be picked up or not
