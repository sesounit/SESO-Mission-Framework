/**
	Description:
		Creates the cut grass action and adds it to the player's self-interact menu.
        https://github.com/TheCoolerServer/tcs-framework/blob/master/tcs/extra/fn_createCutGrassAction.sqf

	Parameters:
		None
	
	Returns:
		None
*/

#include "..\script_component.hpp"

private _cutGrassAction = [
	"cut-grass",
	"Cut grass",
	"",
	SESO_fnc_cutGrassAction,
	{stance player == "CROUCH"}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _cutGrassAction] call ace_interact_menu_fnc_addActionToObject;