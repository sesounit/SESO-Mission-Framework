/*
* Author: Dildo Sagbag
*
* Description:
* Dresses players to random lists of uniforms, and headgear. Their profile's faces is also checked against an allowed list of faces. Additional features are to lower player's weapon or holser player's weapon.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: Yes
*/

#define PLAYER_UNIFORMS ["CUP_U_B_BDUv2_dirty_OD","CUP_U_B_BDUv2_gloves_OD","CUP_U_B_BDUv2_gloves_dirty_OD","CUP_U_B_BDUv2_roll2_OD","CUP_U_B_BDUv2_roll2_dirty_OD","CUP_U_B_BDUv2_roll2_gloves_OD","CUP_U_B_BDUv2_roll2_gloves_dirty_OD","CUP_U_B_BDUv2_roll_OD","CUP_U_B_BDUv2_roll_dirty_OD","CUP_U_B_BDUv2_roll_gloves_OD","CUP_U_B_BDUv2_roll_gloves_dirty_OD","CUP_U_B_BDUv2_OD"]
#define PLAYER_HELMETS ["CUP_H_PASGTv2_NVG_OD","SP_PASGTHelmet_Tan1"]
#define ALLOWED_FACES ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21","WhiteHead_22","WhiteHead_23","WhiteHead_24","WhiteHead_25","WhiteHead_26","WhiteHead_27","WhiteHead_28","WhiteHead_29","WhiteHead_30","WhiteHead_31","WhiteHead_32","AfricanHead_01","AfricanHead_02","AfricanHead_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","GreekHead_A3_10","GreekHead_A3_11","GreekHead_A3_12","GreekHead_A3_13","GreekHead_A3_14","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07","TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9","LivonianHead_10","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4"]

// Change default and custom face
if ( ((face player) == "Custom") || ((face player) == "Default") ) then {
	[player, selectRandom ALLOWED_FACES] remoteExec ["setFace", 0, true];
	systemChat "Changed invalid face to " + (face player);
};

// Save player's items
private _uniformInv = uniformItems player;

player forceAddUniform (selectRandom PLAYER_UNIFORMS);

// Try to add back player's items
{
	if (player canAddItemToUniform _x) then {player addItemToUniform _x};
}forEach _uniformInv;

// Lower weapon
//[] call SESO_fnc_lowerPlayerWeapon; // Replaces holster weapon. But doesn't work because ACE opens.

// Holster weapon
//player action ["SWITCHWEAPON",player,player,-1];
//waitUntil {currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}};