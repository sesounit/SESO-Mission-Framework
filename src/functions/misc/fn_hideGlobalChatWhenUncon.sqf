
#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

private _GLOBAL_DISABLER_ID = ["ace_unconscious", {
	params ["_unit", "_state"];

	if (_unit != ACE_player) exitWith {}; // Ignore remote or AI unit

	// If player is unconscious..
	if (_state) then {
		// Disable global chat
		[0, false] remoteExec ["enableChannel", _unit];
	} else {
		// Enable Global Chat
		[0, true] remoteExec ["enableChannel", _unit];
	}
}] call CBA_fnc_addEventHandler;

_GLOBAL_DISABLER_ID;