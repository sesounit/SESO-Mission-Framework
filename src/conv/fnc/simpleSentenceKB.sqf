/*
Name: simpleSentenceKB
Author: IndeedPete
Purpose: Plays speech by kbTell; shows text in simple sentence box if defined properly.
----------
Parameters:
_speaker - OBJECT: Unit that should say the _sentence. - player
_receiver - OBJECT: Unit that should say the _sentence. - player
_topic - STRING: Topic the _sentence is part of. - "MyTopic"
_sentence - STRING: Class name defined in .bikb of the _sentence the _speaker should say. - "Hello world!"
_wichChat - STRING (OPTIONAL): Which way of communication should be used for showing the text. Available chats: "SIDE", "GROUP", "VEHICLE", "CUT" or "DIRECT" - "DIRECT" - DEFAULT: "SIDE"
_bikb - STRING (OPTIONAL): Path to the .bikb which contains the _sentence. - "mySentences.bikb" - DEFAULT: "sentences.bikb"
_subs - BOOLEAN (OPTIONAL): Show subtitles. - false - DEFAULT: true
_kbTellParams - ARRAY (OPTIONAL): Additional parameters for the kbTell command. (See BI Wiki on "kbTell" for details.) - [] - DEFAULT: []
_forceRadio - BOOLEAN (OPTIONAL): Forces the kbTell command to use the radio (contrary to automatically determined way of communication). - true - DEFAULT: false
----------
Requires:
Dialog "IP_DLG_SIMPLESENTENCE"
.jpg - "conv\img\defaultAvatar.jpg"
.bikb - File that contains class sentences. (See BI Wiki / documentation on the kbTell system.)
*/

#define TELL if (count _kbTellParams == 0) then {_speaker kbTell [_receiver, _topic, _sentence]} else { _speaker kbTell [_receiver, _topic, _sentence, _kbTellParams, _forceRadio]};
#define WAIT waitUntil {_speaker kbWasSaid [_receiver, _topic, _sentence, 1]};

private ["_speaker", "_receiver", "_topic", "_sentence", "_bikb", "_subs", "_kbTellParams", "_forceRadio", "_liveFeed", "_size", "_sentenceText", "_text"];
_speaker = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if (!([_speaker] call SESO_fnc_canTalk)) exitWith {false};
IP_SimpleSentence_Talking = true;

_receiver = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_topic = [_this, 2, "", [""]] call BIS_fnc_param;
_sentence = [_this, 3, "", [""]] call BIS_fnc_param;
_wichChat = toUpper([_this, 4, "SIDE", [""]] call BIS_fnc_param);
_bikb = [_this, 5, "sentences.bikb", [""]] call BIS_fnc_param;
_subs = [_this, 6, true, [false]] call BIS_fnc_param;
_kbTellParams = [_this, 7, [], [[]]] call BIS_fnc_param;
_forceRadio = [_this, 8, false, [true]] call BIS_fnc_param;

_liveFeed = _speaker getVariable ["IP_LiveFeed", false];
_size = str(1);
_sentenceText = if (isText(missionConfigFile >> "Sentences" >> _sentence >> "customText")) then {(getText(missionConfigFile >> "Sentences" >> _sentence >> "customText"))} else {""};

if (!(_speaker kbHasTopic _topic)) then {_speaker kbAddTopic [_topic, _bikb, "", ""]};

if (_sentenceText != "") then {
	_text = switch (_wichChat) do {
		case "SIDE": {
			_groupID = groupID (group _speaker);
			player createDiarySubject ["ConvLog", "Conversation Log"];
			player createDiaryRecord ["ConvLog", [_groupID, _sentenceText]];
			_str = "<t size=" + _size + " color='#58D3F7'>" + _groupID + ": " + _sentenceText + "</t>";
			_str
		};
		
		case "GROUP": {
			_name = name _speaker;
			player createDiarySubject ["ConvLog", "Conversation Log"];
			player createDiaryRecord ["ConvLog", [_name, _sentenceText]];
			_str = "<t size=" + _size + " color='#01DF3A'>" + _name + ": " + _sentenceText + "</t>";
			_str
		};
		
		case "VEHICLE": {
			private "_role";
			_roleArr = assignedVehicleRole _speaker;
			if (count _roleArr > 0) then {_role = _roleArr select 0} else {_role = name _speaker};
			player createDiarySubject ["ConvLog", "Conversation Log"];
			player createDiaryRecord ["ConvLog", [_role, _sentenceText]];
			_str = "<t size=" + _size + " color='#00FF00'>" + _role + ": " + _sentenceText + "</t>";
			_str
		};
		
		case "CUT": {
			_name = name _speaker;
			_str = _name + ": " + _sentenceText;
			_str
		};
		
		case "DIRECT": {
			_name = name _speaker;
			player createDiarySubject ["ConvLog", "Conversation Log"];
			player createDiaryRecord ["ConvLog", [_name, _sentenceText]];
			_str = "<t size=" + _size + " >" +_name + ": " + _sentenceText;
			_str
		};
		
		case "GLOBAL": {
			private "_factionName";
			_faction = _speaker getVariable ["IP_Faction", "Unknown"];
			_factionName = getText(missionConfigFile >> "Factions" >> _faction >> "displayNameShort");
			if (_factionName == "") then {_factionName = str(side _speaker)};
			_groupID = groupID (group _speaker);
			player createDiarySubject ["ConvLog", "Conversation Log"];
			player createDiaryRecord ["ConvLog", [(_factionName + " " + _groupID), _sentenceText]];
			_str = "<t size=" + _size + " color='#BDBDBD'>" + _factionName + " " + _groupID + ": " + _sentenceText + "</t>";
			_str
		};
		
		default {format ["IP_fnc_simpleSentence:<br/>%1 not recognized!", _wichChat]};
	};
	if (isPlayer _speaker) then {_text = "(Player) " + _text};
} else {
	_subs = false;
};

if (_subs) then {
	42 cutRsc ["IP_DLG_SIMPLESENTENCE", "PLAIN"]; 
	((uiNamespace getVariable "DLG_SimpleSentence") displayCtrl 1100) ctrlSetStructuredText (parseText _text);

	if (_liveFeed && {(vehicle _speaker) == _speaker}) then {
		_animState = animationState _speaker;
		_animStateChars = toArray _animState;
		_animP = toUpper (toString [_animStateChars select 5, _animStateChars select 6, _aniMStateChars select 7]);		
		_attachToValues = switch (_animP) do {
			case "ERC": {[0, 1, 1.7]};
			case "KNL": {[0, 1.25, 1]};
			case "PNE": {[0, 1.5, 0.25]};
			default {[0, 1, 1.7]};
		};
			
		_camera = "camera" camCreate (getPos _speaker);
		_camera camPrepareTarget _speaker;
		_camera camPrepareFOV 0.2;
		_camera attachTo [_speaker, _attachToValues];		
		_camera camCommitPrepared 0.03;
		_camera cameraEffect ["INTERNAL", "BACK", "camrender0"];
		
		TELL
		WAIT
		
		player cameraEffect ["terminate", "back"];
		camDestroy _camera;
	} else {
		_picture = _speaker getVariable ["IP_Avatar", "src\conv\img\defaultAvatar.jpg"];
		((uiNamespace getVariable "DLG_SimpleSentence") displayCtrl 1200) ctrlSetText _picture;
		
		TELL
		WAIT
	};

	42 cutText ["", "PLAIN"];
} else {
	TELL
	WAIT
};

IP_SimpleSentence_Talking = false;
true
