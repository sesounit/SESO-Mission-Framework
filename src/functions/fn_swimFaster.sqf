
private _SWIM_FASTER_ID = player addEventHandler ["AnimChanged", {
	params ["_unit", "_anim"];
	if (((reverse _anim) find ["ws", (count _anim - 4)]) >= 1) then {_unit setAnimSpeedCoef 3} else {_unit setAnimSpeedCoef 1};
}];
_SWIM_FASTER_ID;