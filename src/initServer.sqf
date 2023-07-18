#define DAY		((dayTime >= 7.00) && (dayTime <= 16.00))
#define NIGHT 	!DAY

// Generate Map Markers
{
	[_x, true] call zen_building_markers_fnc_set;

}forEach ((getMissionLayerEntities "Marked Buildings") select 0);


// ZBE Caching for AI performance
[] spawn {
	{
		_x setVariable ["zbe_cacheDisabled",true];

	}forEach ((getMissionLayerEntities "Respawn Vehicles") select 0);
};
[600,-1,false,100,600,600] execVM "zbe_cache\main.sqf";

// Dynamic Group Manager
// Initializes the Dynamic Groups framework and groups led by a player at mission start will be registered
["Initialize", [true]] call BIS_fnc_dynamicGroups;

/// Initialize the arsenals
[] call SESO_fnc_initArsenalServer;

waitUntil { cba_missiontime > 0 };

// Set tickets
[missionNamespace, 5] call BIS_fnc_respawnTickets;

// Initialize custom map locations
//[] call SESO_fnc_defineMapLocationsServer;

// Draw Borders
//[] call SESO_fnc_drawLineServer;

// Generate Ammo
[] spawn {
	{
		[_x, arsenal_0] call SESO_fnc_generateAmmo;

	}forEach ((getMissionLayerEntities "Ammo") select 0);
};
