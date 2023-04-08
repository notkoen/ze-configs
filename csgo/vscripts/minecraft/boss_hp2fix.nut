Tick <- true;

function AddHealth(add_amount)
{
	local p = null;
	while (null != (p = Entities.FindByClassname(p,"player")))
	{
		if (p.GetTeam() == 2 && p.GetHealth() > 0)
			EntFireByHandle(self,"AddHealth",""+add_amount,0.00,null,null);
	}
	TextBossHp();
}

function TextBossHp()
{
	if (Tick)
	{
		EntFire("BOSS_HP_TEXT2", "AddOutput", "message BALROG " + self.GetHealth(), 0.00, null);
		EntFireByHandle(self, "RunScriptCode", "TextBossHp();", 0.05, null, null);
	}
}