/*
Name: ambientChatterKB
Author: IndeedPete
Purpose: Player-centred radio chatter. If player is close, defined NPCs will throw a random sentence via kbTell.
----------
Parameters:
_receiver - OBJECT: Unit that receives the _sentences. - player
_topic - STRING: Topic needed for kbTell. - "MyTopic"
_sentences - ARRAY OF STRINGS: Sentence classes the NPCs will randomly pick from, defined in .bikb. - ["MySentence1", "MySentence2"]
_bikb - STRING (OPTIONAL): Path to the .bikb which contains the _sentence. - "mySentences.bikb" - DEFAULT: "sentences.bikb"
_subs - BOOLEAN (OPTIONAL): Show subtitles. - false - DEFAULT: true
_radius - NUMBER (OPTIONAL): Radius in metres around the _receiver in which random sentences should be triggered. - 10 - DEFAULT: 5
_cycle - NUMBER (OPTIONAL): Interval in seconds in which the script checks for near-by NPCs. - 3 - DEFAULT: 1
_sides - ARAAY OF SIDES: Sides of NPCs who are allowed to speak to the _receiver. - [west, east] - DEFAULT: [civilian, (side _receiver)]
----------
Requires:
IP_fnc_simpleSentenceKB
.bikb - File that contains class sentences. (See BI Wiki / documentation on the kbTell system.)
*/

private "_handle";

_handle = _this spawn {
	private ["_receiver", "_topic", "_sentences", "_bikb", "_subs", "_radius", "_cycle", "_sides", "_oldNPCs", "_NPCs"];
	_receiver = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	if (!([_receiver] call SESO_fnc_canTalk) OR ((!isNil "IP_AmbientChatter_Running") && {IP_AmbientChatter_Running})) exitWith {false};
	IP_AmbientChatter_Running = true;

	_topic = [_this, 1, "", [""]] call BIS_fnc_param;
	_sentences = [_this, 2, [], [[]]] call BIS_fnc_param;
	_bikb = [_this, 3, "sentences.bikb", [""]] call BIS_fnc_param;
	_subs = [_this, 4, true, [false]] call BIS_fnc_param;
	_radius = [_this, 5, 5, [0]] call BIS_fnc_param;
	_cycle = [_this, 6, 1, [0]] call BIS_fnc_param;
	_sides = [_this, 7, [civilian, (side _receiver)], [[]]] call BIS_fnc_param;

	_oldNPCs = [];
	while {([_receiver] call SESO_fnc_canTalk)} do {
		_NPCs = [];
		_newNPCs = nearestObjects [_receiver, ["Man"], _radius];
		
		{
			_vis = (lineIntersects [eyePos player, eyePos _x, player, _x]) OR (terrainIntersect [eyePos player, eyePos _x]);
			if (([ _x] call SESO_fnc_canTalk) && (_x != _receiver) && !(_x in _oldNPCs) && (_x getVariable ["IP_AmbientChatter", false]) && (side _x in _sides) && (vehicle _x == _x) && !_vis) then {
				_NPCs pushBack _x;
			};
		} forEach _newNPCs;
		
		if ((count _NPCs > 0) && {(isNil "IP_SimpleSentence_Talking") OR {!IP_SimpleSentence_Talking}}) then {
			_speaker = _NPCs call BIS_fnc_selectRandom;
			_sentences = if ((count(_speaker getVariable ["IP_AmbientSentences", []])) > 0) then {(_speaker getVariable "IP_AmbientSentences")} else {_sentences};
			
			if (count _sentences > 0) then {
				_sentence = _sentences call BIS_fnc_selectRandom;
				[_speaker, _receiver, _topic, _sentence, "DIRECT", _bikb, _subs] call IP_fnc_simpleSentenceKB;
			};
		};
		
		_oldNPCs = _newNPCs;
		sleep _cycle;
	};
	
	IP_AmbientChatter_Running = false;
};

_handle
