/*
* Author: Dildo Sagbag
*
* Description:
* Fade-in effect to use in initPlayerLocal.sqf
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: Yes
*/

// Sit players in chairs or inside tents
//if (_player inArea briefingTrigger) then {
//	_chairList = [chair0,chair1,chair2,chair3,chair4,chair5,chair6,chair7,chair8];
//	[selectRandom _chairList, _player] call ace_sitting_fnc_sit;
//}
//else {
//	if (_player inArea "blacklist_2") then {
//		_spawnTent = selectRandom havenTents;
//		_player setPos (getPosATL _spawnTent);
//	};
//};

player enableSimulation false;
cutText ["", "BLACK FADED", 999];
0.1 fadeSound 0;
sleep 5;

player enableSimulation true;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

cutText ["", "BLACK IN", 7];
14 fadeSound 1;