/*
* Author: Dildo Sagbag
*
* Description:
* Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items
*
* Arguments:
* 0: Array of classes of items to add to the arsenal <ARRAY>
*
* Return Value:
* None
*
*
* Public: Yes
*/
#define PLAYER_UNITS_ITEMS ["LIB_Sten_Mk5","LIB_32rnd_9x19_t","LIB_Colt_M1911","LIB_7Rnd_45ACP","U_LIB_GBR_NCO_ParaCamo02v02pSgtM1Tho","JMSSA_ita_VAmmoSMG","ACE_MapTools","LIB_US_M18","LIB_US_M18_Green","LIB_US_M18_Red","B_LIB_UK_HSack_Blanco","ACE_elasticBandage","ACE_packingBandage","ACE_EntrenchingTool","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_Flashlight_MX991","H_LIB_US_HelmetKaki0F_WOWhiteWO","ItemMap","ItemRadioAcreFlagged","LIB_GER_ItemCompass_deg","LIB_GER_ItemWatch","LIB_M1_Garand","LIB_8Rnd_762x63_t","LIB_FLARE_PISTOL","LIB_1Rnd_flare_white","U_LIB_GBR_EnlMan_ParaCamo03v01pPvtSmLE","JMSSA_ita_VAmmoBelt","LIB_US_Mk_2","LIB_1Rnd_flare_green","B_LIB_SOV_RA_Radio","ACRE_PRC152","H_LIB_US_HelmetKaki0C_NxNx","LIB_8Rnd_762x63","U_LIB_GBR_EnlMan_ParaCamo02v03pPvtMedSmLE","B_LIB_SOV_RA_MedicalBag_Empty","ACE_bloodIV","ACE_bloodIV_500","ACE_adenosine","ACE_surgicalKit","H_LIB_US_Helmetos_MedCRRB1234","LIB_M1919A6","LIB_50Rnd_762x63","JMSSA_ita_VAmmoStrip","LIB_M1A1_Bazooka","LIB_1Rnd_60mm_M6","JMSSA_ita_VCrewStrip","B_LIB_US_RocketBag_Empty","LIB_32Rnd_9x19_Sten"]

params [["_optionalItems", []]];

if !(isServer) exitWith {};

private _allPlayerUnitsItems = PLAYER_UNITS_ITEMS;

// Get list of Arsenals
SESO_var_arsenals = (getMissionLayerEntities "Arsenals") select 0;
publicVariable "SESO_var_arsenals";

// Add optionalItems to arsenals
{
	nul = [_x,_optionalItems, _allPlayerUnitsItems] spawn {
		params ["_selectArsenal","_optionalItems", "_allPlayerUnitsItems"];

		// Check to make sure arsenal has items in it before adding new items. Or wait 200 seconds.
		waitUntil { sleep 1; (count (flatten (_selectArsenal getVariable ["ace_arsenal_virtualItems", []]))  > 1 ) or (time > 200)};

		// Add optional and player items items.
		[_selectArsenal, _optionalItems + _allPlayerUnitsItems, true] call ace_arsenal_fnc_addVirtualItems;
	};
}forEach SESO_var_arsenals;

// Define Diwako's Unknown Weapon Punish whitelist
//LIB_Sten_Mk5,LIB_M1919A6,LIB_M1_Garand,LIB_Colt_M1911,LIB_M1A1_Bazooka,LIB_FLARE_PISTOL
diwako_unknownwp_local_weapons = [];
{
	diwako_unknownwp_local_weapons pushBackUnique (toUpper _x)
}forEach (_allPlayerUnitsItems + (flatten (arsenal_0 getVariable ["ace_arsenal_virtualItems", []])));
publicVariable "diwako_unknownwp_local_weapons";

[] remoteExecCall ["SESO_fnc_initArsenalPlayer",0,true];