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

// Make sure player is an Engineer to use Fortify tool
[{
	params ["_unit", "_object", "_cost"];

	private _case1 = if ( (_unit) getUnitTrait "Engineer" ) then {true}
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


// Rest of code only for Engineer player
if !(player getUnitTrait "Engineer") exitWith {};

_action = ["SESO_fortify_preset_switch","Switch Fortify Blueprint","\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",{""},{true}] call ace_interact_menu_fnc_createAction; 
[typeOf respawn_truck, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

_jungle_preset = [
	"SESO_fortify_jungle_preset",
	"Jungle Sandbags",	
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	DEFINE_PRESET("SESO_ww2_jungle_preset"),
	{true}
] call ace_interact_menu_fnc_createAction;

_desert_preset = [
	"SESO_fortify_desert_preset",
	"Desert Sandbags",	
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	DEFINE_PRESET("SESO_ww2_desert_preset"),
	{true}
] call ace_interact_menu_fnc_createAction;

_blockades_preset = [
	"SESO_fortify_blockades_preset",
	"Blockades",	
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	DEFINE_PRESET("SESO_ww2_blockades_preset"),
	{true}
] call ace_interact_menu_fnc_createAction;

_weapons_preset = [
	"SESO_fortify_weapons_preset",
	"Weapons",	
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	DEFINE_PRESET("SESO_ww2_weapons_preset"),
	{true}
] call ace_interact_menu_fnc_createAction;

_logistics_preset = [
	"SESO_fortify_logistics_preset",
	"Logistics",	
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",
	DEFINE_PRESET("SESO_ww2_logistics_preset"),
	{true}
] call ace_interact_menu_fnc_createAction;


{[
	typeOf respawn_truck,
	0,
	["ACE_MainActions","SESO_fortify_preset_switch"],
	_x
] call ace_interact_menu_fnc_addActionToClass;
} forEach [_jungle_preset,_blockades_preset,_weapons_preset,_logistics_preset];