class ACEX_Fortify_Presets {
    class SESO_ww2_desert_preset {
        displayName = "SESO WW2 Desert Sandbags";
        objects[] = {
			{"Land_Fort_Watchtower_EP1",50},
			{"Land_fortified_nest_big_EP1",100},
			{"Land_fortified_nest_small_EP1",25},
			{"Land_BagFence_Round_F",5},
			{"Land_BagFence_Short_F",5},
			{"Land_BagFence_Long_F",10}
		};
    };

	class SESO_defensive_preset {
        displayName = "Defensive Structures";
        objects[] = {
			{"Land_HBarrier_01_tower_green_F",50},
			{"Land_BagBunker_01_large_green_F",100},
			{"Land_BagBunker_01_small_green_F",25},
			{"Land_CzechHedgehog_01_old_F",10},
			{"Land_BagFence_01_round_green_F",5},
			{"Land_BagFence_01_long_green_F",10}
		};
    };

	class SESO_offensive_preset {
		displayName = "Offensive Structures";
		objects[] = {
			{"I_G_HMG_02_high_F",125},
			{"CUP_B_SPG9_CDF", 200},
			{"LIB_leFH18_AT",250}
		};
	};

	class SESO_logistics_preset {
		displayName = "Logistics Equipment";
		objects[] = {
			{"ACE_Wheel",50},
			{"ACE_Track",50},
			{"Land_CanisterFuel_F",100},
			{"Box_NATO_Support_F",50}
		};
	};

	class SESO_climbing_preset {
		displayName = "Climbing Equipment";
		objects[] = {
			{"Land_Plank_01_4m_F",10},
			{"Land_Plank_01_8m_F",20}
		};
	};

	class SESO_green_combo_preset {
		displayName = "All Equipment and Structures (Green)";
		objects[] = {
			{"Land_HBarrier_01_tower_green_F",5, "SESO_defensive_preset"},
			{"Land_BagBunker_01_large_green_F",5, "SESO_defensive_preset"},
			{"Land_BagBunker_01_small_green_F",2, "SESO_defensive_preset"},
			{"Land_CzechHedgehog_01_old_F",1, "SESO_defensive_preset"},
			{"Land_BagFence_01_round_green_F",1, "SESO_defensive_preset"},
			{"Land_BagFence_01_long_green_F",1, "SESO_defensive_preset"},
			{"CUP_B_CUP_SearchLight_static_US",1, "SESO_offensive_preset"},
			{"I_G_HMG_02_high_F",1, "SESO_offensive_preset"},
			{"CUP_B_Igla_AA_pod_CDF", 2, "SESO_offensive_preset"},
			{"CUP_B_SPG9_CDF", 3, "SESO_offensive_preset"},
			{"CFP_B_USARMY_TOW_TriPod_US", 4, "SESO_offensive_preset"},
			{"cwr3_b_fia_mk19", 5, "SESO_offensive_preset"},
			{"CUP_O_D30_AT_RUS_M_Desert",6, "SESO_offensive_preset"},
			{"LIB_leFH18_AT",3, "SESO_offensive_preset"},
			{"ACE_Wheel",5, "SESO_logistics_preset"},
			{"ACE_Track",5, "SESO_logistics_preset"},
			{"Land_CanisterFuel_F",5, "SESO_logistics_preset"},
			{"Box_NATO_Support_F",1, "SESO_logistics_preset"},
			{"Land_Plank_01_4m_F",1, "SESO_climbing_preset"},
			{"Land_Plank_01_8m_F",2, "SESO_climbing_preset"}
		};
	};
};