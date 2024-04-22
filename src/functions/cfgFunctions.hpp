class SESO
{
	tag = "SESO";

	class Misc
	{
		file = "src\functions\misc";
		class areaOfFire {};
		class artySupport {};
		class canTalk {};
		class dressPlayer {};
		class dressFaction {};
		class introCamera {};
		class introText {};
		class teleportToVehicle {};
		class generateAmmo {};
		class setupTimer {};
		class hideMapObjects {};
		class detectWarCrime {};
		class autoEndMission {};
		class simpleConvoy {};
		class replaceBadFace {};
		class getPlayerUnitsItems {};
		class hideGlobalChatWhenUncon {};
		class snow {};
	};

	class Map
	{
		file = "src\functions\map";
		class defineMapLocationsServer {};
		class defineMapLocationsPlayer {};
		class serverFpsLoop {};
	}

	class ACE
	{
		file = "src\functions\ace";
		class fortifyInit {};
		class whistleInit {};
		class initArsenalServer {};
		class initArsenalPlayer {};
		class cutGrassAction {};
		class createCutGrassAction {};
		class aceMedicalNotifier {};
	};

	class Anim
	{
		file = "src\functions\anim";
		class swimFaster {};
		class roleFlags {};
		class checkRoles {};
	};

	class RichPresence
	{
		file = "src\functions\richPresence";
		class initPlayerRichPresence {};
		class updatePlayerRPTicketCount {};
	}
};