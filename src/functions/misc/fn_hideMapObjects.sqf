/*
* Author: Dildo Sagbag
*
* Description:
* Hides map objects around a point
*
* Arguments:
* 0: Center to hide map objects around <OBJECT> or <ARRAY>
* 1: Array of objects to remove, refer to MAP_TYPES_* below for examples <ARRAY>
* 2: Distance around the center to look for map objects <NUMBER>
*
* Return Value:
* None
*
* Examples:
* [bob, ["BUILDING"], 500] call SESO_fnc_hideMapObjects
* [[100,100,0], ["TREE","SMALL TREE","BUSH"], 500] call SESO_fnc_hideMapObjects
*
* Public: Yes
*/

#include "..\script_component.hpp"


#define MAP_TYPES_BUILDING			["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
#define MAP_TYPES_VEGETATION		["TREE","SMALL TREE","BUSH"]
#define MAP_TYPES_WALL				["WALL","FENCE"]
#define MAP_TYPES_MISC				["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]

#define CATEGORY_COMP				[MAP_TYPES_BUILDING,MAP_TYPES_WALL,MAP_TYPES_VEGETATION,MAP_TYPES_MISC]

params ["_subject","_objectTypes","_radius"];

//case _objectTypes do {
//	case "MAP_TYPES_BUILDING": {_objectTypes = MAP_TYPES_BUILDING};
//	case "MAP_TYPES_WALL": {_objectTypes = MAP_TYPES_WALL};
//	case "MAP_TYPES_VEGETATION": {_objectTypes = MAP_TYPES_VEGETATION};
//	case "MAP_TYPES_MISC": {_objectTypes = MAP_TYPES_MISC};
//};

private _found = (nearestTerrainObjects [_subject,_objectTypes,_radius,false,true]) + (nearestObjects [_subject,_objectTypes,_radius,true]);

{
	 _x allowDamage false; [_x, true] remoteExec ["hideObjectGlobal", 2];
}forEach _found;