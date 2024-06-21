/*
* Author: Dildo Sagbag
*
* Description:
* Immersive teleport to point script. Comes with a predefined set of point names, otherwise uses the display name of the point.
*
* Arguments:
* 0: Target point to teleport to. <OBJECT>
* 1: Caller unit who is to be teleported to the target.<OBJECT>
* 2: Time to wait until caller is teleported to target. Default 10 seconds  <NUMBER>
* 3: Whether to teleport all players to vehicles, excluding Zeus players. Default false. <BOOLEAN>
* 4: Whether to teleport all Zeuses to vehicles, excluding non-Zeus players.  Default false. <BOOLEAN>
*
* Return:
* None
*
* Examples:
* [bobs_car, bob] call SESO_fnc_teleportToPoint;
* [bobs_plane, alice, 20] call SESO_fnc_teleportToPoint;
* [bobs_tank, cool_guy, 1, false, true] call SESO_fnc_teleportToPoint;
* [bobs_party_bus, bob, 10, true, true] call SESO_fnc_teleportToPoint;
*
* Public: Yes
*/

#include "..\script_component.hpp"


params ["_target", "_caller", ["_targetDistance", 10], ["_teleportAllPlayers", false], ["_teleportAllZeus", false]];

if ((_teleportAllPlayers == true) or (_teleportAllZeus == true)) exitWith {
	private _zeus = [getAssignedCuratorUnit (allCurators select 0)];
	private _operatives = (call BIS_fnc_listPlayers) - _zeus;

	if (_teleportAllZeus == true) then {[_target,player,_targetDistance] remoteExec ["SESO_fnc_teleportToVehicle", _zeus]};
	if (_teleportAllPlayers == true) then {[_target,player,_targetDistance] remoteExec ["SESO_fnc_teleportToVehicle", _operatives]};
};

private _targetDisplayName = str _target;
switch (_targetDisplayName) do
{
	case "med_flag_end": {_targetDisplayName = "Medical Training Area"};
	case "log_flag_end": { _targetDisplayName = "Logistics Training Area"};
	case "cav_flag_end": { _targetDisplayName = "Cavalry Training Area"};
	case "inf_flag_end": { _targetDisplayName = "Infantry Training Area"};
	case "med_flag_start": { _targetDisplayName = "Career Center"};
	case "log_flag_start": { _targetDisplayName = "Career Center"};
	case "cav_flag_start": { _targetDisplayName = "Career Center"};
	case "inf_flag_start": { _targetDisplayName = "Career Center"};
	default {_targetDisplayName = [configFile >> "CfgVehicles" >> typeOf vehicle _target] call BIS_fnc_displayName};
};

//if (_target emptyPositions "cargo" <= 0)
///exitWith {
//	systemChat (format ["%1 is either full or unavailable. Please try again later.", _targetDisplayName]);
//};

// TODO: Calculate distance to travel to target for dynamic wait time
//_targetDistance = round (_caller distance _target);

_caller enableSimulation false;
cutText [format ["Moving out to %1...\n%2 seconds remaining",_targetDisplayName,_targetDistance], "BLACK OUT", 3];
0.1 fadeSound 0;
sleep 3;

for "_second" from _targetDistance to 0 step -1 do
{
	cutText [format ["Moving out to %1...\n%2 seconds remaining",_targetDisplayName,_second], "BLACK FADED"];
	sleep 1;
};

_caller setPosASL (getPosASL _target);
_caller enableSimulation true;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;


cutText [format ["Arrived to %1",_targetDisplayName], "BLACK IN", 5];
14 fadeSound 1;
