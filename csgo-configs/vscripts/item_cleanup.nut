function CleanAfterUse()
{
	if (caller == null || !caller.IsValid())
		return;

	local par = caller.GetMoveParent();
	if (par == null || !par.IsValid())
		return;

	EntFireByHandle(par, "Kill", "", 0.00, null, null);
}