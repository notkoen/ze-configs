Segments <- 0;
BossHealth <- 0.00;
ticking <- false;
rh <- 0.00;
Player <- 0;
timer <- 30;
Red_att <- 0;
Blue_att <- 0;
Cyan_att <- 0;
Green_att <- 0;
Magenta_att <- 0;
Yellow_att <- 0;
Reset_att <- 6;

function AddHealth(add_amount)
{
    local p = null;
    while (null != (p = Entities.FindByClassname(p, "player")))
    {
        if (p.GetTeam() == 3)
        {
            BossHealth += add_amount;
            rh += add_amount;
            Player++;
        }
    }
}

function ResetHealth()
{
    local h = null;
    while (null != (h = Entities.FindByClassname(h, "player")))
    {
        if (h.GetTeam() == 3)
        {
            BossHealth += (rh / Player);
        }
    }
}

function HpBarFrame(Frame)
{
    if (Segments == 0)
    {
        Segments = Frame;
    }
}

function ChangeHp()
{
    if (BossHealth <= 0)
    {
        HpBar();
        Segments--;
    }
    else if (Segments <= 0)
    {
        BossKill();
        ticking = false;
    }
}

function HpBar()
{
    for (local i = Segments; i >= 0; i--)
    {
        EntFireByHandle(self, "RunScriptCode", "ResetHealth()", 0.00, null, null);
        return;
    }
}

function Start()
{
    ticking = true;
    Tick();
}

function Tick()
{
    if (ticking == true)
    {
        EntFireByHandle(self, "RunScriptCode", "Tick()", 0.05, null, null);
        EntFireByHandle(self, "RunScriptCode", "ChangeHp()", 0.02, null, null);
        EntFireByHandle(self, "RunScriptCode", "StartTickHP();", 0.10, null, null);
    }
}

function StartTickHP()
{
    ScriptPrintMessageCenterAll("Boss HP: <font class='fontSize-l'>" + BossHealth + " [" + Segments + "|8]");

    // EntFire("bosshp", "SetText", "Segments["+Segments+"|8]\nBOSS HP: "+BossHealth.tostring(), 0.00, null);
    // EntFire("bosshp", "Display", "", 0.02, null);
}

function StartShuff(number, two)
{
    local attack = RandomInt(number,two);
    if (attack == 1)
    {
        if (attack == 1 && Red_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles 90 0 0", 0.00, null);
            EntFire("timer_bullet", "Enable", "", 1.50, null);
            EntFire("rot_bullet", "Start", "", 0.00, null);
            EntFire("maker_bullet*", "AddOutput", "EntityTemplate temp_bullet", 0.00, null);
            EntFire("rot_bullet", "Reverse", "", 29.00, null);
            Red_att++;
            Reset_att--;
        }
        else if (attack == 1 && Red_att == 1)
        {
            EntFireByHandle(self,"RunScriptCode"," StartShuff(2, 6); ",0.05,null,null);
        }
    }
    else if (attack == 2)
    {
        if (attack == 2 && Blue_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles 180 0 0", 0.00, null);
            EntFire("case_laser1", "PickRandom", "", 2.00, null);
            EntFire("case_laser1", "PickRandom", "", 4.00, null);
            EntFire("case_laser1", "PickRandom", "", 6.00, null);
            EntFire("case_laser1", "PickRandom", "", 8.00, null);
            EntFire("case_laser1", "PickRandom", "", 10.00, null);
            EntFire("case_laser1", "PickRandom", "", 12.00, null);
            Blue_att++;
            Reset_att--;
        }
        else if (attack == 2&&Blue_att == 1)
        {
            EntFireByHandle(self, "RunScriptCode", "StartShuff(1,6);", 0.05, null, null);
        }
    }
    else if (attack == 3)
    {
        if (attack == 3 && Cyan_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles -90 0 0", 0.00, null);
            EntFire("temp_wind", "ForceSpawn", "", 1.00, null);
            Cyan_att++;
            Reset_att--;
        }
        else if (attack == 3 && Cyan_att == 1)
        {
            EntFireByHandle(self, "RunScriptCode", "StartShuff(1,6);", 0.05, null, null);
        }
    }
    else if (attack == 4)
    {
        if (attack == 4 && Green_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles 0 0 -90", 0.00, null);
            EntFire("maker_spinner", "ForceSpawn", "", 0.00, null);
            EntFire("d_spinner", "Open", "", 2.00, null);
            EntFire("rot_spinner", "StartBackward", "", 10.00, null);
            EntFire("rot_spinner", "AddOutput", "maxspeed 30", 9.95, null);
            EntFire("hurt_spinner*", "Kill", "", 25.00, null);
            EntFire("rot_spinner", "AddOutput", "maxspeed 20", 25.00, null);
            EntFire("d_spinner", "Close", "", 25.00, null);
            EntFire("rot_spinner", "Stop", "", 25.00, null);
            EntFire("rot_spinner", "StartForward", "", 0.00, null);
            EntFire("part_spinner*", "Kill", "", 25.00, null);
            Green_att++;
            Reset_att--;
        }
        else if (attack == 4 && Green_att == 1)
        {
            EntFireByHandle(self, "RunScriptCode", "StartShuff(1,6);", 0.05, null, null);
        }
    }
    else if (attack == 5)
    {
        if (attack == 5 && Magenta_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles 0 0 90", 0.00, null);
            EntFire("case_pull", "PickRandomShuffle", "", 1.00, null);
            EntFire("case_pull", "PickRandomShuffle", "", 5.00, null);
            EntFire("case_pull", "PickRandomShuffle", "", 9.00, null);
            EntFire("case_pull", "PickRandomShuffle", "", 13.00, null);
            Magenta_att++;
            Reset_att--;
        }
        else if (attack == 5 && Magenta_att == 1)
        {
            EntFireByHandle(self, "RunScriptCode", "StartShuff(1,6);", 0.05, null, null);
        }
    }
    else if (attack == 6)
    {
        if (attack == 6 && Yellow_att == 0)
        {
            EntFire("part_boss", "AddOutput", "angles 0 0 0", 0.00, null);
            EntFire("maker_bullet*", "AddOutput", "EntityTemplate temp_spinbullet", 0.00, null);
            EntFire("timer_spinbullet", "Enable", "", 0.00, null);
            EntFire("rot_bullet", "Stop", "", 0.00, null);
            EntFire("rot_bullet", "AddOutput", "angles 0 0 0", 0.05, null);
            EntFire("rot_bullet", "AddOutput", "angles 0 15 0", 3.95, null);
            EntFire("rot_bullet", "AddOutput", "angles 0 30 0", 5.95, null);
            Yellow_att++;
            Reset_att--;
        }
        else if (attack == 6 && Yellow_att == 1)
        {
            EntFireByHandle(self, "RunScriptCode", "StartShuff(1,5);", 0.05, null, null);
        }
    }
    EntFireByHandle(self, "RunScriptCode", "ResetAttack();", 0.00, null, null);
}

function ResetAttack()
{
    if (Reset_att == 0)
    {
        Red_att = 0;
        Blue_att = 0;
        Cyan_att = 0;
        Green_att = 0;
        Magenta_att = 0;
        Yellow_att = 0;
        Reset_att = 6;
    }
}

function tickingshuff()
{
    if (timer > 0&&ticking == true)
    {
        EntFireByHandle(self, "RunScriptCode", "timer--;", 1.00, null, null);
    }
    else if (timer == 0)
    {
        timer = 30;
        EntFireByHandle(self, "RunScriptCode", "StartShuff(1, 6)", 0.00, null, null);
    }
    EntFireByHandle(self, "RunScriptCode", "tickingshuff()", 1.00, null, null);
}

function br()
{
    EntFireByHandle(self, "RunScriptCode", "tickingshuff()", 0.00, null, null);
    EntFireByHandle(self, "RunScriptCode", "StartShuff(1,6)", 0.00, null, null);
}

function BossStart()
{
    EntFire("part_boss", "Start", "", 6.00, null);
    EntFire("d_white*", "Close", "", 0.00, null);
    EntFire("whiteportal*", "SetFadeEndDistance", "32", 7.00, null);
    EntFire("whiteportal*", "SetFadeStartDistance", "16", 7.00, null);
    EntFire("ml_bossplat*", "Open", "", 0.00, null);
    EntFire("ml_boss", "Open", "", 9.00, null);
    EntFire("part_whitecube", "Stop", "", 6.00, null);
    EntFireByHandle(self,"RunScriptCode"," br() ",12.00,null,null);
    EntFire("fade_white", "Fade", "", 6.00, null);
    EntFire("tr_bossaddhp", "Enable", "", 12.00, null);
    EntFire("fall_hurt", "Enable", "", 12.00, null);
    EntFire("temp_boss", "ForceSpawn", "", 5.00, null);
    EntFire("tp_red", "Enable", "", 1.00, null);
    EntFire("tp_red", "AddOutput", "target td_white", 0.00, null);
    EntFire("tp_spawn", "AddOutput", "target td_white", 0.00, null);
    EntFire("tp_spawn", "Enable", "", 1.00, null);
}

function BossKill()
{
    EntFire("pbox_boss", "Break", "", 0.00, null);
    EntFire("tr_bossaddhp", "Kill", "", 0.00, null);
    EntFire("ml_boss", "Kill", "", 0.00, null);
    EntFire("case_bossatk", "Kill", "", 0.00, null);
    EntFire("maker_pull", "Kill", "", 0.00, null);
    EntFire("maker_laser1", "Kill", "", 0.00, null);
    EntFire("dy_bullet*", "Kill", "", 0.05, null);
    EntFire("dy_spinbullet*", "Kill", "", 0.05, null);
    EntFire("part_spinner*", "Kill", "", 0.05, null);
    EntFire("hurt_spinner*", "Kill", "", 0.05, null);
    EntFire("ml_laser1*", "Kill", "", 0.05, null);
    EntFire("rot_wind*", "Kill", "", 0.05, null);
    EntFire("ml_pull*", "Kill", "", 0.05, null);
    EntFire("fade_white", "Fade", "", 0.00, null);
    EntFire("part_whitecube", "Start", "", 0.00, null);
    EntFire("case_pull", "Kill", "", 0.00, null);
    EntFire("ml_bossplat*", "Close", "", 5.00, null);
    EntFire("push_escape", "Enable", "", 15.00, null);
    EntFire("tp_escape", "Enable", "", 0.00, null);
    EntFire("tp_blue", "Disable", "", 0.00, null);
    EntFire("tp_blue_fall", "Disable", "", 0.00, null);
    EntFire("d_white_escape", "Open", "", 5.00, null);
    EntFire("whiteportal_escape", "SetFadeStartDistance", "3072", 0.00, null);
    EntFire("whiteportal_escape", "SetFadeEndDistance", "3584", 0.00, null);
    EntFire("ml_escape", "Open", "", 16.00, null);
    EntFire("part_escape", "Start", "", 15.00, null);
    EntFire("tr_blue", "Disable", "", 0.00, null);
    EntFire("server", "Command", "say *** 3 ***", 12.00, null);
    EntFire("server", "Command", "say *** 2 ***", 13.00, null);
    EntFire("server", "Command", "say *** 1 ***", 14.00, null);
    EntFire("temp_laser1", "Kill", "", 0.00, null);
    EntFire("temp_wind", "Kill", "", 0.00, null);
}
