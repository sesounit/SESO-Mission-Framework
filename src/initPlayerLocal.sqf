//Players
// Set camera avatar for conversations
player setVariable ["IP_LiveFeed", true];
// Set Diary
player execVM "intel\diaryRecords.sqf";

// Disable Stamina
player enableStamina false;

// Show respawn tickets
call BIS_fnc_showMissionStatus;

// Add ACE Medical Treatment Notifier event handler
// Event called on another machine
private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;

// Dynamic Group Manager
// Initializes the player/client side Dynamic Groups framework and registers the player group
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

waitUntil {(!isNull player) && (time > 0)};