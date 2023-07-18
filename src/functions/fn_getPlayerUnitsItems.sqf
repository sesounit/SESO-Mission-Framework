/*
* Author: Dildo Sagbag
*
* Description:
* Gets list of all gear used by all playable units. Best used with initArsenalServer.
*
* Arguments:
* None
*
* Return Value:
* List of item class names <ARRAY>
*
*
* Public: Yes
*/

private _playersLoadouts = [];
{
	// Collect all units loadouts into a single list
	_playersLoadouts pushBack (getUnitLoadout _x);
}forEach (playableUnits + switchableUnits);

// Flatten list into one level
private _allPlayersItems = (flatten _playersLoadouts);

// Remove duplicates, non-strings, and empty strings
_allPlayersItems = _allPlayersItems arrayIntersect _allPlayersItems select {_x isEqualType "" && {_x != ""}};

_allPlayersItems;