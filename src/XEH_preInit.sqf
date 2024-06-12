
// Source
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod

#include "script_component.hpp"

////////////////////////////////////////////////////////////////
// ACE3 Auto Arsenal
////////////////////////////////////////////////////////////////

[
    "SESO_setting_AutoArsenalManualList",
    "EDITBOX",
    ["List of Player Equipment", "Run [] call SESO_fnc_getPlayerUnitsItems in your Debug Console then paste the output here. These items will be added to the arsenals on top of their existing items. "],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
	str PLAYER_UNITS_ITEMS,
    true, // _isGlobal
    {
		params ["_value"];
		//missionNamespace setVariable ["SESO_var_AutoArsenalManualList",parseSimpleArray _value];

    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoArsenalForgottenList",
    "LIST",
    ["List of Forgotten Equipment", "Select a theme of forgotten items to add on the arsenal. Choose None to add no items. These items will be added to the arsenals on top of their existing items."],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
	[
		[str FORGOTTEN_CUP_ITEMS, str FORGOTTEN_WW2_ITEMS, str []],
		["Forgotten CUP Items", "Forgotten WW2 Items", "None"],
		0
	],
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoArsenalEntityLayerName",
    "EDITBOX",
    ["Auto Arsenals Entity Layer Name", "CASE SENSITIVE name of entity layer with objects that will become ACE3 arsenals. The entity layer must match this exact name. Only objects in this layer will be affected."],
	["SESO Mission Framework", "ACE3 Auto Arsenal"],
    "Arsenals",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		private _fullListOfEquipment = (parseSimpleArray (missionNamespace getVariable "SESO_setting_AutoArsenalManualList"));
		_fullListOfEquipment append (parseSimpleArray (missionNamespace getVariable "SESO_setting_AutoArsenalForgottenList"));
		[_value, _fullListOfEquipment] call SESO_fnc_initArsenalServer;

    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Setup System
////////////////////////////////////////////////////////////////

[
    "SESO_setting_SetupSystemEnable",
    "CHECKBOX",
    ["Enable Setup System", "Enable Setup System. Disable if using other ticket system."],
	["SESO Mission Framework", "Setup"],
    true,
    true // _isGlobal
] call CBA_fnc_addSetting;

[
    "SESO_setting_SetupStartingTickets",
    "SLIDER",
    ["Starting Tickets", "Define respawn tickets at mission start. Set to less than 0 to disable."],
	["SESO Mission Framework", "Setup"],
    [-1,100,2,0],
    true, // _isGlobal
    {  
		if !(missionNamespace getVariable "SESO_setting_SetupSystemEnable") exitWith {};
        params ["_value"];
		if (_value < 0) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
		[player, _value] call BIS_fnc_respawnTickets;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_SetupTimer",
    "SLIDER",
    ["Setup Timer (seconds)", "Set amount of setup at mission start. Timer is in seconds. Default is 25 mins (1500 seconds). Set to less than 0 to disable."],
	["SESO Mission Framework", "Setup"],
    [-1,3600,1500,0],
    true, // _isGlobal
    {
		if !(missionNamespace getVariable "SESO_setting_SetupSystemEnable") exitWith {};
		params ["_value"];
		if (_value < 0) exitWith {};
        // Global
		[_value] spawn {
			waitUntil {cba_missiontime > 0};
			params ["_value"];
			[_value] call SESO_fnc_setupTimer;
		};
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// ZBE AI Caching
////////////////////////////////////////////////////////////////

// BUG: AI Units tend to teleport whether they are cached or not.
[
    "SESO_setting_CacheEnable",
    "CHECKBOX",
    ["Enable ZBE AI Caching", "Enable or disable caching of AI and vehicles."],
    ["SESO Mission Framework","ZBE AI Caching"],
    true,
    true // _isGlobal
] call CBA_fnc_addSetting;


[
    "SESO_setting_CacheExceptionEntityLayerName",
    "EDITBOX",
    ["Cache Exceptions Entity Layer Name", "CASE SENSITIVE name of entity layer of vehicles and AI that will be exempt from being cached."],
    ["SESO Mission Framework","ZBE AI Caching"],
    "Cache Exceptions",
    true, // _isGlobal
    {  
		// Might as well do this regardless of the above setting
		//if !(missionNamespace getVariable "SESO_setting_CacheEnable") exitWith {};
        params ["_value"];
        // Server only
        if !(isServer) exitWith {};
        [_value] spawn {
			params ["_value"];
			{
				_x setVariable ["zbe_cacheDisabled",true];

			}forEach ((getMissionLayerEntities _value) select 0);
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_CacheDistance",
    "SLIDER",
    ["Caching Distance", "The minimum distance between AI and a player until caching begins. For example, 600 meters means AI further away than 600 meters will be cached."],
    ["SESO Mission Framework","ZBE AI Caching"],
    [100, 15000, 600, 0],
    true, // _isGlobal
    {  
		if !(missionNamespace getVariable "SESO_setting_CacheEnable") exitWith {};
        params ["_value"];
        // Server only
        if !(isServer) exitWith {};
        [_value] spawn {
            params ["_value"];
            [_value,-1,false,100,_value,_value] execVM "src\zbe_cache\main.sqf";
        };
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Advanced ACE3 Fortify
////////////////////////////////////////////////////////////////

[
    "SESO_setting_FortifyAdvancedEnable",
    "CHECKBOX",
    ["Enable ACE3 Advanced Fortify", "Check to enable additional options and blueprints for the Fortify Tool and Engineers. Uncheck to leave it unchanged."],
	["SESO Mission Framework", "ACE3 Advanced Fortify"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
        // Global
        [] call SESO_fnc_fortifyInit;
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Animation Multipliers
////////////////////////////////////////////////////////////////
[
    "SESO_setting_SwimSpeedMultiplier",
    "EDITBOX",
    ["Set Swimming Speed Multiplier", "Set multiplier for swimming faster. Set to 1 for vanilla speed."],
	["SESO Mission Framework", "Animation Multiplers"],
    "2.5",
    true, // _isGlobal
    {
        params ["_value"];
		_value = parseNumber _value;
		//if (_value <= 1) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		private _SWIM_FASTER_ID = [] call SESO_fnc_swimFaster;
    }
] call CBA_fnc_addSetting;


[
    "SESO_setting_RoleFlagMultiplier",
    "EDITBOX",
    ["Set Operative Role Flags Penalty Multiplier", "Set multiplier for moving slower when holding weapons outside of your role. Set to 1 for vanilla speed."],
	["SESO Mission Framework", "Animation Multiplers"],
    "0.65",
    true, // _isGlobal
    {
        params ["_value"];
		_value = parseNumber _value;
		if (_value == 1) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        player setVariable ["SESO_totalSpeed", 1];

        [_value] spawn {
			waitUntil {cba_missiontime > 0};
			params ["_value"];
			[] call SESO_fnc_roleFlags;
		};
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Misc.
////////////////////////////////////////////////////////////////

[
    "SESO_setting_DisableFallDamage",
    "CHECKBOX",
    ["Disable Fall Damage", "Disable fall damage for players."],
	["SESO Mission Framework"],
    false,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        [] spawn {
            while {true} do {
                player allowDamage true;
                waitUntil{!isTouchingGround player};
                player allowDamage false;
                waitUntil{isTouchingGround player};
            };
        };
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_DynamicGroupManagerEnable",
    "CHECKBOX",
    ["Enable Dynamic Group Manager", "Enable Dynamic Group Manager, to let players view and join player groups. Accessible by pressing U."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Server only
		if (isServer) then {
			["Initialize", [true]] call BIS_fnc_dynamicGroups;
		};
        // Player only
		if (hasInterface) then {
			["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_StaminaDisable",
    "CHECKBOX",
    ["Disable Player Stamina", "Check to disable players' stamina. Uncheck to re-enable it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        player enableStamina false;
        player setCustomAimCoef 0.2;
        private _STAMINA_DISABLER_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            _unit enableStamina false;
            _unit setCustomAimCoef 0.2;
        }];
    }
] call CBA_fnc_addSetting;

// BUG: Doesnt work, exploit works
// TEST
[
    "SESO_setting_GlobalChatDisableWhenUncon",
    "CHECKBOX",
    ["Disable Global Chat when Unconscious", "Check to disable players' access to global chat when unconscious. Uncheck to re-enable it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
        // Player only
		if !(hasInterface) exitWith {};
        0 enableChannel true;
        private _GLOBAL_DISABLER_ID = [] call SESO_fnc_hideGlobalChatWhenUncon;
        private _GLOBAL_DISABLER_RESPAWN_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            0 enableChannel true;
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_PlayerCamoCoef",
    "EDITBOX",
    ["Player Camouflage Coefficient", "Set player's camo Coef. 1 is default and less is more camoflauged. Set less than 0 to leave camo on automatic."],
	["SESO Mission Framework"],
    "0.05",
    true, // _isGlobal
    {  
        params ["_value"];
		_value = parseNumber _value;
		if (_value < 0) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        player setUnitTrait ["camouflageCoef",_value];
        private _CAMO_COEF_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};
            _value = parseNumber (missionNamespace getVariable "SESO_setting_PlayerCamoCoef");

            _unit setUnitTrait ["camouflageCoef", _value];
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_PlayMusicOnDeath",
    "EDITBOX",
    ["Music On Death", "Set music to play when player dies. Empty for no music on death."],
	["SESO Mission Framework"],
    "CUP_A1_Arma_Magna",
    true, // _isGlobal
    {  
        params ["_value"];
		if ((count _value) == 0) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};

        private _DEATH_MUSIC_ID = player addEventHandler ["Killed", {
            params ["_unit"];
            if !(_unit == player) exitWith {};

            playMusic "CUP_A1_Arma_Magna";
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AutoEndMission",
    "CHECKBOX",
    ["Auto End Mission on 0 Tickets", "Check to end the mission on a failure if there are 0 tickets and there are 0 living players, not counting the Zeus(es). Uncheck to continue the mission after tickets and players are 0."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        private _AUTO_END_ID = player addEventHandler ["Killed", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            [] call SESO_fnc_autoEndMission;
        }];
    }
] call CBA_fnc_addSetting;


[
    "SESO_setting_LoadLastKitOnRespawn",
    "CHECKBOX",
    ["Load Last Used Arsenal Kit on Respawn", "Check to load players' last used loadout after exiting. Uncheck to disable this."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        //[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
        private _LOAD_LAST_KIT_ID = player addEventHandler ["Respawn", {
            params ["_unit","_corpse"];
            if !(_unit == player) exitWith {};

            [_unit, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
        }];
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_ShowRespawnTicketsEnable",
    "CHECKBOX",
    ["Show Respawn Tickets", "Check to show how many respawn tickets are available to players. Uncheck to leave it hidden."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {  
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[] call BIS_fnc_showMissionStatus;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_WarCrimeDetectorEnable",
    "CHECKBOX",
    ["Enable War Crime Detector", "Whether to keep track and reduce tickets for every civilian death, friendly kill, and detainee kill."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
        // Global
		[] call SESO_fnc_detectWarCrime;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_MarkedBuildingsEntityLayerName",
    "EDITBOX",
    ["Marked Buildings Custom Entity Layer Name", "CASE SENSITIVE name of layer of buildings and props to mark as grey rectangles on the map. Objects must be in this layer to be marked."],
	["SESO Mission Framework"],
    "Marked Buildings",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		// Check if layer is exists
		if (count (getMissionLayerEntities _value) <= 0) exitWith {};
		private _entityLayerName = (getMissionLayerEntities _value) select 0;
		// Check if layer has entities
		if ((count _entityLayerName) == 0) exitWith {};

		// Mark buildings in layer
		{
			[_x, true] call zen_building_markers_fnc_set;

		}forEach ((getMissionLayerEntities _value) select 0);
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_AmmoGeneratorEntityLayerName",
    "EDITBOX",
    ["Ammo Generator Custom Entity Layer Name", "CASE SENSITIVE name of layer of containers and vehicles to fill with player and nearby AI equipment and ammo. Objects must be in this layer to be filled with ammo."],
	["SESO Mission Framework"],
    "Ammo",
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		// Check if layer is exists
		if (count (getMissionLayerEntities _value) <= 0) exitWith {};
		private _entityLayerName = (getMissionLayerEntities _value) select 0;
		// Check if layer has entities
		if ((count _entityLayerName) == 0) exitWith {};

		// Add ammos in layer
		[_value] spawn {
			params ["_entityLayerName"];
			{
				[_x, (SESO_var_arsenals select 0)] call SESO_fnc_generateAmmo;

			}forEach ((getMissionLayerEntities _entityLayerName) select 0);
		};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_MedicalNotifierEnable",
    "CHECKBOX",
    ["Enable Medical Notifier", "Check to notify players when they are being treated by other players. Uncheck to remove this notification."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_CustomColorCorrection",
    "EDITBOX",
    ["Custom Color Correction", "Set custom color correction for players. Default is vanilla color correction"],
	["SESO Mission Framework"],
    str [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0.299, 0.587, 0.114, 0],[-1, -1, 0, 0, 0, 0, 0]],
    true, // _isGlobal
    {
        params ["_value"];
		if (_value == "[1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0.299, 0.587, 0.114, 0],[-1, -1, 0, 0, 0, 0, 0]]") exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
        'ColorCorrections' ppEffectEnable true; 
        'ColorCorrections' ppEffectAdjust (parseSimpleArray _value); 
        'ColorCorrections' ppEffectCommit 0;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_WhistlingEnable",
    "CHECKBOX",
    ["Enable Whistling", "Check to add whistles to all players under ACE3 Self-Interact >> Equipment. Uncheck to remove it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[] call SESO_fnc_whistleInit;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_CutGrassEnable",
    "CHECKBOX",
    ["Enable Cutting Grass", "Check to allow all players to cut grass under ACE3 Self-Interact >> Equipment. Uncheck to remove it."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[] call SESO_fnc_createCutGrassAction;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_GroupRespawnEnable",
    "CHECKBOX",
    ["Enable Respawn on Group", "Check to players allow players respawn on their group/team. Uncheck to leave it unchanged."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
		// Player only
		if !(hasInterface) exitWith {};
		[group player, group player, groupId (group player)] call BIS_fnc_addRespawnPosition;
    }
] call CBA_fnc_addSetting;

// BUG: Cedric cant see the snow particles except inside buildings
[
    "SESO_setting_SnowEnable",
    "CHECKBOX",
    ["Enable Snow", "Check to enable visual snow effects. Uncheck to have no snow."],
	["SESO Mission Framework"],
    false,
    true, // _isGlobal
    {
        params ["_value"];
		if !(_value) exitWith {};
        // Global
        [] spawn {
            [] call SESO_fnc_snow;
        };
		
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_ShowServerFps",
    "CHECKBOX",
    ["Show Server FPS", "Gets the server FPS and all the current units and updates a marker at the bottom left of the map."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
		params ["_value"];
        // Server only
		if !(isServer) exitWith {};
		[] spawn SESO_fnc_serverFpsLoop;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_EnableDiscordRichPresence",
    "CHECKBOX",
    ["Enable SESO Discord Rich Presence", "Enable custom SESO Discord Rich Presence. Enable it for shameless promo!"],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
		params ["_value"];
        // Player only
		if !(hasInterface) exitWith {};
		[] call SESO_fnc_initPlayerRichPresence;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_EnableSprayPaintTags",
    "CHECKBOX",
    ["Enable ACE Spray Paint Map Tags", "Enable creating a marker on the map each time someone tags something with spray paint."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
		params ["_value"];
        if !(_value) exitWith {};
        // Server only
		if !(isServer) exitWith {};
        markerNumber = 0;
        ["ace_tagCreated", SESO_fnc_mapTag] call CBA_fnc_addEventHandler;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_EnableACEMedicalReplacements",
    "CHECKBOX",
    ["Enable Custom ACE Medical Replacements", "Enable replacing First Aid Kits and Med Kits with custom ACE items defined by the Medical SME."],
	["SESO Mission Framework"],
    true,
    true, // _isGlobal
    {
		params ["_value"];
        if !(_value) exitWith {};
        // Server only
		if !(isServer) exitWith {};
        ace_medical_treatment_convertItems = 2;
        [] call SESO_fnc_itemReplace;
    }
] call CBA_fnc_addSetting;

////////////////////////////////////////////////////////////////
// Unknown Weapon Degrade
////////////////////////////////////////////////////////////////

[
    "SESO_setting_EnableUnknownWeaponDegrade",
    "CHECKBOX",
    ["Enable Unknown Weapon Degradation", "Enable degrading weapons unknown to the operatives."],
	["SESO Mission Framework", "Unknown Weapon Degrade"],
    false,
    true, // _isGlobal
    {
		params ["_value"];
        if !(_value) exitWith {};
        // Global
        [] call SESO_fnc_weaponDegrade;
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_DispersionValue",
    "SLIDER",
    ["Set Dispersion Value", "Set dispersion of unknown weapons. This represents how inaccurate the weapons are."],
	["SESO Mission Framework", "Unknown Weapon Degrade"],
    [1, 1000, 165, 0],
    true, // _isGlobal
    {
        if !(missionNamespace getVariable "SESO_setting_EnableUnknownWeaponDegrade") exitWith {};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_JamValue",
    "SLIDER",
    ["Set Jam Chance Percentage", "Set jam chance percentage of unknown weapons. This represents the chance an unknown weapon would jam."],
	["SESO Mission Framework", "Unknown Weapon Degrade"],
    [1, 100, 3, 0],
    true, // _isGlobal
    {
        if !(missionNamespace getVariable "SESO_setting_EnableUnknownWeaponDegrade") exitWith {};
    }
] call CBA_fnc_addSetting;

[
    "SESO_setting_PropagationTimer",
    "SLIDER",
    ["Set Propagation Wait Timer", "Weapons held by operatives at the beginning of their connection is automatically known. Set the timer for how long the system should wait until their held weapons are known to them."],
	["SESO Mission Framework", "Unknown Weapon Degrade"],
    [1, 100, 15, 0],
    true, // _isGlobal
    {
        if !(missionNamespace getVariable "SESO_setting_EnableUnknownWeaponDegrade") exitWith {};
    }
] call CBA_fnc_addSetting;