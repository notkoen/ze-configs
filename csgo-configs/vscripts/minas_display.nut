// Vscript by koen (STEAM_1:1:114921174)

// White Knight
wk_picked <- false;
wk_cooldown <- [150,6];
wk_status <- [0,0];
wk_heavy_sword <- false;

function DisplayKnightCooldown()
{
	if (!wk_picked)
	{
		return;
	}

	wk_text <- null;
	wkent <- null;

	while ((wkent = Entities.FindByName(wkent, "ph_item_goliath_2")) != null)
	{
		wk_text = "HP: " + wkent.GetHealth().tostring() + "\n";
		break;
	}

	wk_text += "Nuke - " + (wk_status[0] > 0 ? wk_status[0].tointeger() + "s" : "Ready") + "\n";
	wk_text += "Defense - " + (wk_status[1] > 0 ? wk_status[1].tointeger() + "s" : "Ready") + "\n";
	wk_text += "Mode - " + (wk_heavy_sword ? "Heavy Sword" : "Light Sword");

	self.__KeyValueFromString("message", wk_text);
	EntFireByHandle(self, "Display", "", 0.00, activator, null);
	EntFireByHandle(self, "RunScriptCode", "DisplayKnightCooldown()", 0.10, activator, null);
}

function UseKnightAbility(ability)
{
	wk_status[ability] = wk_cooldown[ability];
	EntFireByHandle(self, "RunScriptCode", "UpdateKnightCooldown(" + ability.tostring() + ")", 1.0, null, null);
}

function UpdateKnightCooldown(ability)
{
	if (wk_status[ability] > 0)
	{
		wk_status[ability] -= 1;
		EntFireByHandle(self, "RunScriptCode", "UpdateKnightCooldown(" + ability.tostring() + ")", 1.0, null, null);
	}
}

// Gandalf
dalf_picked <- false;
dalf_cooldown <- [75,75];
dalf_status <- [0,0];

function DisplayGandalfCooldown()
{
	if (!dalf_picked)
	{
		return;
	}

	dalf_text <- null;
	dalfent <- null;

	while ((dalfent = Entities.FindByName(dalfent, "ph_item_gandalf_15")) != null)
	{
		dalf_text = "HP: " + dalfent.GetHealth().tostring() + "\n";
		break;
	}

	dalf_text += "Light - " + (dalf_status[0] > 0 ? dalf_status[0].tointeger() + "s" : "Ready") + "\n";
	dalf_text += "DAWDS - " + (dalf_status[1] > 0 ? dalf_status[1].tointeger() + "s" : "Ready") + "\n";

	self.__KeyValueFromString("message", dalf_text);
	EntFireByHandle(self, "Display", "", 0.00, activator, null);
	EntFireByHandle(self, "RunScriptCode", "DisplayGandalfCooldown()", 0.10, activator, null);
}

function UsedGandalfAbility(ability)
{
	dalf_status[ability] = dalf_cooldown[ability];
	EntFireByHandle(self, "RunScriptCode", "UpdateGandalfCooldown(" + ability.tostring() + ")", 1.0, null, null);
}

function UpdateGandalfCooldown(ability)
{
	if (dalf_status[ability] > 0)
	{
		dalf_status[ability] -= 1;
		EntFireByHandle(self, "RunScriptCode", "UpdateGandalfCooldown(" + ability.tostring() + ")", 1.0, null, null);
	}
}

// Balrog
bal_picked <- false;

function DisplayBalrogHealth()
{
	if (!bal_picked)
	{
		return;
	}

	balent <- null;
	balrog_text <- null;

	while ((balent = Entities.FindByName(balent, "ph_item_balrog_hp")) != null)
	{
		balrog_text = "Balrog: " + balent.GetHealth().tostring() + " HP";
		break;
	}

	self.__KeyValueFromString("message", balrog_text);
	EntFireByHandle(self, "Display", "", 0.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "DisplayBalrogHP()", 0.10, null, null);
}
