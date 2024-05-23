/*
	Author: TheTimidShade

	Description:
		Handles weapon fire event for fn_weaponRestriction

	Parameters:
		0: STRING - Weapon classname
		
	Returns:
		NONE
*/

params [
	["_weapon", "", [""]],
	["_muzzle", "", [""]],
	["_ammo", "", [""]],
	["_magazine", "", [""]],
	["_bullet", objNull, [objNull]]
];

if !(currentWeapon ace_player == _weapon) exitWith {};

// if weapon is in the no overheat list, reset heating to 0 and exit
if (_weapon in SESO_var_weapon_whitelist) exitWith {
	player setVariable ["ace_overheating_" + (_weapon) + "_temp", 0]; // remove weapon heat
};

// if weapon is allowed or is a GL/launcher/grenade or weapon restruction is disabled ignore the fired event
if (_weapon in SESO_var_weapon_whitelist || {(_muzzle != (primaryWeapon player)) && {_muzzle != (handgunWeapon player)}}) exitWith {};

private _weaponData = SESO_hash_weapon_cache getOrDefault [_weapon, false];

if !(_weaponData) then {
	SESO_hash_weapon_cache set [_weapon, true];
	// get weapon data
	private _weaponData = [_weapon] call ace_overheating_fnc_getWeaponData;
	/*
	* 0: dispersion <NUMBER>
	* 1: slowdownFactor <NUMBER>
	* 2: jamChance <NUMBER>
	*/
	_weaponData set [0, (_weaponData select 0) + SESO_setting_DispersionValue];
	_weaponData set [2, (_weaponData select 2) + (SESO_setting_JamValue / 100)];
	ace_overheating_cacheWeaponData set [_weapon, _weaponData];
};