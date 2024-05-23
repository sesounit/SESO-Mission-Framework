/*
* Author: Dildo Sagbag
*
* Description:
* Intro text scene from Psychopomp Campaign. Called after SESO_fnc_introCamera
*
* Arguments:
* 0: Name of the campaign or operation to display <STRING>
* 1: Font to use on the intro text <STRING>
* 2: Hexadecimal color of the title text. Default white. <STRING>
* 3: Hexadecimal color of the subtitle text. Default white. <STRING>
*
* Return Value:
* Success? <BOOLEAN>
* 
* Example:
* ["Psychopomp Campaign", "Caveat"] spawn SESO_fnc_introText;
* ["Operation Little Heads", "Bitstream", "#FF72C2"] spawn SESO_fnc_introText;
* ["Operation Sahara", "LCD14", "#FF72C2", "#1A9BFF"] spawn SESO_fnc_introText;
*
* Public: Yes
*/

#include "..\script_component.hpp"

params ["_campaignName","_font", ["_titleColor", ""], ["_subtitleColor", ""]];

// Intro Text
private _nearestLocations = (nearestLocations [player, ["Airport","NameLocal","NameVillage","NameCity","NameCityCapital","NameMarine"],500]);
private _nearestLocationName = "";
private _cardinalDirections = ["North", "Northeast", "East", "Southeast", "South", "Southwest", "West", "Northwest", "North"];
if (_nearestLocations isEqualTo [] ) then {
	private _nearestLocation = (nearestLocations [player, ["Airport","NameLocal","NameVillage","NameCity","NameCityCapital","NameMarine"],20000]) select 0;
	private _direction = ((locationPosition _nearestLocation) getDir (getPosATL player));
	private _cardinalDirection = _cardinalDirections select (([_direction, 45] call BIS_fnc_roundDir) /45);
	_nearestLocationName = _cardinalDirection + " of " + text _nearestLocation;

} else {
	_nearestLocationName = text (_nearestLocations select 0);
};

// Current Date
private _currentDate = (str (date select 0) + "/") + (str (date select 1) + "/") + (str (date select 2));

[
	[
		[_campaignName, //briefingName,
		//"Psychopomp Campaign",
		format ["shadow = '1' size = '1.5' font='%1'", _font],_titleColor], 

		["", "<br/>"], // line break 

		[_nearestLocationName,
		format ["shadow = '1' size = '1.5' font='%1'", _font], _subtitleColor], 

		["   ", format ["font='%1'", _font]], // line break 

		[_currentDate,
		format ["shadow = '1' size = '1.5' font='%1'", _font], _subtitleColor]//,

		// TODO: Option for mission text based off the diary records
		//["", "<br/>"], // line break 

		//["Mission: " + str(_missionText),
		//"shadow = '1' size = '0.5' font='Zeppelin33'", "#FFECD1"]

	],
	0,
	0.2
] spawn BIS_fnc_typeText2;

private _sentence = _nearestLocationName + _campaignName + _currentDate;
sleep ((count (toArray _sentence)) * 0.09);
true;