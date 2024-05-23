
#include "..\script_component.hpp"

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

// Make sure player is an Engineer AND has enough sandbags to use Fortify tool
[{
	params ["_unit", "_object", "_cost"];

	// Define material
	private _materialClassname = "ACE_Sandbag_empty";
	private _materialDisplayName = "Sandbag";
	if (_object isKindOf "StaticWeapon") then {_materialClassname = "ACE_SpareBarrel"; _materialDisplayName = "Spare Barrel"};
	

	// Get count of materials on player
	private _totalMaterials = ((itemsWithMagazines _unit) select {_x isEqualTo _materialClassname});
	private _totalMaterialsCount = count _totalMaterials;

	// Check cases
	private _exceptions = "";
	private _case1 = if ( [_unit] call ace_common_fnc_isEngineer ) then {true}
		else {_exceptions = _exceptions + "You're not an engineer.\n";false};
	private _case2 = if (_totalMaterialsCount >= _cost) then {true}
		else {_exceptions = _exceptions + (format ["You do not have enough %1s. You have %2 %3s, you need %4 %5s to build this.\n", toLowerANSI _materialDisplayName, _totalMaterialsCount, toLowerANSI _materialDisplayName, _cost, toLowerANSI _materialDisplayName]);false};

	// Report any exceptions
	if (count _exceptions > 0) then {hint _exceptions};

	// Check cases
	(_case1 AND _case2);
}] call ace_fortify_fnc_addDeployHandler;

// Remove items from building, useful for extra ammo boxes
["acex_fortify_objectPlaced", {
	params ["_unit", "_side", "_objectPlaced"];
	clearMagazineCargoGlobal _objectPlaced;
	clearItemCargoGlobal _objectPlaced;
	clearWeaponCargoGlobal _objectPlaced;
	clearBackpackCargoGlobal _objectPlaced;
}] call CBA_fnc_addEventHandler;

// Spend materials into buildings
["ace_fortify_deployFinished", {
	params ["_objectList", "_elapsedTime", "_totalTime", "_errorCode"];

	// Define material
	private _materialClassname = "ACE_Sandbag_empty";
	private _materialDisplayName = "Sandbag";
	if ((_objectList select 2) isKindOf "StaticWeapon") then {_materialClassname = "ACE_SpareBarrel"; _materialDisplayName = "Spare Barrel"};

	// Remove items
	private _cost = _objectList select 6;
	for "_i" from 1 to _cost do {_player removeItem _materialClassname};

	// Report materials numbers
	private _unit = _objectList select 0;
	private _totalSandbags = ((itemsWithMagazines _unit) select {_x isEqualTo "ACE_Sandbag_empty"});
	private _totalSandbagsCount = count _totalSandbags;
	private _totalBarrels = ((itemsWithMagazines _unit) select {_x isEqualTo "ACE_SpareBarrel"});
	private _totalBarrelsCount = count _totalBarrels;

	private _s = format ["Sandbags: %1 remaining\n Spare Barrels: %2 remaining", _totalSandbagsCount, _totalBarrelsCount];
	hint _s;

}] call CBA_fnc_addEventHandler;

// Refund materials from buildings
["acex_fortify_objectDeleted", {
	params ["_player", "_side", "_objectDeleted"];

	// Define material
	private _materialClassname = "ACE_Sandbag_empty";

	// Get the cost of deleted object
	private _objectDeletedClassname = typeOf _objectDeleted;
	private _fortifyArray = getArray (missionConfigFile >> "ACEX_Fortify_Presets" >> "SESO_green_combo_preset" >> "objects");
	private _cost = 0;
	{if ((_x select 0) isEqualTo _objectDeletedClassname) then {_cost = (_x select 1)}}forEach _fortifyArray;

	// Remove or drop the materials
	// Do not refund materials if this is a turret
	if (!(_objectDeletedClassname isKindOf "StaticWeapon")) then {
		if ((_player canAdd [_materialClassname, _cost])) then {
			for "_i" from 1 to _cost do {_player addItem _materialClassname};
			} else {
				private _groundHolder = "GroundWeaponHolder_Scripted" createVehicle (getPosATL _objectDeleted);
				_groundHolder addItemCargoGlobal [_materialClassname, _cost];
				systemChat format ["Not enough space, dropping %1 materials on the ground.", _cost];
			};
	};

	// Report materials numbers
	private _unit = _player;
	private _totalSandbags = ((itemsWithMagazines _unit) select {_x isEqualTo "ACE_Sandbag_empty"});
	private _totalSandbagsCount = count _totalSandbags;
	private _totalBarrels = ((itemsWithMagazines _unit) select {_x isEqualTo "ACE_SpareBarrel"});
	private _totalBarrelsCount = count _totalBarrels;

	private _s = format ["Sandbags: %1 remaining\n Spare Barrels: %2 remaining", _totalSandbagsCount, _totalBarrelsCount];
	hint _s;

}] call CBA_fnc_addEventHandler;

//[["Land_HBarrier_01_tower_green_F",45,"SESO_defensive_preset"],["Land_BagBunker_01_large_green_F",55,"SESO_defensive_preset"],["Land_BagBunker_01_small_green_F",35,"SESO_defensive_preset"],["Land_CzechHedgehog_01_old_F",3,"SESO_defensive_preset"],["Land_BagFence_01_round_green_F",5,"SESO_defensive_preset"],["Land_BagFence_01_long_green_F",5,"SESO_defensive_preset"],["I_G_HMG_02_high_F",45,"SESO_offensive_preset"],["CUP_B_SPG9_CDF",45,"SESO_offensive_preset"],["LIB_leFH18_AT",45,"SESO_offensive_preset"],["ACE_Wheel",60,"SESO_logistics_preset"],["ACE_Track",60,"SESO_logistics_preset"],["Land_CanisterFuel_F",60,"SESO_logistics_preset"],["Box_NATO_Support_F",2,"SESO_logistics_preset"],["Land_Plank_01_4m_F",5,"SESO_climbing_preset"],["Land_Plank_01_8m_F",10,"SESO_climbing_preset"]]

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