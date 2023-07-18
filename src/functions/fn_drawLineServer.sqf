/*
* Author: Dildo Sagbag
*
* Description:
* Initializes drawLine
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

private _borderLayers = [];
{
	_borderLayers pushBack _x;
}forEach (getMissionLayers select { ((toLower(_x) find "line") >= 0) });

if (count _borderLayers <= 0) exitWith { diag_log "ERROR: No line layer was found"; systemChat diag_log "ERROR: No line layer was found"; };

SESO_var_border = [];
{
	SESO_var_border pushBack ((getMissionLayerEntities _x) select 1);
}forEach _borderLayers;

if (isNil "SESO_var_border") exitWith { diag_log "ERROR: SESO_var_border is null"; systemChat "ERROR: SESO_var_border is null"; };

publicVariable "SESO_var_border";

[] remoteExecCall ["SESO_fnc_drawLinePlayer",0,true];