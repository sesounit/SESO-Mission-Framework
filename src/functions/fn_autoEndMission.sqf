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

//if (isServer) exitWith {};

// Auto-end mission when there are no tickets
private _zeus = [getAssignedCuratorUnit (allCurators select 0)];
private _operatives = (call BIS_fnc_listPlayers) - _zeus;
private _amtOfTickets = 0;
{
_amtOfTickets = _amtOfTickets + ([_x, 0] call BIS_fnc_respawnTickets);
systemChat "Counting tickets, currently" + (str _amtOfTickets); 
}forEach _operatives;
systemChat "Tickets remaining:" + (str _amtOfTickets);
if ((_amtOfTickets <= 0)) then {
	// If there are no operatives that are alive
	if ((_operatives findIf { alive _x }) == -1) then {
		["LOSER", true, 3] remoteExec ["BIS_fnc_endMission", 0, true];
	};
};