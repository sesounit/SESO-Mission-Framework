/*
* Author: Dildo Sagbag
*
* Description:
* Draws (poly)lines connecting between markers placed in the eden editor.
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

{
	private _markers = _x;
	private _border_points = [];
	private _firstMarker = (_markers select 0) call BIS_fnc_markerToString;
	//_lastPoint = SESO_var_border select ((count SESO_var_border) - 1);

	{
		private _markerPosition = getMarkerPos _x;
		private _markerPositionX = _markerPosition select 0;
		private _markerPositionY = _markerPosition select 1;
		_border_points pushBack _markerPositionX;
		_border_points pushBack _markerPositionY;
		deleteMarkerLocal _x;
	}forEach _markers;

	private _firstMarkerLocal = _firstMarker call BIS_fnc_stringToMarkerLocal;
	_firstMarkerLocal setMarkerShapeLocal "polyline";
	_firstMarkerLocal setMarkerPolyline _border_points;

}forEach SESO_var_border;
