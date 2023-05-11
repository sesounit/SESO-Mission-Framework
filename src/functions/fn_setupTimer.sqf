/*
* Author: Dildo Sagbag
*
* Description:
* Setups setup countdown until players are notified to start the mission. Also allocates respawn tickets according to number of players.
*
* Arguments:
* 0: Amount of seconds until countdown ends. Automatically converts to minutes when displayed. <NUMBER>
* 1: Time multiplier to set after countdown is over.
*
* Return Value:
* None
*
* Example:
* [250] call SESO_fnc_setupTimer;
* [60, 5] call SESO_fnc_setupTimer;
*
* Public: Yes
*/

params ["_endTime", ["_timeMultiplier", 1]];

//SESO_isCanceled = false;

// Server Only
if (isServer) then {
	[_endTime, true] call BIS_fnc_countdown;
	waitUntil { sleep 1; !([true] call BIS_fnc_countdown) };
	// Time Multipler
	setTimeMultiplier _timeMultiplier;
	// Set Respawn tickets
	[missionNamespace, round ((playersNumber playerSide) * 2.5)] call BIS_fnc_respawnTickets;
};

// Players Only
if(hasInterface) then {
	waitUntil { sleep 1; !([true] call BIS_fnc_countdown) };
	["SetupOverNotif"] call BIS_fnc_showNotification;
	//if (SESO_isCanceled) then {
	//	["SetupCanceledNotif"] call BIS_fnc_showNotification;
	//} else {
	//	["SetupOverNotif"] call BIS_fnc_showNotification;
	//};
};
