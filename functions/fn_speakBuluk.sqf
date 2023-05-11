/*
* Author: Dildo Sagbag
*
* Description:
* Example script to demonstrate how to make a custom cutscene
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* None
*
* Public: Yes
*/

if (!hasInterface) exitWith {};

char_buluk_chabtan setName ["Buluk Chabtan","Buluk","Chabtan"];
char_ek_chuaj setName ["Ek Chuaj","Ek","Chuaj"];

if (vehicle player != player) then { moveOut player };								// If player in vehicle, move them out

player enableSimulationGlobal false;										// Freeze player in place
player allowDamage false;
player hideObjectGlobal true;												// Hide player's hands
[player] call ACE_medical_treatment_fnc_fullHealLocal;						// Heal player

cutText ["", "BLACK FADED", 999];

private _camera = "camera" camCreate [0, 0, 0];
_camera cameraEffect ["internal","back"];

// Camera Start
_camera camPreparePos (getPosASL player);
_camera camPrepareTarget respawn_heli;
_camera camPrepareFov 0.45;
_camera camCommitPrepared 0;


0.1 fadeSound 0;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

//playMusic ["CUP_A2EWEW_Fallout", 30];
playMusic "CUP_A2_Khe_Sanh_Riff";

cutText ["", "BLACK IN", 7];

sleep 5;
[
	[char_buluk_chabtan,char_ek_chuaj],
	[
		"And so, my champions live while yours has fallen. Your soul is alone, like an orphaned baby. Any final words, Ek Chuaj?",
		"You play too rough, Buluk. Know that wherever your thugs go, they will always find my followers. There will always be men whose hearts are set on gold.",
		"Then I will eat their hearts! Begone, Ek Chuaj! It is my turn to rule this Earth, to bring misfortune, and to lead my champions, my jaguar warriors!"
	],
	"DIRECT",
	true
] call IP_fnc_simpleConversation;

cutText ["", "BLACK OUT", 4];
sleep 4;

["end1",true,true,false] call BIS_fnc_endMission;

//_camera cameraEffect ["terminate", "back"];
//camDestroy _camera;
//
//5 fadeMusic 0;
//5 fadeSound 1;
//
//cutText ["", "BLACK IN", 5];
//sleep 5;
//
//playMusic "";
//
//
//player enableSimulationGlobal true;										// Freeze player in place
//player hideObjectGlobal false;												// Hide player's hands
//[player] call ACE_medical_treatment_fnc_fullHealLocal;	
//["end1",true,true,false] call BIS_fnc_endMission;