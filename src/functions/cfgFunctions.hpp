class SESO
{
	class Common
	{
		file = "src\functions";
		class immersiveSpawn
		{
			description = "Spawns players immersively";
		};
		class dressPlayer
		{
			description = "Dress players appropriately";
		};
		class dressFaction
		{
			description = "Dress faction units appropriately";
		};
		class activateSpirit
		{
			description = "Activates the temple spirit";
		};
		class speakBuluk
		{
			description = "Buluk Chabtan speaks and deactivates the mission";
		};
		class speakEk
		{
			description = "Ek Chuaj speaks and deactivates the mission";
		};
		class introCamera
		{
			description = "Add intro text and show overview of AO";
		};
		class introText
		{
			description = "Add opening text over the view";
		};
		class canTalk
		{
			description = "Checks unit is able to talk (not dead, unconscious, hostile to player, or in combat)";
		};
		class initArsenalServer
		{
			description = "Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items"
		};
		class initArsenalPlayer
		{
			description = "Initializes arsenals with extra tabs, ability to add current weapon and magazine to arsenal, adds current loadout as a loadout, and an option to add pre-defined list of items"
		};
		class teleportToVehicle
		{
			description = "Using an object, teleport to vehicle";
		};
		class lowerPlayerWeapon
		{
			description = "lowers player weapon";
		};
		class generateAmmo
		{
			description = "Generates random amounts of ammo and equipment based off nearby units' gear.";
		};
		class setupTimer
		{
			description = "Countdown time for setup";
		};
		class hideMapObjects
		{
			description = "Hides map objects around a point";
		};
		class areaOfFire
		{
			description = "Spawns fire and smoke around an area";
		};
		class defineMapLocationsServer
		{
			description = "For when the map creator is lazy and doesn't make locations, you can make ones here!"
		};
		class defineMapLocationsPlayer
		{
			description = "For when the map creator is lazy and doesn't make locations, you can make ones here!"
		};
		class detectWarCrime
		{
			description = "Adds mission handler to report war crimes such as friendly fire, civilian kills, prisoner kills, and surrendered captive kills. Includes detection of war crime by vehicle colission, grenades, and even bleeding out in ACE3."
		};
		class aceMedicalNotifier
		{
			description = "Displays notification on player's screen when they are being treated. Displays notifiaction on another player's screen when they are being treated. Requires CBA3."
		};
		class autoEndMission
		{
			description = "Counts the number of tickets and living operatives (players) in the mission excluding the Zeus. If there are no tickets and no players are alive except the Zeus, mission is failed."
		};
		class simpleConvoy
		{
			description = "https://forums.bohemia.net/forums/topic/226608-simple-convoy-script-release/";
		};
		class iconViewer
		{
			description = "https://forums.bohemia.net/forums/topic/231519-icon-viewer-script/";
		};
		class replaceBadFace
		{
			description = "Replaces custom and default faces with a random other face in vanilla Arma 3."
		};
		class getPlayerUnitsItems
		{
			description = "Gets list of all gear used by all playable units. Best used with initArsenalServer."
		};
		class hideGlobalChatWhenUncon
		{
			description = "Disables Global Chat channel when player gets downed and re-enables it when they are conscious. NEED TO RE-ENABLE CHANNEL WHEN PLAYER RESPAWNS."
		};
		class drawLineServer
		{
			description = "Initializes drawLine."
		};
		class drawLinePlayer
		{
			description = "Draws (poly)lines connecting between markers placed in the eden editor."
		};
		class swimFaster
		{
			description = "Makes unit swim faster when in water."
		};
		class fortifyInit
		{
			description = "Initialize Fortify system, based off Hearts and Minds"
		};
		class whistleInit
		{
			description = "Adds a whistle equipment to all players, self action to whistle short or whistle long."
		};
		class artySupport
		{
			description = "Call artillery support."
		};
		class unconScream
		{
			description = "Randomly scream and moan while unconscious to let nearby players know the player is incapacitated."
		};
		class snow
		{
			description = "https://github.com/Asaayu/Immersed-Weather"
		};
	};
};