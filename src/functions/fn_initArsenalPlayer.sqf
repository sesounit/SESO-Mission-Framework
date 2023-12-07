/*
* Author: Dildo Sagbag
*
* Description:
* Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items
*
* Arguments:
* None
*
* Return Value:
* None
*
*
* Public: Yes
*/

#define ARSENAL_MEDICAL ["ACE_elasticBandage","ACE_packingBandage","ACE_bodyBag","ACE_epinephrine","ACE_tourniquet","ACE_bloodIV","ACE_adenosine","ACE_morphine","ACE_bloodIV_500","ACE_bloodIV_250","ACE_splint","ACE_surgicalKit","ACE_personalAidKit"]
#define ARSENAL_TOOLS ["ACE_LIB_LadungPM","LIB_ToolKit","ACE_LIB_FireCord","ACE_Clacker","ToolKit","ACE_wirecutter","ACE_Fortify","ACE_DefusalKit","ACE_Kestrel4500","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope3","ACE_rope36","ACE_rope6"]

if !(hasInterface) exitWith {};

// Save loadout on mission start
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

// Save loadout on arsenal exit
private _ARSENAL_DISPLAY_ID = ["ace_arsenal_displayClosed", {
	// Save loadout on arsenal exit
	[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
	systemChat "Loadout saved for respawn";
}] call CBA_fnc_addEventHandler;

// Make sub categorys to them
//[ARSENAL_MEDICAL, "Medical","a3\ui_f\data\igui\cfg\actions\heal_ca.paa"] call ace_arsenal_fnc_addRightPanelButton;
//[ARSENAL_TOOLS, "Engineering", "a3\ui_f\data\igui\cfg\actions\repair_ca.paa"] call ace_arsenal_fnc_addRightPanelButton;

{
	// addAction to add currently held weapon to arsenal
	_x addAction
		[
			"Add Currently Held Weapon to Arsenal",	// title
			{
				params ["_target"]; // script
				[_target,[currentWeapon player, currentMagazine player], true] call ace_arsenal_fnc_addVirtualItems;
				systemChat (([configFile >> "CfgWeapons" >> currentWeapon player] call BIS_fnc_displayName) + " and " + ([configFile >> "CfgMagazines" >> currentMagazine player] call BIS_fnc_displayName) + " added to arsenal.");
			},
			nil,		// arguments
			1000,		// priority
			true,		// showWindow
			false,		// hideOnUse
			"",			// shortcut
			"currentWeapon player != ''", 	// condition
			5,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		];

}forEach SESO_var_arsenals;


// Add starting loadout as a default loadout
private _loadoutName = roleDescription player;

// SP Workaround since roleDescription returns empty string in SP
if (roleDescription player == "") then {
	_loadoutName = "Starting Loadout";
};
[_loadoutName, getUnitLoadout player] call ace_arsenal_fnc_addDefaultLoadout;
