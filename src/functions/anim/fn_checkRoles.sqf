#include "..\script_component.hpp"

params ["_unit"];
private _speedMultiplier = parseNumber (missionNamespace getVariable "SESO_setting_RoleFlagMultiplier");
private _penaltyStack = 0;
private _totalSpeed = 1;
// Determine Penalty Stacks
if ((MG_CHECK) and !(player getVariable ["SESO_MG_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with Machine Guns, this will slow me down.";
};
if ((MAT_CHECK) and !(LAT_CHECK) and !(player getVariable ["SESO_MAT_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with MAT Launchers, this will slow me down.";
};
if ((AA_CHECK) and !(player getVariable ["SESO_AA_role", false])) then {
    _penaltyStack = _penaltyStack + 1;
    systemChat "I'm not familiar with AA Launchers, this will slow me down.";
};

_unit setVariable ["SESO_penaltyStack", _penaltyStack];

private _totalSpeed = _totalSpeed * (_speedMultiplier ^ _penaltyStack);
_unit setVariable ["SESO_totalSpeed", _totalSpeed];

_penaltyStack;