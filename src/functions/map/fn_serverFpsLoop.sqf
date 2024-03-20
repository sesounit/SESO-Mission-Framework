/**
	Description: 
		Gets the server FPS and all the current units and updates a marker at the bottom left of the map.
        Originally from https://github.com/TheCoolerServer/tcs-framework/blob/master/tcs/base/fn_serverFpsLoop.sqf

	Parameters:
		None

	Returns:
		None
*/

SESO_var_serverFPSMarker = createMarker ["SESO_var_serverFPSMarker", [0, -500]];

while {true} do {
	private _fps = diag_fps;
	private _localUnitCount = {
		local _x;
	} count allUnits;
	private _localGroupCount = {
		local _x;
	} count allGroups;

	private _markerType = "mil_circle";
	private _markerColor = "ColorGreen";

	if (_fps < 30) then {
		_markerType = "mil_warning";
		_markerColor = "ColorYellow";
	};

	if (_fps < 15) then {
		_markerColor = "ColorRed";
	};

	SESO_var_serverFPSMarker setMarkerColor _markerColor;
	SESO_var_serverFPSMarker setMarkerType _markerType;
	SESO_var_serverFPSMarker setMarkerText format ["FPS: %1, %2 local groups, %3 local units", _fps, _localGroupCount, _localUnitCount];

	sleep 25;
};