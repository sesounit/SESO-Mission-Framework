/**
	Description:
		ACE action handler that plays an animation and places the clear cutter module where the player is.
        https://github.com/TheCoolerServer/tcs-framework/blob/master/tcs/extra/fn_cutGrassAction.sqf

	Parameters: 
		None

	Returns:
		None
*/

SESO_var_cutGrassAnimDone = false;

private _animEH = player addEventHandler ["AnimDone", {
	if (_this select 1 == "AinvPknlMstpSnonWnonDr_medic2") then {
		SESO_var_cutGrassAnimDone = true;
	};
}];

player playMove "AinvPknlMstpSnonWnonDr_medic2";




[{SESO_var_cutGrassAnimDone}, {
	params ["_animEH"];

	createVehicle ["ClutterCutter_small_EP1", [getposATL player, 1, getDir player] call BIS_fnc_relPos, [], 0, "CAN_COLLIDE"];
	player removeEventHandler ["AnimDone", _animEH];

	SESO_var_cutGrassAnimDone = false;
}, _animEH] call CBA_fnc_waitUntilAndExecute;