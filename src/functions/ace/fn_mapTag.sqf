
#include "..\script_component.hpp"

if !(isServer) exitWith {};
params ["_tagObject", "_texture", "_tagAttachedTo", "_unitThatCreated"];

private _debug = false;
if (_debug) then {
    systemChat format ["tag object: %1, texture string: %2, attached to: %3, creator: %4.", _tagObject, _texture, _tagAttachedTo, name _unitThatCreated];
    _strArray = _texture splitString "\.";
    systemChat format ["color in string: %1", _strArray select 6];
};

if (((_tagAttachedTo isKindOf "Static") || (isTouchingGround _unitThatCreated)) && (alive _unitThatCreated)) then {
    private _markerPos = getPosASL _unitThatCreated;
    private _namePlayer = name _unitThatCreated;
    private _markerName = format ["marker_%1_%2", _namePlayer, markerNumber+1];
    markerNumber = markerNumber+1;
    private _marker = createMarkerLocal [_markerName, _markerPos];
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
