//Players
// Set camera avatar for conversations
player setVariable ["IP_LiveFeed", true];
// Set Diary
player execVM "intel\diaryRecords.sqf";
player execVM "intel\sopRecords.sqf";

// Disable Stamina
player enableStamina false;

// Show respawn tickets
[] call BIS_fnc_showMissionStatus;

// Add ACE Medical Treatment Notifier event handler
// Event called on another machine
private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;

// Dynamic Group Manager
// Initializes the player/client side Dynamic Groups framework and registers the player group
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

waitUntil {(!isNull player) && (time > 0)};

[] call SESO_fnc_fortifyInit;

private _GLOBAL_DISABLER_ID = [] call SESO_fnc_hideGlobalChatWhenUncon;

[] call SESO_fnc_replaceBadFace;

[] call SESO_fnc_whistleInit;

private _SWIM_FASTER_ID = [] call SESO_fnc_swimFaster;
