/**
	Description:	
		Updates player's ticket count for Discord Rich Presence on respawn.

	Parameters:
		None

	Returns:
		None
*/

[["UpdateSmallImageText", format["Tickets: %1", [player, nil, true] call BIS_fnc_respawnTickets]]] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);