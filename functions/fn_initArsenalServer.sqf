/*
* Author: Dildo Sagbag
*
* Description:
* Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items
*
* Arguments:
* 0: Array of classes of items to add to the arsenal <ARRAY>
*
* Return Value:
* None
*
*
* Public: Yes
*/
params [["_optionalItems", []]];

if !(isServer) exitWith {};

// Get list of Arsenals
SESO_var_arsenals = (getMissionLayerEntities "Arsenals") select 0;
publicVariable "SESO_var_arsenals";

// Add optionalItems to arsenals
{
	nul = [_x,_optionalItems] spawn {
		params ["_selectArsenal","_optionalItems"];
		waitUntil { sleep 1; (count (flatten (_selectArsenal getVariable ["ace_arsenal_virtualItems", []]))  > 1 ) or (time > 200)};
		[_selectArsenal, _optionalItems, true] call ace_arsenal_fnc_addVirtualItems;
	};
}forEach SESO_var_arsenals;

[] remoteExecCall ["SESO_fnc_initArsenalPlayer",0,true];