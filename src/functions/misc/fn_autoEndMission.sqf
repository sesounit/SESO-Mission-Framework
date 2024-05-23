/*
* Author: Dildo Sagbag
*
* Description:
* Counts the number of tickets and living operatives (players) in the mission excluding the Zeus. If there are no tickets and no players are alive except the Zeus, mission is failed.
*
* Arguments:
* None
*
* Public: Yes
*/

#include "..\script_component.hpp"

//if (isServer) exitWith {};

// Auto-end mission when there are no tickets
private _zeus = [getAssignedCuratorUnit (allCurators select 0)];
private _operatives = (call BIS_fnc_listPlayers) - _zeus;
private _amtOfTickets = 0;

if (([player, 0] call BIS_fnc_respawnTickets) <= 1) then {
	[player] spawn {
		sleep 5;
		["close"] call BIS_fnc_showRespawnMenu;
		[] call ace_spectator_fnc_setSpectator;
	};
};


/*
{
_amtOfTickets = _amtOfTickets + ([_x, 0] call BIS_fnc_respawnTickets);
}forEach _operatives;

if ((_amtOfTickets <= 0)) then {
	// If there are no operatives that are alive
	if ((_operatives findIf { alive _x }) == -1) then {
		["LOSER", true, 3] remoteExec ["BIS_fnc_endMission", 0, true];
	};
};
*/