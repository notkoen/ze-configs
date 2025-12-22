
# CS2 Config Formatting

## CS2Fixes Entwatch

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
                "offset": [5,-9],           // ADDS the specified offset to counter values, 
                                            // First number is counter value, Second is counter max
                "cooldown": 60,             // Cooldown duration if mode = 2,3,4
                "maxuses": 0,               // Maxuses if mode = 3,4
                "message": true,            // Whether to show when this is used in chat
                "ui": true,                 // Whether to track this handler on the HUD
                "templated": true           // Whether the entity of this handler is templated with the item weapon, 
            }                               //  (this will attempt to auto detect if not specified)
        ]
    }
]```

### Clean Template

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

### Available Colors

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

## CS2Fixes BossHUD (Unreleased)

Find entity classnames that are either `math_counter`, `func_breakable`, or `func_physbox` as a starting point for creating these. For each boss and NPC, you're going to want a new block in the root array. The format is available below. You can specify entities with either its targetname of its hammerid by starting the string with `#` (e.g. "#123456").

```jsonc
[
    {
        "name":             "",     // OPTIONAL - (string) Name of boss that appears in hud
        "breakable":        "",     // Targetname/Hammerid of breakable
        "counter":          "",     // Targetname/Hammerid of counter
        "iterator":         "",     // OPTIONAL - Targetname/Hammerid of hp iterator (segments)
        "backup":           "",     // OPTIONAL - Targetname/Hammerid of hp backup

        "trigger":                  // OPTIONAL - Specifies the event that triggers the boss
        {
            "ent":          "",     // (string) Targetname/Hammerid of entity
            "output":       "",     // (string) Output of entity
            "delay":        0.0     // OPTIONAL - (float) Delay after output that starts boss
        },

        "showtrigger":              // OPTIONAL - Specifies event that starts displaying boss health
        {
            "ent":          "",     // (string) Targetname/Hammerid of entity
            "output":       "",     // (string) Output of entity
            "delay":        0.0     // OPTIONAL - (float) Delay after event that shows boss health
        },

        "killtrigger":              // OPTIONAL - Specifies event that force kills the boss
        {
            "ent":          "",     // (string) Targetname/Hammerid of entity
            "output":       "",     // (string) Output of entity
            "delay":        0.0     // OPTIONAL - (float) Delay after event that force kills boss
        },

        "hurttrigger":              // OPTIONAL - Specifies event that is considered as damaging the boss
        {
            "ent":          "",     // (string) Targetname/hammerid of entity
            "output":       ""      // (string) Output of entity
        },

        "reversecounter":   false,  // OPTIONAL - (bool) Whether counter should be reversed
        "reverseiterator":  false,  // OPTIONAL - (bool) Whether iterator should be reversed
        "hitmarkeronly":    false,  // OPTIONAL - (bool) Whether only hitmarkers should be shown when hitting boss
        "minorhud":         false,  // OPTIONAL - (bool) Whether boss should should be displayed as no-bar hud variant
        "multitrigger":     false,  // OPTIONAL - (bool) Whether boss can be triggered multiple times (multiple instances)
        "templated":        false,  // OPTIONAL - (bool) Whether boss is templated and has name fixup
        "showbeaten":       true,   // OPTIONAL - (bool) Whether top boss damage should be displayed after boss death
        "timeout":          0.0,    // OPTIONAL - (float) Specify time before boss health is hidden after taking no damage
        "offset":           0.0,    // OPTIONAL - (float) Specify amount of health to ADD to displayed health (negative to subtract)
        "offsetiterator":   0.0,    // OPTIONAL - (float) Specify amount of iterator segments to ADD to displayed health (negative to subtract)
        "maxhp":            0.0     // OPTIONAL - (float) If the boss has more than this HP, it will not start showing on the HUD (0.0 = no limit)
    },

    // Breakable boss example
    {
        "name":             "",
        "breakable":        ""
    },

    // Counter example
    {
        "name":             "",
        "counter":          ""
    },

    // Counter, backup, and iterator example
    {
        "name":             "",
        "counter":          "",
        "backup":           "",
        "iterator":         ""
    },

    // Counter and iterator example
    {
        "name":             "",
        "counter":          "",
        "iterator":         ""
    },

    // Breakable and iterator example
    {
        "name":             "",
        "breakable":        "",
        "iterator":         ""
    }
]
```