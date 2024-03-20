/*
* Author: Dildo Sagbag
*
* Description:
* Dresses units to predefined lists of uniforms, vests, headgear, and backpacks according to their side (blufor, opfor, etc.) and faction (nato, csat, etc.). Lists, sides, and factions need to be manually configured.
*
* Arguments:
* 0: The unit being dressed <OBJECT>
*
* Return Value:
* None
*
* Example:
* [bob] call SESO_fnc_dressFaction;
*
* Public: Yes
*/

// Confederados
#define CONFEDERADO_UNIFORMS ["CFP_BDU_Grey"]
#define CONFEDERADO_VESTS ["CUP_V_RUS_Smersh_New_Buttpack","CUP_V_RUS_Smersh_New_Full","CFP_Smersh_Creme","CUP_V_RUS_Smersh_New_Light","CFP_Smersh_Olive","CUP_V_RUS_Smersh_New_Radio","SP_Harness1_Grey"]
#define CONFEDERADO_HEADGEAR ["Hat_01_Straw","H_StrawHat","Hat_02_Wicker","","SP_PatrolCap_Grey","CFP_Basic_Helmet_Gray_Green","CFP_Basic_Helmet_Gray","SP_M1Helmet_GrayDim","CUP_H_PMC_Cap_Grey","CFP_H_Balaclava_Grey"]
// Los Mineros
#define MINEROS_HEADGEAR ["H_Construction_earprot_orange_F","H_Construction_headset_orange_F","H_Construction_basic_orange_F","H_Construction_earprot_white_F","H_Construction_headset_white_F","H_Construction_basic_white_F"]
// Santa Luz Stars
#define SANTA_UNIFORMS ["CFP_BDU_M81Sudan2"]
#define SANTA_VESTS ["CUP_V_C_Police_Holster"]
#define SANTA_HEADGEAR ["CFP_PatrolCap_M81Sudan"]
#define SANTA_BACKPACKS ["Backpack_C_01","Backpack_C_02"]

params ["_unit"];
// Only dress OPFOR and GREENFOR units
if (((side group _unit) isNotEqualTo east) /*and ((side group _unit) isNotEqualTo resistance)*/) exitWith {};

private _uniforms = [];
private _vests = [];
private _backpacks = [];
private _headgear = [];

// Detect Faction
switch (faction _unit) do {
	case "CPC_B_EJE": {_uniforms = CONFEDERADO_UNIFORMS;_vests = CONFEDERADO_VESTS;_headgear = CONFEDERADO_HEADGEAR;};
	case "CPC_O_NAM_VC": {_headgear = MINEROS_HEADGEAR;};
	case "CPC_I_PIC": {_uniforms = SANTA_UNIFORMS;_vests = SANTA_VESTS;_headgear = SANTA_HEADGEAR;_backpacks = SANTA_BACKPACKS;};
};

// Dress unit
if (count _uniforms > 0) then {
	private _uniformInv = uniformItems _unit;

	[_unit,(selectRandom _uniforms)] remoteExec ["forceAddUniform",0];
	waitUntil { !isNull uniformContainer _unit };

	{
		if (_unit canAddItemToUniform _x) then {_unit addItemToUniform _x};
	}forEach _uniformInv;
};

if (count _vests > 0) then {
	private _vestInv = vestItems _unit;

	[_unit,(selectRandom _vests)] remoteExec ["addVest",0];
	waitUntil { !isNull vestContainer _unit };

	{
		if (_unit canAddItemToVest _x) then {_unit addItemToVest _x};
	}forEach _vestInv;
};

// Check if there any faction backpacks AND unit has a backpack
if ((count _backpacks > 0) && (backpack _unit) != "") then {
	private _backInv = backpackItems _unit;
	removeBackpackGlobal _unit;
	private _backpack = selectRandom _backpacks;

	_unit addBackpackGlobal _backpack;
	waitUntil { !isNull backpackContainer _unit };

	{
		if (_unit canAddItemToBackpack _x) then {_unit addItemToBackpack _x};
	}forEach _backInv;

} else {
	// Otherwise, if there are no faction backpack AND unit does not have a backpack, move it to vest & uniform
	private _backInv = backpackItems _unit;
	removeBackpackGlobal _unit;
	waitUntil { isNull backpackContainer _unit };

	// Add everything to vest first
	{
	if (_unit canAddItemToVest _x) then {_unit addItemToVest _x};
	}forEach _backInv;
	// Add the remaining to the uniform
	{
	if (_unit canAddItemToUniform _x) then {_unit addItemToUniform _x};
	}forEach _backInv;
};

if (count _headgear > 0) then {
	private _helmet = selectRandom _headgear;

	if (_helmet == "") then {
		removeHeadgear _unit
	} else {
		[_unit, _helmet] remoteExec ["addHeadgear",0];
	};
};