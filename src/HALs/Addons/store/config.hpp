/*
	Macro: ERROR_WITH_TITLE()

	Parameters:
	0: CLASSNAME - Classname of item
	1: PRICE - Default item price
	2: STOCK - Default item stock
__________________________________________________________________*/
#define ITEM(CLASSNAME, PRICE, STOCK)\
	class CLASSNAME {\
		price = PRICE;\
		stock = STOCK;\
	};

class cfgHALsStore {
	containerTypes[] = {"C_IDAP_supplyCrate_F"};
	containerRadius = 10;
	currencySymbol = "$";
	sellFactor = 0.5;
	debug = 1;

	class categories {
		class handguns {
			displayName = "Handguns";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(JMSSA_M1934_pistol, 5, 5);
			ITEM(CUP_hgun_Colt1911, 5, 10);
			ITEM(CUP_hgun_Makarov, 5, 10);
		};
		class launchers {
			displayName = "Rocket Launchers";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			#define RL_STOCK 2
			ITEM(launch_RPG32_F, 3000, RL_STOCK);
			ITEM(launch_RPG32_green_F, 3000, RL_STOCK);
			ITEM(launch_RPG32_ghex_F, 3000, RL_STOCK);
			ITEM(launch_RPG7_F, 3000, 5);
			ITEM(launch_NLAW_F, 4000, RL_STOCK);
			ITEM(launch_B_Titan_F, 5000, RL_STOCK);
			ITEM(launch_I_Titan_F, 5000, RL_STOCK);
			ITEM(launch_O_Titan_F, 5000, RL_STOCK);
			ITEM(launch_O_Titan_ghex_F, 5000, RL_STOCK);
			ITEM(launch_B_Titan_tna_F, 5000, RL_STOCK);
			ITEM(launch_B_Titan_short_F, 5000, RL_STOCK);
			ITEM(launch_I_Titan_short_F, 5000, RL_STOCK);
			ITEM(launch_O_Titan_short_F, 5000, RL_STOCK);
			ITEM(launch_B_Titan_short_tna_F, 5000, RL_STOCK);
			ITEM(launch_O_Titan_short_ghex_F, 5000, RL_STOCK);
			ITEM(launch_I_Titan_eaf_F, 5000, RL_STOCK);
			ITEM(launch_B_Titan_olive_F, 5000, RL_STOCK);
			ITEM(launch_O_Vorona_brown_F, 6000, RL_STOCK);
			ITEM(launch_O_Vorona_green_F, 6000, RL_STOCK);
			ITEM(launch_MRAWS_olive_F, 5500, RL_STOCK);
			ITEM(launch_MRAWS_olive_rail_F, 5000, RL_STOCK);
			ITEM(launch_MRAWS_green_F, 5500, RL_STOCK);
			ITEM(launch_MRAWS_green_rail_F, 5000, RL_STOCK);
			ITEM(launch_MRAWS_sand_F, 5500, RL_STOCK);
			ITEM(launch_MRAWS_sand_rail_F, 5000, RL_STOCK);
		};
		class navigation {
			displayName = "Navigation";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			#define NN_STOCK 50
			ITEM(ItemWatch, 50, NN_STOCK);
			ITEM(ItemGPS, 100, NN_STOCK);
			ITEM(ItemMap, 75, NN_STOCK);
			ITEM(ItemCompass, 75, NN_STOCK);
			ITEM(ItemRadio, 75, NN_STOCK);
			ITEM(Binocular, 200, NN_STOCK);
			ITEM(Rangefinder, 400, NN_STOCK);
			ITEM(Laserdesignator, 750, NN_STOCK);
			ITEM(Laserdesignator_02, 750, NN_STOCK);
			ITEM(Laserdesignator_03, 750, NN_STOCK);
			ITEM(NVGoggles, 500, NN_STOCK);
			ITEM(NVGoggles_INDEP, 500, NN_STOCK);
			ITEM(NVGoggles_OPFOR, 500, NN_STOCK);
			ITEM(NVGoggles_tna_F, 500, NN_STOCK);
			ITEM(O_NVGoggles_hex_F, 500, NN_STOCK);
			ITEM(O_NVGoggles_urb_F, 500, NN_STOCK);
			ITEM(O_NVGoggles_ghex_F, 500, NN_STOCK);
			ITEM(NVGogglesB_blk_F, 3000, NN_STOCK);
			ITEM(NVGogglesB_grn_F, 3000, NN_STOCK);
			ITEM(NVGogglesB_gry_F, 3000, NN_STOCK);
			ITEM(O_NVGoggles_grn_F, 500, NN_STOCK);
		};
		class underbarrel {
			displayName = "Underbarrel Accessories";
			picture = "";

			#define UB_STOCK 10
			ITEM(bipod_02_F_arid, 75, UB_STOCK);
			ITEM(bipod_03_F_blk, 75, UB_STOCK);
			ITEM(bipod_02_F_blk, 75, UB_STOCK);
			ITEM(bipod_01_F_blk, 75, UB_STOCK);
			ITEM(bipod_02_F_hex, 75, UB_STOCK);
			ITEM(bipod_01_F_khk, 75, UB_STOCK);
			ITEM(bipod_02_F_lush, 75, UB_STOCK);
			ITEM(bipod_01_F_mtp, 75, UB_STOCK);
			ITEM(bipod_03_F_oli, 75, UB_STOCK);
			ITEM(bipod_01_F_snd, 75, UB_STOCK);
			ITEM(bipod_02_F_tan, 75, UB_STOCK);
		};
		class pointers {
			displayName = "Pointer Accessories";
			picture = "";

			#define PN_STOCK 10
			ITEM(cup_acc_flashlight_wdl, 300, 10);
			ITEM(cup_acc_flashlight, 300, 10);
		};
		class smgs {
			displayName = "Submachine guns";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(CUP_smg_MP5A5, 700, 5);
			ITEM(CUP_smg_MP5A5_Rail, 700, 5);
			ITEM(CUP_smg_MP5A5_Rail_AFG, 700, 5);
			ITEM(CUP_smg_MP5A5_Rail_VFG, 700, 5);
			ITEM(CUP_smg_MP5SD6, 1000, 5);
		};

		class rifles {
			displayName = "Rifles";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(CUP_arifle_FNFAL5061_wooden, 1000, 5);
			ITEM(CUP_arifle_FNFAL5060_rhodesian, 1000, 5);
			ITEM(CUP_arifle_FNFAL5060, 1000, 5);
			ITEM(CUP_arifle_AKM_Early, 1000, 5);
			ITEM(CUP_arifle_AK74_Early, 1000, 5);
			ITEM(CUP_arifle_AK47_Early, 1000, 5);
			ITEM(CUP_arifle_AKMS_Early, 1000, 5);
			ITEM(CUP_arifle_M16A1, 1000, 5);
			ITEM(CUP_arifle_M16A1E1, 1000, 5);
			ITEM(CUP_arifle_M16A2, 1000, 5);
		};


		class muzzles {
			displayName = "Muzzle Accessories";
			picture = "";


			ITEM(cup_muzzle_mfsup_flashhider_762x51_black, 50, 5);
			ITEM(cup_muzzle_mfsup_flashhider_762x51_od, 50, 5);
			ITEM(ace_muzzle_mzls_smg_02, 50, 5);
			ITEM(cup_muzzle_snds_m9, 50, 5);
		};
		class optics {
			displayName = "Optics Accessories";
			picture = "";

			ITEM(cup_optic_acog_ta01b_black,350,5);
			ITEM(cup_optic_acog_ta01b_od,350,5);
			
		};
		class magazines {
			displayName = "Magazines";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			ITEM(CUP_30Rnd_762x39_AK47_M,100,50);
			ITEM(CUP_30Rnd_762x39_AK47_bakelite_M,100,50);
			ITEM(CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M,100,50);
			ITEM(CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M,100,50);
			ITEM(CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M,135,50);
			ITEM(CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M,250,50);
			ITEM(CUP_30Rnd_556x45_Stanag_Tracer_Green,50,50);
			ITEM(CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green,50,50);
			ITEM(CUP_7Rnd_50AE_Deagle,50,50);
			ITEM(CUP_8Rnd_9x18_Makarov_M,25,50);
			ITEM(CUP_7Rnd_45ACP_1911,40,50);
			ITEM(CUP_30Rnd_9x19_MP5, 90, 5);
			ITEM(CUP_30Rnd_Green_Tracer_9x19_MP5, 90, 5);
		};
		class mmgs {
			displayName = "Machine Guns";
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(CUP_lmg_minimi,5000,5);
			ITEM(CUP_lmg_minimi_railed,5000,5);
			ITEM(CUP_arifle_RPK74,5000,5);
		};
	};

	class stores {

		class weapon {
			displayName = "Weapons Store";
			categories[] = {"handguns", "mmgs", "optics", "muzzles", "pointers","rifles", "smgs"};
		};
	};
};
