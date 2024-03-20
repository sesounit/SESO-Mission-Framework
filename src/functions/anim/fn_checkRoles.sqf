#define AT_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa")
#define AA_CHECK (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_aa_ca.paa")
#define MG_CHECK (getText(configFile >> "CfgWeapons" >> (primaryWeapon (player)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa")

params ["_unit"];
private _speedMultiplier = parseNumber (missionNamespace getVariable "SESO_setting_RoleFlagMultiplier");
private _penaltyStack = 0;
private _totalSpeed = 1;
// Determine Penalty Stacks
if ((MG_CHECK) and !(player getVariable ["SESO_MG_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with Machine Guns...";
};
if ((AT_CHECK) and !(player getVariable ["SESO_AT_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with AT Launchers...";
};
if ((AA_CHECK) and !(player getVariable ["SESO_AA_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with AA Launchers...";
};

_unit setVariable ["SESO_penaltyStack", _penaltyStack];
//systemChat ("Penalty Count is x" + str (_penaltyStack));

private _totalSpeed = _totalSpeed * (_speedMultiplier ^ _penaltyStack);
_unit setVariable ["SESO_totalSpeed", _totalSpeed];

_penaltyStack;