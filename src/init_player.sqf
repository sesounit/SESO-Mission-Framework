//[{!isNull player}, {
// Disable Stamina
//player enableStamina false;

// Show respawn tickets
//[] call BIS_fnc_showMissionStatus;

// Add ACE Medical Treatment Notifier event handler
// Event called on another machine
//private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;

// Dynamic Group Manager
// Initializes the player/client side Dynamic Groups framework and registers the player group
//["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

//'ColorCorrections' ppEffectEnable true; 
//'ColorCorrections' ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1.8, 1.8, 0.3, 0.75],  [0.199, 0.587, 0.114, 0.0]]; 
//'ColorCorrections' ppEffectCommit 0;

//[] call SESO_fnc_fortifyInit;

//private _GLOBAL_DISABLER_ID = [] call SESO_fnc_hideGlobalChatWhenUncon;

//private _UNCON_SCREAMER_ID = [] call SESO_fnc_unconScream;

// Doesn't work!
//[] call SESO_fnc_replaceBadFace;

//[] call SESO_fnc_whistleInit;

//private _SWIM_FASTER_ID = [] call SESO_fnc_swimFaster;

// Add respawn on player's group
//[group player, group player, groupId (group player)] call BIS_fnc_addRespawnPosition;

//player setUnitTrait ["camouflageCoef",0.05];

//}] call CBA_fnc_waitUntilAndExecute;