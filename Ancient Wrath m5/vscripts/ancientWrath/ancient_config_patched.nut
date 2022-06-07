self.__KeyValueFromString("targetname", "ancient_config");

::MAPPER_SID <- [
    "STEAM_1:0:161274095", //NiceShot
];

::VIP_SID <- [
    "STEAM_1:1:17775692" //memories
];

function OnPostSpawn()
{
    FixAmmoGText();
}

function FixAmmoGText()
{
    local f_ent = Entities.FindByName(null, "weapon_flamethrower_button");
    if(f_ent != null && f_ent.IsValid())
    {
        printl("FOUND FLAMETHROWER");
        local NewPickUpFire = function()
        {
            if(FLAMETHROWER_WEAPON == null){FLAMETHROWER_WEAPON = caller;}
            if(FLAMETHROWER_FTEXT == null)
            {
                FLAMETHROWER_FTEXT = Entities.FindByName(null, "fuel_text");
                // FLAMETHROWER_FTEXT = Entities.CreateByClassname("game_text");
                // FLAMETHROWER_FTEXT.__KeyValueFromString("targetname", "flamethrower_fuel_text");
                // FLAMETHROWER_FTEXT.__KeyValueFromFloat("y", 0.16);
                // FLAMETHROWER_FTEXT.__KeyValueFromFloat("x", 0.19);
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("channel", 1);
                // FLAMETHROWER_FTEXT.__KeyValueFromVector("color", Vector(255, 83, 0));
                // FLAMETHROWER_FTEXT.__KeyValueFromVector("color2", Vector(255, 83, 0));
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("effect", 0);
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("fadein", 0);
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("fadeout", 0);
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("fxtime", 0);
                // FLAMETHROWER_FTEXT.__KeyValueFromInt("spawnflags", 0);
            }
            if(FLAMETHROWER_GTEXT == null){FLAMETHROWER_GTEXT = Entities.FindByName(null, "weapon_flamethrower_game_text1");}
            if(FLAMETHROWER_TPOS == null){FLAMETHROWER_TPOS = Entities.FindByName(null, "item_flamethr_trigpos");}
            if(FLAMETHROWER_MEASURE == null){FLAMETHROWER_MEASURE = Entities.FindByName(null, "item_flamethro_measure");}
            if(FLAMETHROWER_OWNER == null){ScriptPrintMessageChatAll(" \x07>>> PLAYER HAS PICKED UP ACID LAUNCHER <<<");}
            // FLAMETHROWER_FTEXT.__KeyValueFromFloat("holdtime", 999);
            FLAMETHROWER_FTEXT.__KeyValueFromFloat("holdtime", 0.10);
            FLAMETHROWER_OWNER = activator;
            FLAMETHROWER_OWNER.__KeyValueFromString("targetname", "item_bow_"+split(""+FLAMETHROWER_OWNER, "player(")[0]);
            EntFireByHandle(FLAMETHROWER_MEASURE, "SetMeasureTarget", "item_bow_"+split(""+FLAMETHROWER_OWNER, "player(")[0], 0.00, FLAMETHROWER_OWNER, null);
            if(FLAMETHROWER_GTEXT != null && FLAMETHROWER_GTEXT.IsValid())
            {
                FLAMETHROWER_GTEXT.__KeyValueFromString("message", "Acid Launcher \nThrows boiling acid that burns zombies \nDuration: 15 Seconds \nFuel: "+abs(FLAMETHROWER_FUEL));
                EntFireByHandle(FLAMETHROWER_GTEXT, "Display", "", 0.00, FLAMETHROWER_OWNER, null);
            }
            if(!FLAMETHROWER_TICK_BOOL)
            {
                FLAMETHROWER_TICK_BOOL = true;
                FlameThrowerTick();
            }
        }
        f_ent.GetScriptScope().PickUpFire <- NewPickUpFire;
        return;
    }
    EntFireByHandle(self, "RunScriptCode", "FixAmmoGText();", 1.00, null, null);
}