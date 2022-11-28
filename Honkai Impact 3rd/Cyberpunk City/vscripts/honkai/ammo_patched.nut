WeaponClassAmmo <- {
	weapon_ak47 = 45
	weapon_aug = 45
	weapon_awp = 6
	weapon_bizon = 64
	weapon_deagle = 10
	weapon_elite = 30
	weapon_famas = 45
	weapon_fiveseven = 15
	weapon_g3sg1 = 15
	weapon_galilar = 45
	weapon_glock = 20
	weapon_hkp2000 = 20
	weapon_m249 = 100
	weapon_m4a1 = 45
	weapon_mac10 = 50
	weapon_mag7 = 10
	weapon_mp7 = 50
	weapon_mp9 = 45
	weapon_negev = 125
	weapon_nova = 10
	weapon_p250 = 20
	weapon_p90 = 65
	weapon_sawedoff = 10
	weapon_scar20 = 15
	weapon_sg556 = 45
	weapon_ssg08 = 6
	weapon_tec9 = 20
	weapon_ump45 = 45
	weapon_xm1014 = 10
};

function IsWeapon(ent)
{
	return ent != null && ent.GetClassname().find("weapon_") == 0;
}

function NextWeapon(wp)
{
	wp = wp.NextMovePeer();
	while (wp && !IsWeapon(wp)) wp = wp.NextMovePeer();
	return wp;
}

function SetWeaponAmmo(wp, amt)
{
	EntFireByHandle(wp, "SetAmmoAmount", amt.tostring(), 0.0, null, null);
}

function SetAmmoPistols(wp)
{
	if (wp.GetClassname() in WeaponClassAmmo) SetWeaponAmmo(wp, WeaponClassAmmo[wp.GetClassname()]);
}

function SetAmmoOnPlayer()
{
	w <- activator.FirstMoveChild();
	w = IsWeapon(w) ? w : NextWeapon(w);
	SetAmmoPistols(w);
	while (w)
	{
		w = NextWeapon(w);
		if (w) SetAmmoPistols(w);
	}
}