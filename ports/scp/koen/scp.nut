// ITEM TEXT
function PrintItemText(iNum)
{
	local text = "";
	switch (iNum)
	{
		case 1: // SCP714 - Ammo
		{
			text = "[SCP-714]\nGIVES YOU AMMO";
			break;
		}
		case 2: // SCP500 - Medic Bag
		{
			text = "[SCP-500]\nEFFECTIVELY CURES THE SUBJECT OF ALL DISEASES"
			break;
		}
	}
	self.__KeyValueFromString("message", text);
	EntFireByHandle(self, "Display", "", 0.1, activator, null);
}