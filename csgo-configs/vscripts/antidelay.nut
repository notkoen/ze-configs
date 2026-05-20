// General Teleport
//  Team - Humans are 1, Zombies are 2
//  _x,_y,_z = Coordinates of destination (X-coordinates,Y-coordinates,Z-coordinates)
function TeleportTeam(team, _x, _y, _z) {
    team = 4 - team;
    local p = null;
    while (null != (p = Entities.FindByClassname(p, "player"))) {
        if (p != null && p.IsValid() && p.GetTeam() == team && p.GetHealth()>0 && !p.IsNoclipping()) {
            EntFireByHandle(p, "AddOutput", "origin " + _x + " " + _y + " " + _z, 0.00, self, self);
        }
    }
}

// Teleport players above/below/at a Z-coordinate
//  Team - Humans are 1, Zombies are 2
//  _x,_y,_z = Coordinates of destination (X-coordinates,Y-coordinates,Z-coordinates)
// _height = The Z-coordinate that you want to check
// _check = use 1 to check anyone above _height, use 2 to check below _height
function Z_check_TeleportTeam(team, _height, _check, _x, _y, _z)
{
    team = 4 - team;
    local p = null;

    while (null != (p = Entities.FindByClassname(p, "player"))) {
        if (p != null && p.IsValid() && p.GetTeam() == team && p.GetHealth() > 0 && !p.IsNoclipping()) {
            if (_check == 1) {
                if (p.GetOrigin().z > _height) {
                    EntFireByHandle(p, "AddOutput", "origin " + _x + " " + _y + " " + _z, 0.00, self, self);
                }
            }
            else if (_check == 2) {
                if (p.GetOrigin().z < _height) {
                    EntFireByHandle(p, "AddOutput", "origin " + _x + " " + _y + " " + _z, 0.00, self, self);
                }
            }
            else {
                if (p.GetOrigin().z == _height) {
                    EntFireByHandle(p, "AddOutput", "origin "+_x + " "+_y+" "+_z, 0.00, self, self);
                }
            }
        }
    }
}

// Slay
function KillAllT()
{
    local p = null;
    while (null != (p = Entities.FindByClassname(p,"player"))) {
        if (p != null && p.IsValid() && p.GetTeam() == 2 && p.GetHealth() > 0)
            EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
    }
}

function KillAllCT()
{
    local p = null;
    while (null != (p = Entities.FindByClassname(p,"player"))) {
        if (p != null && p.IsValid() && p.GetTeam() == 3 && p.GetHealth() > 0)
            EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
    }
}

function KillAll() {
    local p = null;
    while (null != (p = Entities.FindByClassname(p,"player"))) {
        if (p != null && p.IsValid() && p.GetHealth() > 0)
            EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
    }
}