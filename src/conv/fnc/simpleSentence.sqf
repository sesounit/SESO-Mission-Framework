/*
Name: simpleSentence
Author: IndeedPete
Purpose: Simulate radio or direct conversations between units. Calculates delay based on input length.
----------
Parameters:
_speaker - OBJECT: Unit that should say the _sentence. - player
_sentence - STRING: Text that the _speaker should say. - "Hello world!"
_wichChat - STRING (OPTIONAL): Which way of communication should be used. Available chats: "SIDE", "GROUP", "VEHICLE", "CUT" or "DIRECT" - "DIRECT" - DEFAULT: "SIDE"
_add - NUMBER (OPTIONAL): Addition in seconds to the calculated delay. Can be negative. - 5 - DEFAULT: 0
_len - NUMBER (OPTIONAL): Fixed delay. - 20 - DEFAULT: ((count (toArray _sentence)) * _x) <- calculation to determine delay
----------
Requires:
Dialog "IP_DLG_SIMPLESENTENCE"
.jpg - "conv\img\defaultAvatar.jpg"
*/

private ["_x", "_speaker", "_sentence", "_add", "_len", "_liveFeed", "_size", "_text"];
_x = 0.09;

_speaker = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if (!([_speaker] call SESO_fnc_canTalk)) exitWith {false};
IP_SimpleSentence_Talking = true;

_sentence = [_this, 1, "", [""]] call BIS_fnc_param;
_wichChat = toUpper([_this, 2, "SIDE", [""]] call BIS_fnc_param);
_add = [_this, 3, 1, [0]] call BIS_fnc_param;
_len = [_this, 4, ((count(toArray _sentence)) * _x), [0]] call BIS_fnc_param;

_len = _len + _add;
_liveFeed = _speaker getVariable ["IP_LiveFeed", false];
_size = str(1);//str(2 * (getResolution select 5));

_text = switch (_wichChat) do {
	case "SIDE": {
		_groupID = groupID (group _speaker);
		player createDiarySubject ["ConvLog", "Conversation Log"];
		player createDiaryRecord ["ConvLog", [_groupID, _sentence]];
		_str = "<t size=" + _size + " color='#58D3F7'>" + _groupID + ": " + _sentence + "</t>";
		_str
	};
	
	case "GROUP": {
		_name = name _speaker;
		player createDiarySubject ["ConvLog", "Conversation Log"];
		player createDiaryRecord ["ConvLog", [_name, _sentence]];
		_str = "<t size=" + _size + " color='#01DF3A'>" + _name + ": " + _sentence + "</t>";
		_str
	};
	
	case "VEHICLE": {
		private "_role";
		_roleArr = assignedVehicleRole _speaker;
		if (count _roleArr > 0) then {_role = _roleArr select 0} else {_role = name _speaker};
		player createDiarySubject ["ConvLog", "Conversation Log"];
		player createDiaryRecord ["ConvLog", [_role, _sentence]];
		_str = "<t size=" + _size + " color='#00FF00'>" + _role + ": " + _sentence + "</t>";
		_str
	};
	
	case "CUT": {
		_name = name _speaker;
		_str = _name + ": " + _sentence;
		_str
	};
	
	case "DIRECT": {
		_name = name _speaker;
		player createDiarySubject ["ConvLog", "Conversation Log"];
		player createDiaryRecord ["ConvLog", [_name, _sentence]];
		_str = "<t size=" + _size + " >" +_name + ": " + _sentence;
		_str
	};
	
	case "GLOBAL": {
		private "_factionName";
		_faction = _speaker getVariable ["IP_Faction", "Unknown"];
		_factionName = getText(missionConfigFile >> "Factions" >> _faction >> "displayNameShort");
		if (_factionName == "") then {_factionName = str(side _speaker)};
		_groupID = groupID (group _speaker);
		player createDiarySubject ["ConvLog", "Conversation Log"];
		player createDiaryRecord ["ConvLog", [(_factionName + " " + _groupID), _sentence]];
		_str = "<t size=" + _size + " color='#BDBDBD'>" + _factionName + " " + _groupID + ": " + _sentence + "</t>";
		_str
	};
	
	default {format ["IP_fnc_simpleSentence:<br/>%1 not recognized!", _wichChat]};
};
if (isPlayer _speaker) then {_text = "(Player) " + _text};

_speaker setRandomLip true;
42 cutRsc ["IP_DLG_SIMPLESENTENCE", "PLAIN"]; 
((uiNamespace getVariable "DLG_SimpleSentence") displayCtrl 1100) ctrlSetStructuredText (parseText _text);

if (_liveFeed && {(vehicle _speaker) == _speaker}) then {
	_animState = animationState _speaker;
	_animStateChars = toArray _animState;
	_animP = toUpper (toString [_animStateChars select 5, _animStateChars select 6, _aniMStateChars select 7]);		
	_attachToValues = switch (_animP) do {
		case "ERC": {[0, 1, 1.65]};
		case "KNL": {[0, 1.25, 1]};
		case "PNE": {[0, 1.5, 0.25]};
		default {[0, 1, 1.65]};
	};
		
	_camera = "camera" camCreate (getPos _speaker);
	_camera camPrepareTarget _speaker;
	_camera camPrepareFOV 0.2;
	_camera attachTo [_speaker, _attachToValues];		
	_camera camCommitPrepared 0.03;
	_camera cameraEffect ["INTERNAL", "BACK", "camrender0"];
	
	sleep _len;
	
	player cameraEffect ["terminate", "back"];
	camDestroy _camera;
} else {
	_picture = _speaker getVariable ["IP_Avatar", "conv\img\defaultAvatar.jpg"];
	((uiNamespace getVariable "DLG_SimpleSentence") displayCtrl 1200) ctrlSetText _picture;
	sleep _len;
};

42 cutText ["", "PLAIN"];
_speaker setRandomLip false;
IP_SimpleSentence_Talking = false;
true
