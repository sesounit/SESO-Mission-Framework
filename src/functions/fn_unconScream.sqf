if !(hasInterface) exitWith {};

private _UNCON_SCREAMER_ID = ["ace_unconscious", {
	params ["_unit", "_state"];
	//systemChat "0";
	//systemChat str _unit;
	//systemChat str ACE_player;
	//if (_unit != ACE_player) exitWith {}; // Ignore remote or AI unit
	if !(isPlayer _unit) exitWith {};
	systemChat "1";
	if (_state) then {
		systemChat "2";
		private _distance = 50;
		private _targets = allPlayers inAreaArray [ASLToAGL getPosASL _unit, _distance, _distance, 0, false, _distance];
		if (_targets isEqualTo []) exitWith {};
		systemChat "3";
		private _speaker = speaker _unit;
		if (_speaker == "ACE_NoVoice") then {
			_speaker = _unit getVariable "ace_originalSpeaker";
		};

		if (isNull (configFile >> "CfgSounds" >> format ["ACE_moan_%1_low_1", _speaker])) then {
			_speaker = "Male08ENG";
		};

		// Select actual sound
		private _variation = ["low_", "mid_", "high_"];
		private _cfgSounds = configFile >> "CfgSounds";
		private _targetClass = format ["ACE_%1_%2_", "moan", _speaker];
		private _sounds = [];
		{
			private _index = 1;
			while {isClass (_cfgSounds >> (_targetClass + _x + str _index))} do {
				_sounds pushBack (_cfgSounds >> (_targetClass + _x + str _index));
				_index = _index + 1;
			};
		}forEach _variation;
		systemChat "4";
		[_unit,_sounds,_distance,_targets] spawn {
			systemChat "Moaning activated in scheduled environment";
			params ["_unit","_sounds","_distance","_targets"];
			while {(lifeState _unit) isEqualTo "INCAPACITATED"} do {
				systemChat "Moaning!";
				["ace_medical_feedback_forceSay3D", [_unit, configName selectRandom _sounds, _distance], _targets] call CBA_fnc_targetEvent;
				sleep 5;
			};
		};


	};

}] call CBA_fnc_addEventHandler;

_UNCON_SCREAMER_ID;