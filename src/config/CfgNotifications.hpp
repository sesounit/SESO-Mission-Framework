class CfgNotifications {
	class MedicalNotif
	{
		title = "MEDICAL TREATMENT";
		iconPicture = "z\ace\addons\medical_gui\ui\cross.paa";
		description = "%1 is treating your %2";
		duration = 8;
	};

	class SetupOverNotif
	{
		title = "SETUP IS OVER";
		iconPicture = "a3\ui_f\data\igui\rsctitles\mpprogress\timer_ca.paa";
		description = "Setup timer has run out. Mission starts now.";
		duration = 10;
	};

	class SetupCanceledNotif
	{
		title = "SETUP IS CANCELED";
		iconPicture = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_exit_cross_ca.paa";
		description = "Setup timer has been cancelled manually by %1";
		duration = 10;
	};
};