if !(hasInterface) exitWith {};

private _UNCON_SCREAMER_ID = ["ace_unconscious", {
	params ["_unit", "_state"];

	if (_unit != ACE_player) exitWith {}; // Ignore remote or AI unit

	if (_state) then {

		private _distance = 50;
		private _targets = allPlayers inAreaArray [ASLToAGL getPosASL _unit, _distance, _distance, 0, false, _distance];
		if (_targets isEqualTo []) exitWith {};

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

		[_unit] spawn {
			params ["_unit"];
			while {(lifeState _unit) isEqualTo "INCAPACITATED"; sleep (random 25)} do {
				["ace_medical_feedback_forceSay3D", [_unit, configName selectRandom _sounds, _distance], _targets] call CBA_fnc_targetEvent;
				//sleep (random 25);
			};
		};


	};

}] call CBA_fnc_addEventHandler;

_UNCON_SCREAMER_ID;