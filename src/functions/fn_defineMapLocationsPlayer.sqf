/*
* Author: Dildo Sagbag
*
* Description:
* Hides most starting map locations and replace them with user placed locations designated by area markers.
* To use this, make an entity layer called "Map Locations", and fill it with area markers covering a particular part of the map. Name the area marker (not variable name) with the name of your location.
* The color of the area marker will change the type of location. The following table is the full list of colors and their associated location types.
* Orange	-		Village
* Pink		-		City
* Red		-		Capital City
* Khaki		-		Local
* Black		-		Hill Marker
* Green		-		Tree Marker
* Blue		-		Body of Water
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: Yes
*/

if !(hasInterface) exitWith {};

// Hide all starting locations
private _allLocationTypes = ["Name","NameCity","NameVillage","Flag","Hill","NameCityCapital","VegetationBroadleaf"];

// TODO: Search for all map locations in CfgLocationTypes and add them to _allLocationTypes
//"_allLocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes");

{
	private _editableLocation = createLocation [_x];
	_editableLocation setType "Invisible";
}forEach nearestLocations [[0,0,0], _allLocationTypes, 10000];

{
	private _locationName = markerText _x;
	private _locationPosition = markerPos _x;
	private _locationSize = markerSize _x;
	private _locationType = "Name";
	switch (markerColor _x) do {
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsNameVillageColor"): {_locationType = "NameVillage"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsNameCityColor"): {_locationType = "NameCity"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsNameCityCapitalColor"): {_locationType = "NameCityCapital"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsNameLocalColor"): {_locationType = "NameLocal"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsHillColor"): {_locationType = "Hill"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsVegetationFirColor"): {_locationType = "VegetationFir"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsVegetationPalmColor"): {_locationType = "VegetationPalm"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsNameMarineColor"): {_locationType = "NameMarine"};
		case (missionNamespace getVariable "SESO_setting_CustomMapLocationsRockAreaColor"): {_locationType = "RockArea"};
		default {_locationType = "Name"};
	};
	deleteMarkerLocal (_x);
	private _locationItself = createLocation [_locationType, _locationPosition, _locationSize select 0, _locationSize select 1];
	_locationItself setText _locationName;
}forEach SESO_var_newMapLocationMarkers