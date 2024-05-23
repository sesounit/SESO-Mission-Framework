/*
* Author: Dildo Sagbag
*
* Description:
* Adds mission handler to report war crimes such as friendly fire, civilian kills, prisoner kills, and surrendered captive kills. Includes detection of war crime by vehicle colission, grenades, and even bleeding out in ACE3.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: Yes
*/

#include "..\script_component.hpp"

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator"];
	private _zeus = [getAssignedCuratorUnit (allCurators select 0)];
	_ownerKilled = owner _killed;
	_armedKilled = {_x != ""} count [currentWeapon _killed, secondaryWeapon _killed];
	if (_killer == _killed) then {
		_killer = _killed getVariable ["ace_medical_lastDamageSource", _killer];} else {_killer};
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
	if (isNull _instigator) then {_instigator = _killer};
	if (_killer in _zeus) exitWith {};
	if (_ownerKilled == clientOwner) then {
		if ((_killed isKindOf "CAManBase") && {(side group _killed isEqualTo civilian) or (side group _killed isEqualTo sideUnknown)} && {_armedKilled == 0} && {_killer in allPlayers}) then {
			// Remove 1 ticket per civilian
			//[missionNamespace, -1] call BIS_fnc_respawnTickets;
			_str_1 = str text format ["%2 has killed %1, an unarmed civilian.", (name _killed), (name _killer)];
			[_str_1] remoteExec ["systemChat", 0, false];
		};
		if ((_killed isKindOf "CAManBase") && {(side group _killed isEqualTo civilian) or (side group _killed isEqualTo sideUnknown)} && {_armedKilled != 0} && {_killer in allPlayers}) then {
			_str_2 = str text format ["%2 has killed %1, a civilian combatant.", (name _killed), (name _killer)];
			[_str_2] remoteExec ["systemChat", 0, false];
		};
		if (((animationState _killed) == "ACE_AmovPercMstpSsurWnonDnon") && {_killer in allPlayers}) then {
			_str_3 = str text format ["%2 has killed %1, a surrendered prisoner.", (name _killed), (name _killer)];
			[_str_3] remoteExec ["systemChat", 0, false];
		};
		if (((animationState _killed) == "ACE_AmovPercMstpScapWnonDnon") && {_killer in allPlayers}) then {
			// Remove 1 ticket per prisoner
			//[missionNamespace, -1] call BIS_fnc_respawnTickets;
			_str_4 = str text format ["%2 has killed %1, a captured prisoner.", (name _killed), (name _killer)];
			[_str_4] remoteExec ["systemChat", 0, false];
		};
		if (((side group _killed) isEqualTo (side group _killer)) && {_killed != _killer} && {_killer in allPlayers}) then {
			_str_5 = str text format ["%2 has teamkilled %1.", (name _killed), (name _killer)];
			[_str_5] remoteExec ["systemChat", 0, false];
		};
	};
	if (hasInterface && (!isServer) && (local _killed)) then {
		if ((_killed isKindOf "CAManBase") && {(side group _killed isEqualTo civilian) or (side group _killed isEqualTo sideUnknown)} && {_armedKilled == 0} && {_killer in allPlayers}) then {
			// Remove 1 ticket per civilian
			//[missionNamespace, -1] call BIS_fnc_respawnTickets;
			_str_1 = str text format ["%2 has killed %1, an unarmed civilian.", (name _killed), (name _killer)];
			[_str_1] remoteExec ["systemChat", 0, false];
		};
		if ((_killed isKindOf "CAManBase") && {(side group _killed isEqualTo civilian) or (side group _killed isEqualTo sideUnknown)} && {_armedKilled != 0} && {_killer in allPlayers}) then {
			_str_2 = str text format ["%2 has killed %1, a civilian combatant.", (name _killed), (name _killer)];
			[_str_2] remoteExec ["systemChat", 0, false];
		};
		if (((animationState _killed) == "ACE_AmovPercMstpSsurWnonDnon") && {_killer in allPlayers}) then {
			_str_3 = str text format ["%2 has killed %1, a surrendered prisoner.", (name _killed), (name _killer)];
			[_str_3] remoteExec ["systemChat", 0, false];
		};
		if (((animationState _killed) == "ACE_AmovPercMstpScapWnonDnon") && {_killer in allPlayers}) then {
			// Remove 1 ticket per prisoner
			//[missionNamespace, -1] call BIS_fnc_respawnTickets;
			_str_4 = str text format ["%2 has killed %1, a captured prisoner.", (name _killed), (name _killer)];
			[_str_4] remoteExec ["systemChat", 0, false];
		};
		if (((side group _killed) isEqualTo (side group _killer)) && {_killed != _killer} && {_killer in allPlayers}) then {
			_str_5 = str text format ["%2 has teamkilled %1.", (name _killed), (name _killer)];
			[_str_5] remoteExec ["systemChat", 0, false];
		};
	};
}];