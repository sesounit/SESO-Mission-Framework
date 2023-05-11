/*
* Author: Dildo Sagbag
*
* Description:
* Checks and returns true if the speaker is alive, conscious, calm (not in combat or stealth), and not fleeing. Additional check is SPEAKER_FRIENDLY (sides of speaker and player are the same).
*
* Arguments:
* 0: The unit that is speaking to the player
*
* Return Value:
* Whether the unit is permitted to talk <BOOLEAN>
*
* Example:
* [bob] call SESO_fnc_canTalk;
*
* Public: Yes
*/

// Check speaker is alive
#define SPEAKER_ALIVE (alive _speaker)
// Check speaker is NOT unconscious
#define SPEAKER_CONSCIOUS !(_speaker getVariable ['ACE_isUnconscious', false])
// Check speaker and player are friendly
//#define SPEAKER_FRIENDLY ([(side _speaker), (side _player)] call BIS_fnc_sideIsFriendly)
// Check speaker is not in combat
#define SPEAKER_CALM (((behaviour _speaker) != "COMBAT") && ((behaviour _speaker) != "STEALTH"))
// Check speaker is not fleeing
#define SPEAKER_STAYING !(fleeing _speaker)


params ["_speaker"];

if (SPEAKER_ALIVE && SPEAKER_CONSCIOUS && SPEAKER_CALM && SPEAKER_STAYING) then {
	true
} else {
	false
};