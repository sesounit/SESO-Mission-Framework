
#include "..\script_component.hpp"

if !(isServer) exitWith {};
params ["_tagObject", "_texture", "_tagAttachedTo", "_unitThatCreated"];

if (((_tagAttachedTo isKindOf "Static") || (isTouchingGround _unitThatCreated)) && (alive _unitThatCreated)) then {
    private _markerPos = getPosASL _tagObject;
    private _namePlayer = name _unitThatCreated;
    private _markerName = format ["_USER_DEFINED_marker_%1_%2", _namePlayer, markerNumber+1];
    // TODO: Add number text next to tag marker
    //private _markerText = format ["T" + markerNumber];
    markerNumber = markerNumber+1;
    private _marker = createMarkerLocal [_markerName, _markerPos, 0, _unitThatCreated];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_dot";

    _markerColor = switch (true) do {
        case (["black", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorBlack"};
        case (["red", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorRed"};
        case (["green", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorGreen"};
        case (["blue", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorBlue"};
        case (["white", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorWhite"};
        case (["yellow", _texture] call BIS_fnc_inString): {_marker setMarkerColor "ColorYellow"};
    };
};
