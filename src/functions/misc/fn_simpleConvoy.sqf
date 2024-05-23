/*
* Author: Tova, modified by Dildo Sagbag
*
* Description:
* Improved version of TOV_fnc_simpleConvoy. Creates a convoy based off a group of vehicles. Once group is deleted, leader is out of the vehicle, or there are no waypoints, then the convoy is restored to normal settings.
* https://forums.bohemia.net/forums/topic/226608-simple-convoy-script-release/
*
* Arguments:
* 0: Group of AI-controlled vehicles to be in the convoy. Follows in the order of units first grouped to the leader. <GROUP>
* 1: Speed of the convoy. Default 50 km/h. <NUMBER>
* 2: Distance of separation between vehicles in convoy. Default 50 m. <NUMBER>
* 3: Push through combat. Default is false. <BOOLEAN>
*
* Return Value:
* None
*
* Example:
* [bobs_group] spawn SESO_fnc_simpleConvoy;
* [bobs_group, 30, 20] spawn SESO_fnc_simpleConvoy;
* [alices_company, 50, 40, true] spawn SESO_fnc_simpleConvoy;
*
* Public: Yes
*/

#include "..\script_component.hpp"

params ["_convoyGroup",["_convoySpeed",50],["_convoySeparation",50],["_pushThrough", false]];

if !(isServer) exitWith {};

private _convoyVehicles = vehicles select {group _x == _convoyGroup};
_convoyVehicles = _convoyVehicles - allPlayers;

if (_pushThrough) then {
	_convoyGroup enableAttack false;
	{
		_x setUnloadInCombat [false, false];
	}forEach _convoyVehicles;
};

private _previousFormation = formation _convoyGroup;
private _previousBehavior = combatBehaviour _convoyGroup;

_convoyGroup setFormation "COLUMN";
_convoyGroup setBehaviourStrong "SAFE";

{
	_x limitSpeed _convoySpeed*1.15;
	_x setConvoySeparation _convoySeparation;
}forEach _convoyVehicles;

(vehicle leader _convoyGroup) limitSpeed _convoySpeed;

while {sleep 5; (!isNull _convoyGroup) or (vehicle (leader _convoyGroup) != (leader _convoyGroup)) or (count (waypoints _convoyGroup) == currentWaypoint _convoyGroup)} do {

	{
		if ((speed vehicle _x < 5) && (_pushThrough || (behaviour _x != "COMBAT"))) then {
			vehicle _x doFollow (leader _convoyGroup);
		};	
	}forEach (units _convoyGroup)-(crew (vehicle (leader _convoyGroup)));

	{
		_x setConvoySeparation _convoySeparation;
	}forEach _convoyVehicles;
};

{
	_x limitSpeed -1;
	_x setUnloadInCombat [true, false]
} forEach _convoyVehicles;

_convoyGroup setFormation _previousFormation;
_convoyGroup setBehaviourStrong _previousBehavior;

_convoyGroup enableAttack true;