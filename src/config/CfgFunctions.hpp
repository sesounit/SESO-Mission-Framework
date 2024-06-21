class CfgFunctions
{
	class SESO
	{
		tag = "SESO";

		class misc
		{
			file = "src\functions\misc";
			class areaOfFire;
			class introCamera;
			class introText;
			class teleportToVehicle;
			class generateAmmo;
			class setupTimer;
			class hideMapObjects;
			class detectWarCrime;
			class autoEndMission;
			class simpleConvoy;
			class replaceBadFace;
			class getPlayerUnitsItems;
			class hideGlobalChatWhenUncon;
			class snow;
			class makeAgent;
			class teleportToPoint;
		};

		class map
		{
			file = "src\functions\map";
			class serverFpsLoop;
		};

		class ace
		{
			file = "src\functions\ace";
			class fortifyInit;
			class whistleInit;
			class initArsenalServer;
			class initArsenalPlayer;
			class cutGrassAction;
			class createCutGrassAction;
			class aceMedicalNotifier;
			class mapTag;
			class itemReplace;
		};

		class anim
		{
			file = "src\functions\anim";
			class swimFaster;
			class roleFlags;
			class checkRoles;
		};

		class richPresence
		{
			file = "src\functions\richPresence";
			class initPlayerRichPresence;
			class updatePlayerRPTicketCount;
		};

		class weaponDegrade
		{
			file = "src\functions\weaponDegrade";
			class addAllowedWeapons;
			class handleWeaponOverheating;
			class weaponDegrade;
		}
	};
};