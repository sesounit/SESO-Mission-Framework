
#include "..\script_component.hpp"

private _SWIM_FASTER_ID = player addEventHandler ["AnimChanged", {
	params ["_unit", "_anim"];
	private _speedMultiplier = parseNumber (missionNamespace getVariable "SESO_setting_SwimSpeedMultiplier");
	private _totalSpeed = player getVariable ["SESO_totalSpeed", 1];
	if (((reverse _anim) find ["ws", (count _anim - 4)]) >= 1) then {_unit setAnimSpeedCoef (_totalSpeed * _speedMultiplier)} else {_unit setAnimSpeedCoef _totalSpeed};
}];
_SWIM_FASTER_ID;