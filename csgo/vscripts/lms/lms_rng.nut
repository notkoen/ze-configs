function PickLastMan()
{
	local players = [];
	local p = null
	while (p = Entities.FindByClassname(p, "player"))
	{
		if (p.IsValid() && p.GetTeam() == 3)
			players.push(p);
	}

	local luck = RandomInt(0, players.len() - 1);
	players[luck].__KeyValueFromString("targetname", "last_man_standing");
}