/*
 * Author: SGT.Brostrom.A
 * This function removes and recreates a given unit as a agent when in proximity.
 * Run this function in the object or unit init.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Example:
 * [this] call SESO_fnc_makeAgent
 *
 */

#include "..\script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _classname = typeOf _unit;
private _position   = getPosASL _unit;
private _vectorUp  = vectorUp _unit;
private _vectorDir = vectorDir _unit;
private _side      = side _unit;

deleteVehicle _unit;

_agent = createAgent [_classname, _position, [], 0, 'CAN_COLLIDE'];
_agent setPosASL _position;
_agent setVectorDirAndUp [_vectorDir, _vectorUp];

INFO_3("Agent", "Converted %1 (%2) to agent %3 (%2).", _unit, _classname, _agent);

