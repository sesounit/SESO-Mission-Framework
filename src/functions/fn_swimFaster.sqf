params [["_speedMultiplier", 2.5]];
//systemChat ((str _speedMultiplier) + " outer");
private _SWIM_FASTER_ID = player addEventHandler ["AnimChanged", {
	params ["_unit", "_anim"];
	//systemChat ((str _speedMultiplier) + " inner");
	if (((reverse _anim) find ["ws", (count _anim - 4)]) >= 1) then {_unit setAnimSpeedCoef _speedMultiplier} else {_unit setAnimSpeedCoef 1};
}];
_SWIM_FASTER_ID;