/*
* Author: Dildo Sagbag
*
* Description:
* Displays notification on player's screen when they are being treated. Displays notifiaction on another player's screen when they are being treated. Requires CBA3.
*
* Arguments:
* None
*
* Return Value:
* 0: ID of event handler
*
* Example:
* private _MEDICAL_NOTIFIER_ID = [] call SESO_fnc_aceMedicalNotifier;
*
* Public: Yes
*/

#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

private _MEDICAL_NOTIFIER_ID = ["ace_treatmentStarted", {
	params ["_caller", "_target", "_selectionName", "_className", "_itemUser", "_usedItem"];
	// If treating self, exit EH
	if (_caller == _target) exitWith {};
	// Keep track of body part string
	private _bodyPart = "body";
	switch (_selectionName) do
	{
		case  "leftarm" : { _bodyPart = "left arm"; };
		case  "rightarm" : { _bodyPart = "right arm"; };
		case  "leftleg" : { _bodyPart = "left leg"; };
		case  "rightleg" : { _bodyPart = "right arm"; };
		case  "body" : { _bodyPart = "torso"; };
		case  "head" : { _bodyPart = "head"; };
	};
	// Notify target who is treating them and on what body part.
	["MedicalNotif", [name _caller, _bodyPart]] remoteExec ["BIS_fnc_showNotification",_target];
}] call CBA_fnc_addEventHandler;
_MEDICAL_NOTIFIER_ID;