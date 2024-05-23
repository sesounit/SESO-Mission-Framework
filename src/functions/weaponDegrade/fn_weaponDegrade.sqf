/*
	Author: TheTimidShade, modified by Dildo Sagbag

	Description:
		Replacement for Diwako Punish Unknown Weapon designed to work with the latest ACE Overheating functionality

	Parameters:
		NONE
		
	Returns:
		NONE
*/

[] spawn { // To prevent suspension from blocking mission initialisation
    SESO_hash_weapon_cache = createHashMap;

    if (isServer) then { // when executed on the server, initialise the weapon whitelist(s)
        if (isNil "SESO_var_weapon_whitelist_LOCAL") then {SESO_var_weapon_whitelist_LOCAL = [];};
        [SESO_var_weapon_whitelist_LOCAL] spawn SESO_fnc_addAllowedWeapons;

        if (isNil "SESO_var_overheat_whitelist_LOCAL") then {SESO_var_overheat_whitelist_LOCAL = [];};
        SESO_var_overheat_whitelist = SESO_var_overheat_whitelist_LOCAL;
        publicVariable "SESO_var_overheat_whitelist";
    };
    if (!hasInterface) exitWith {};

    // Add fired event handler
    ["ace_firedPlayer", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
        [_weapon, _muzzle, _ammo, _magazine, _projectile] call SESO_fnc_handleWeaponOverheating;
    }] call CBA_fnc_addEventHandler;

    sleep SESO_setting_PropagationTimer;

    private _weaponsToAdd = [];
    {
        if (_x != "") then {
            _weaponsToAdd pushBackUnique _x;
        };
    } forEach [primaryWeapon player, secondaryWeapon player, handgunWeapon player];

    [_weaponsToAdd] remoteExec ["SESO_fnc_addAllowedWeapons", 2, false];

};