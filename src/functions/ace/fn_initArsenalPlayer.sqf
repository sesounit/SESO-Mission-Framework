/*
* Author: Dildo Sagbag
*
* Description:
* Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items
*
* Arguments:
* None
*
* Return Value:
* None
*
*
* Public: Yes
*/

#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

// Save loadout on mission start
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

// Save loadout on arsenal exit
private _ARSENAL_DISPLAY_ID = ["ace_arsenal_displayClosed", {
	// Save loadout on arsenal exit
	[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
	systemChat "Loadout saved for respawn";
}] call CBA_fnc_addEventHandler;

// Add starting loadout as a default loadout
private _loadoutName = roleDescription player;

// SP Workaround since roleDescription returns empty string in SP
if (roleDescription player == "") then {
	_loadoutName = "Starting Loadout";
};
[_loadoutName, getUnitLoadout player] call ace_arsenal_fnc_addDefaultLoadout;
