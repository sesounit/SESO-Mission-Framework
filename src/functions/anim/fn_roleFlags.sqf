
#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

// Set current speed variable to be compatible with fn_swimFaster
//player setVariable ["SESO_totalSpeed", 1];

// Set MAT Role
if (MAT_CHECK && !LAT_CHECK) then {
    player setVariable ["SESO_MAT_role", true];
};

// Set AA Role
if (AA_CHECK) then {
    player setVariable ["SESO_AA_role", true];
};

// Set Machinegunner Role
if (MG_CHECK) then {
    player setVariable ["SESO_MG_role", true];
};

// Check when taking a weapon from a container or arsenal
private _TAKE_ROLE_FLAGS_ID = player addEventHandler ["Take", {
	params ["_unit"];
    [_unit] call SESO_fnc_checkRoles;
}];

// Check when closing inventory. Necessary because Take EH does not check when dropping a weapon.
private _INV_ROLE_FLAGS_ID = player addEventHandler ["InventoryClosed", {
	params ["_unit"];
    [_unit] call SESO_fnc_checkRoles;
}];

// Prevent exploit where player can drive around to avoid their penalties. At more than 1 penalty, they will not be able to enter any vehicle.
private _CAR_ROLE_FLAGS_ID = player addEventHandler ["GetInMan", {
	params ["_unit"];
    private _penaltyStack = _unit getVariable ["SESO_penaltyStack", 0];

    if (_penaltyStack > 1) then {
        moveOut _unit;
    };
}];