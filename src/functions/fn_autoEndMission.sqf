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

if !(isServer) exitWith {};

// Auto-end mission when there are no tickets
private _zeus = [getAssignedCuratorUnit (allCurators select 0)];

private _amtOfTickets = [missionNamespace] call BIS_fnc_respawnTickets;
if ((_amtOfTickets <= 0)) then {
	private _operatives = (call BIS_fnc_listPlayers) - _zeus;
	// If there are no operatives that are alive
	if ((_operatives findIf { alive _x }) == -1) then {
		["LOSER", true, 3] remoteExec ["BIS_fnc_endMission", 0, true];
	};
};