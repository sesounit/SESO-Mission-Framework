/*
* Author: Dildo Sagbag
*
* Description:
* Example script to demonstrate how to make a custom cutscene
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* None
*
* Public: Yes
*/

char_ek_chuaj setName ["Ek Chuaj","Ek","Chuaj"];

[player] call ACE_medical_treatment_fnc_fullHealLocal;						// Heal player
if (vehicle player == player) then { moveOut player };								// If player in vehicle, move them out
player setPos [3290.8,2395.03,0];									// Move player to ritual spot
player setDir ((direction player) + (player getRelDir [3281,2390.5,0.16258]));	// Rotate player to ek

player enableSimulationGlobal false;										// Freeze player in place
player hideObjectGlobal true;												// Hide player's hands

[] spawn {
	playMusic ["AmbientTrack01a_F_EXP", 0];
	cutText ["", "BLACK FADED", 5];
	0.1 fadeSound 0;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;
	cutText ["", "BLACK IN", 7];
	sleep 5;
	[
		[char_ek_chuaj],
		[
			"Who has disturbed Ek Chuaj's private domain? You...",
			"I know you, you are Buluk Chabtan's lackeys. Mere goons brought to this Earth to harm my commerce. I am Ek Chuaj, god of commerce and cocoa. There is nothing that can harm me.",
			"It was I that defeated your boss Buluk Chabtan and cast him to Cizin. This time, I will defeat him again, and you will go with him. My champion is a deadly snake warrior, who schemes tirelessly against you.",
			"He's a handsome, powerful, green-skinned warrior who has kept my reign supreme on this land. You are seeking him and you call him Malverde.",
			"Yes, cower, boil in envy. He is more powerful, handsome, and healthy than you. If you were wise, you would bow to me now and plead mercy. But pity, a trades god waits for the best bargain first.",
			"I know you have come for your feeble peasant Dylan Rocker. I will release him for you as a gift. Afterall, what is commerce without competition?", 
			"Until we meet again, warriors of Buluk Chabtan, if you manage that far.",
			"Now, away with you!"
		],
		"DIRECT",
		true
	] call IP_fnc_simpleConversation;

	cutText ["", "BLACK OUT", 4];
	sleep 4;

	5 fadeMusic 0;
	5 fadeSound 1;

	player setPos [3280.78,2420.16,0];
	dylan setPos [3280.78,2420.16,0];
	blocker enableSimulation true;
	blocker hideObject false;

	cutText ["", "BLACK IN", 5];
	sleep 5;

	playMusic "";


	player enableSimulationGlobal true;										// Freeze player in place
	player hideObjectGlobal false;												// Hide player's hands
};