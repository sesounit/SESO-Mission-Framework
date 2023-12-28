#define DEFINE_PRESET(PRESET)\
{\
	[{\
		[\
			"Switching Fortify Blueprints",\
			3,\
			{true},\
			{\
				_currentBudget = [playerSide] call ace_fortify_fnc_getBudget;\
\
				[\
					playerSide,\
					[playerSide] call ace_fortify_fnc_getBudget,\
					[PRESET] call ace_fortify_fnc_getPlaceableSet\
				] remoteExec  ["ace_fortify_fnc_registerObjects", 2];\
			}\
		] call CBA_fnc_progressBar;\
	}] call CBA_fnc_execNextFrame;\
}\

#define ENGINEER_CHECK params ["_target", "_player"]; if ([_player] call ace_common_fnc_isEngineer) then {true} else {false}

params ["_switcherObject"];

// Make sure player is an Engineer to use Fortify tool
[{
	params ["_unit", "_object", "_cost"];

	private _case1 = if ( [_unit] call ace_common_fnc_isEngineer ) then {true}
		else {hint "You're not an engineer";false};

	_case1;
}] call ace_fortify_fnc_addDeployHandler;

//Add construction noise when building
// TODO: Add the noise when deploying and continuing fortify!
//["acex_fortify_onDeployStart", {
//	params ["_unit", "_object", "_cost"];
//
//	private _construction_soundsource = 'Land_HelipadEmpty_F' createVehicle position _object;
//	_construction_soundsource attachTo [_object,[0,0,0]];
//	[_construction_soundsource,["Oil_pump",100,1]] remoteExec ['playSound', 0];
//}] call CBA_fnc_addEventHandler;
//
//["ace_fortify_deployFinished", {deleteVehicle _construction_soundsource;}] call CBA_fnc_addEventHandler;
//["ace_fortify_deployCanceled", {deleteVehicle _construction_soundsource;}] call CBA_fnc_addEventHandler;