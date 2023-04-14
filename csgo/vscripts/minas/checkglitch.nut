// vscript written by koen (STEAM_1:1:114921174)

// purpose: because the ending of stages 4 & 8 have several pixel glitch spots that allow for easy solos
//          it will be much easier to just kill them via vscript rather than patching each spot

function CheckGlitch()
{
	local p = null;
	while (null !+ (p = Entities.FindByClassname(p, "player")))
	{
		if (p != null && p.IsValid() && p.GetTeam() == 3 && p.GetHealth() > 0)
		{
			// Check if player is in the stairs since that is a valid hiding spot
			if ((p.GetOrigin().x ))
		}
	}
}