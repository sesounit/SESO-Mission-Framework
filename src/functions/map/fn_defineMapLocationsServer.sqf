/*
* Author: Dildo Sagbag
*
* Description:
* Initializes defineMapLocationsPlayer.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: Yes
*/

if !(isServer) exitWith {};

params ["_entityLayerName"];

// Generate Map Locations
SESO_var_newMapLocationMarkers = (getMissionLayerEntities _entityLayerName) select 1;

publicVariable "SESO_var_newMapLocationMarkers";
[] remoteExecCall ["SESO_fnc_defineMapLocationsPlayer",0,true];