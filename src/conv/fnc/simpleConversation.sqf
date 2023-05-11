/*
Name: simpleConversation
Author: IndeedPete
Purpose: Wrapper function to create a simple conversation from several simple sentences (IP_fnc_simpleSentence).
----------
Parameters:
_speakers - ARRAY OF OBJECTS: Units that alternately say the _sentences. - [player, SomeGuy]
_sentences - ARAAY OF STRINGS: Sentences the _speakers should say. Every Xth sentence will be spoken by the Xth speaker. - ["Hello world!", "Fuck off!"]
_wichChat - STRING (OPTIONAL): Which way of communication should be used. Available chats: "SIDE", "GROUP", "VEHICLE", "CUT" or "DIRECT" - "DIRECT" - DEFAULT: "SIDE"
_isCutscene - BOOL (OPTIONAL): Cutscene mode: If set to true cinema borders will show up and the conversation can be skipped by the player pressing space. - true - DEFAULT: false
----------
Requires:
IP_fnc_simpleSentence
*/

if (count _this < 2) exitWith {false};

private ["_speakers", "_sentences", "_whichChat", "_isCutscene", "_count", "_ehSkip"];
_speakers = [_this, 0, [], [[]]] call BIS_fnc_param;
_sentences = [_this, 1, [], [[]]] call BIS_fnc_param;
_whichChat = [_this, 2, "SIDE", [""]] call BIS_fnc_param;
_isCutscene = [_this, 3, false, [true]] call BIS_fnc_param;
_count = count _speakers;

if (_isCutscene) then {
	disableSerialization;
	IP_Cutscene_Skip = false;
	
	_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
	[
		"KeyDown",
		"
			if (_this select 1 == 57) then
			{
				if (IP_Cutscene_Skip) exitWith {};

				playSound ['click',true];

				IP_Cutscene_Skip = true;
			};

			if !((_this select 1) in (actionKeys 'PersonView' + [1])) then {true};
		"
	];
	
	uiNamespace setVariable ["IP_Cutscene_ehSkip", _ehSkip];
	[0] call BIS_fnc_cinemaBorder;
};

for "_i" from 0 to ((count _sentences) - 1) do {
	_speaker = _speakers select (_i mod _count);
	_sentence = _sentences select _i;
	[_speaker, _sentence, _whichChat] call IP_fnc_simpleSentence;
	if ((!isNil "IP_Cutscene_Skip") && {IP_Cutscene_Skip}) exitWith {};
};

if (_isCutscene) then {
	[1] call BIS_fnc_cinemaBorder;
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', (uiNamespace getVariable "IP_Cutscene_ehSkip")];
	uiNamespace setVariable ["IP_Cutscene_ehSkip", nil];
	IP_Cutscene_Skip = nil;
};