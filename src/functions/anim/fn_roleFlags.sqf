#define AT_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa")
#define AA_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_aa_ca.paa")
#define MG_CHECK (getText(configFile >> "CfgWeapons" >> (primaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa")

if !(hasInterface) exitWith {};

// Set current speed variable to be compatible with fn_swimFaster
//player setVariable ["SESO_totalSpeed", 1];

// Set AT Role
if (AT_CHECK) then {
    player setVariable ["SESO_AT_role", true];
};

// Set AA Role
if (AA_CHECK) then {
    player setVariable ["SESO_AA_role", true];
};

// Set Machinegunner Role
if (MG_CHECK) then {
    player setVariable ["SESO_MG_role", true];
};

// Check when taking a weapon from a container or arsenal
private _TAKE_ROLE_FLAGS_ID = player addEventHandler ["Take", {
	params ["_unit"];
    [_unit] call SESO_fnc_checkRoles;
}];

// Check when closing inventory. Necessary because Take EH does not check when dropping a weapon.
private _INV_ROLE_FLAGS_ID = player addEventHandler ["InventoryClosed", {
	params ["_unit"];
    [_unit] call SESO_fnc_checkRoles;
}];

// Prevent exploit where player can drive around to avoid their penalties. At more than 1 penalty, they will not be able to enter any vehicle.
private _CAR_ROLE_FLAGS_ID = player addEventHandler ["GetInMan", {
	params ["_unit"];
    private _penaltyStack = _unit getVariable ["SESO_penaltyStack", 0];

    if (_penaltyStack > 1) then {
        moveOut _unit;
    };
}];