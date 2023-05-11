/*
* Author: Dildo Sagbag
*
* Description:
* "Activates" the spirit cutscene (seen in Psychopomp Campaign) where two glowy eyes are spawned then the character Buluk Chabtan speaks.
*
* Arguments:
* None
*
* Public: Yes
*/
eyeLeft = createVehicle ["Reflector_Cone_01_green_F",[6160.96,1793.93,5.28905],[],0,"CAN_COLLIDE"];
eyeRight = createVehicle ["Reflector_Cone_01_green_F",[6159.74,1794.25,5.23316],[],0,"CAN_COLLIDE"];

[] remoteExec ["SESO_fnc_speakBuluk",0, char_buluk_chabtan];