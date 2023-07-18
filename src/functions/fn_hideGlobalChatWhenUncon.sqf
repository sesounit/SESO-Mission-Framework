if !(hasInterface) exitWith {};

private _GLOBAL_DISABLER_ID = ["ace_unconscious", {
	params ["_unit", "_state"];

	if (_unit != ACE_player) exitWith {}; // Ignore if remote unit

	if (_state) then {
		//0 enableChannel false;
		[0, false] remoteExec ["enableChannel", ACE_player];
	} else {
		//0 enableChannel true;
		[0, true] remoteExec ["enableChannel", ACE_player];
	}
}] call CBA_fnc_addEventHandler;

_GLOBAL_DISABLER_ID;