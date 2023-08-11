#define WHISTLE(WHISTLE_NAME)\
[WHISLE_NAME] spawn {\
if (isNil {missionnamespace getvariable 'whistle_soundsource'}) then {} else {deleteVehicle whistle_soundsource;};\
whistle_soundsource = 'Land_HelipadEmpty_F' createVehicle position player;\
whistle_soundsource attachTo [player,[0,0,0]];\
[whistle_soundsource,[WHISTLE_NAME,200,1]] remoteExec ['say3D', 0];\
sleep 1;\
};\

_action = ["SESO_whistle_parent","Whistle","src\data\icon.paa",{WHISTLE("WhistleShort")},{true}] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SESO_whistle_short","Whistle Short","src\data\icon.paa",{WHISTLE("WhistleShort")},{true}] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions","ACE_Equipment","SESO_whistle_parent"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SESO_whistle_long","Whistle Long","src\data\icon.paa",{WHISTLE("WhistleLong")},{true}] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions","ACE_Equipment","SESO_whistle_parent"], _action] call ace_interact_menu_fnc_addActionToObject;


//params ["_whistle_name"];
//if (isNil {missionnamespace getvariable 'whistle_soundsource'}) then {} else {deleteVehicle whistle_soundsource;};
//whistle_soundsource = 'Land_HelipadEmpty_F' createVehicle position player;
//whistle_soundsource attachTo [player,[0,0,0]];
//[whistle_soundsource,[_whistle_name,200,1]] remoteExec ['say3D', 0];
//sleep 1;