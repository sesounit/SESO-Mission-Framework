/*
* Author: Dildo Sagbag
*
* Description:
* Generates random amounts of ammo and equipment based off nearby units' gear.
*
* Arguments:
* 0: Container for ammunition <OBJECT>
* 1: ACE Arsenal to pre-define additional ammunition, usually from player gear <OBJECT> Default no arsenal
* 2: Distance to check around the container for nearby weapons and ammunition <NUMBER> Default 500
* 3: Clear the box of existing ammo and weapons before adding new ones <BOOLEAN> Default true
*
* Return Value:
* None
*
* Public: Yes
*/
#define PLAYER_UNITS_ITEMS []
params ["_ammoBox", "_arsenal", ["_radiusOfCheck",500], ["_clearBox",true]];

// init lists
private _ammoList = [];
private _weaponList = [];
private _arsenalList = [];
_arsenal = PLAYER_UNITS_ITEMS;

// Get arsenal's items and add to ammo & weapon lists
if (!isNil "_arsenal") then {
	_arsenalList = (_arsenal getVariable ["ace_arsenal_virtualItems", []]);
};

// Add items from nearby units
{
	_ammoList pushBack (magazines _x);
	_weaponList pushBack (weapons _x);
}forEach (_ammoBox nearEntities ["Man", _radiusOfCheck]);

// Flatten list so it can be added to ammoBox
_ammoList = flatten _ammoList;
_weaponList = flatten _weaponList;
if (!isNil "_arsenal" or count _arsenalList <= 0) then {
	_arsenalList = flatten _arsenalList;
	// Filter arsenal list to only include ammo
	_arsenalList = _arsenalList select {_x isKindOf ["Default",configfile >> "CfgMagazines"]};
} else {
	_arsenalList = _ammoList;
};

if (isNil "_ammoList" or count _ammoList <= 0) exitWith {systemChat "ERROR: No player gear set, ending generateAmmo..."};

// Remove gear from box
if (_clearBox == true) then {
	clearMagazineCargoGlobal _ammoBox;
	clearWeaponCargoGlobal _ammoBox;
};

// Add items to box until it reaches random max load at 100%
while { (load _ammoBox) < 1 } do {
//for "_i" from 1 to (random 50) do {
	private _ammoOrWeaponList = [_ammoList, _arsenalList, _weaponList] selectRandomWeighted [0.4, 0.4, 0.2];
	_ammoBox addItemCargoGlobal [selectRandom _ammoOrWeaponList, random 5];
	//sleep 0.5;
};