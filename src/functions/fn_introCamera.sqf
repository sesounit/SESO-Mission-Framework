/*
* Author: Dildo Sagbag
*
* Description:
* Slow panning camera scene for use in mission intros. Text overlay is also played during this scene. Relies on initArsenalServer's SESO_var_arsenals.
*
* Arguments:
* 0: Object representing the start of the camera movement. <OBJECT>
* 1: Object representing the end of the camera movement. <OBJECT>
* 2: Target object the camera will be facing towards. <OBJECT>
* 3: Text to display on the screen using SESO_fnc_introText. If empty, will skip introText. <STRING>
* 4: Font to use on the text in SESO_fnc_introText. If empty, will skip introText. <STRING>
* 5: Music to play during intro camera scene. If empty, no music will play. <STRING>
* 6: End mission if true. Default is false, mission continues.
*
* Return Value:
* None
*
* Examples:
* [cameraStart, cameraEnd, cameraTarget] call SESO_fnc_introCamera;
* [cameraStart, cameraEnd, cameraTarget, "CUP_A1_Arma_Magna"] call SESO_fnc_introCamera;
* [cameraStart, cameraEnd, cameraTarget, "CUP_A1_Arma_Magna", "Operation Sahara", "Caveat"] call SESO_fnc_introCamera;
*
* Public: Yes
*/

params ["_cinematicCameraStart","_cinematicCameraEnd", "_cinematicTarget", ["_music",""], ["_cinematicText",""], ["_cinematicFont",""], ["_endMission", false]];

//Hide camera helpers
_cinematicCameraStart hideObject true;
_cinematicCameraEnd hideObject true;
_cinematicTarget hideObject true;

// Player preparation
player enableSimulation false;
player allowDamage false;
showHUD false;
cutText ["", "BLACK FADED", 999];

private _camera = "camera" camCreate [0, 0, 0];
_camera cameraEffect ["internal","back"];

// Camera Start
_camera camPreparePos (getPosASL _cinematicCameraStart);
_camera camPrepareTarget (_cinematicTarget);
_camera camPrepareFov 0.45;
_camera camCommitPrepared 0;
//waitUntil { camCommitted _camera };

// Start intro
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

cutText ["", "BLACK IN", 10];

// Music Start
playMusic _music;

// Move to Camera End
_camera camPreparePos (getPosASL _cinematicCameraEnd);
_camera camPrepareDir (direction _cinematicCameraEnd);
_camera camCommitPrepared 20;

if (_endMission) exitWith {
	["end1", true, 60, false] call BIS_fnc_endMission;
};

if ((_cinematicText != "") and (_cinematicFont != "")) then {
	[_cinematicText, _cinematicFont] call SESO_fnc_introText;
};

// Fade music
28 fadeMusic 0;
// Fade to player return
waitUntil { camCommitted _camera };
cutText ["", "BLACK OUT", 4];
sleep 4;

// End intro
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

// Player return
cutText ["", "BLACK IN", 5];
hint "Opening ACE3 Arsenal...";
sleep 5;
// Stop Music
playMusic "";
player enableSimulation true;
player allowDamage true;
// Show ACE arsenal with items from arsenal box
[(SESO_var_arsenals select 0), player] call ace_arsenal_fnc_openBox;
showHud true;
1 fadeMusic 0.2;