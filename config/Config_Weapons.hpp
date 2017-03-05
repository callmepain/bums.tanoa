/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/

class WeaponShops 
{
    //Armory Shops civs und so ein kack kram
    class gun 
	{
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = 
		{
            { "CUP_srifle_CZ550", "", 50000, 25000, "" },
            { "hgun_PDW2000_F", "", 35000, 15000, "" }, 
            { "arifle_SDAR_F", "", 30000, 15000, "" },
            { "hgun_ACPC2_F", "", 10000, 5000, "" },
            { "CUP_hgun_Duty", "",7500, 3500, "" },
			{ "CUP_hgun_Phantom", "",7500, 3500, "" },
			{ "CUP_hgun_Colt1911", "",10000, 5000, "" },
			{ "hgun_P07_F", "",7500, 3500, "" },
			{ "hgun_Rook40_F", "",6500, 3000, "" },
			{ "CUP_hgun_TaurusTracker455_gold", "",8000, 4000, "" },
			{ "hgun_Pistol_heavy_02_F", "",8500, 4000, "" }
        };
        mags[] = 
		{
            { "CUP_5x_22_LR_17_HMR_M", "", 400,200, "" },
            { "30Rnd_9x21_Mag", "", 300, 150, "" },
            { "20Rnd_556x45_UW_mag", "", 300, 150, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
			{ "16Rnd_9x21_Mag", "", 150, 75, "" },
			{ "CUP_18Rnd_9x19_Phantom", "", 150, 75, "" },
			{ "CUP_7Rnd_45ACP_1911", "", 200, 100, "" },
			{ "CUP_6Rnd_45ACP_M", "", 200, 100, "" },
			{ "6Rnd_45ACP_Cylinder", "", 200, 100, "" }
        };
        accs[] = 
		{
            //{ "optic_Aco", "", 1000, 500, "" }
        };
    };

	// Schwarzmarkt deine mudda 
	class rebel 
	{
		name = "Mohammed's Jihadi Shop";
		side = "civ";
		conditions = "license_civ_gun";
		items[] = 
		{
			{ "CUP_arifle_AK47", "", 250000, 125000, "" },
			{ "arifle_CTAR_ghex_F", "", 150000, 75000, "" },			
			{ "arifle_MXC_khk_F", "", 100000, 50000, "" },
			{ "arifle_SPAR_01_blk_F", "", 150000, 75000, "" },
			{ "CUP_arifle_XM8_Compact", "", 160000, 75000, "" },
			{ "CUP_arifle_AKS_Gold", "", 250000, 125000, "" },
			{ "arifle_Katiba_F", "", 150000, 75000, "" },
			{ "CUP_srifle_L129A1", "", 250000, 125000, "" },
			{ "CUP_arifle_L85A2_NG", "", 180000, 12500, "" },
			{ "CUP_arifle_G36K_camo", "", 160000, 75000, "" },
			{ "CUP_srifle_CZ750", "", 480000, 240000, "" },
			{ "CUP_srifle_M14_DMR", "", 750000, 350000, "" },
			{ "CUP_srifle_VSSVintorez", "", 250000, 125000, "" },
			{ "hgun_Pistol_heavy_01_F", "", 50000, 25000, "" },
			{ "CUP_hgun_MicroUzi", "", 75000, 35000, "" }
		};
		mags[] = 
		{
			{ "CUP_30Rnd_762x39_AK47_M", "",   1500, 750, "" },
			{ "30Rnd_580x42_Mag_Tracer_F", "",   800, 400, "" },
			{ "30Rnd_580x42_Mag_F", "",   800, 400, "" },
			{ "30Rnd_65x39_caseless_mag", "", 650, 325, "" },
			{ "30Rnd_556x45_Stanag", "",   800, 400, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "",   800, 400, "" },
			{ "CUP_30Rnd_556x45_G36", "",   800, 400, "" },
			{ "30Rnd_65x39_caseless_green", "",   800, 400, "" },
			{ "CUP_30Rnd_556x45_Stanag", "",   800, 400, "" },
			{ "CUP_10Rnd_762x51_CZ750_Tracer", "",   1500, 750, "" },
			{ "CUP_20Rnd_762x51_DMR", "",   5000, 2500, "" },			
			{ "CUP_10Rnd_9x39_SP5_VSS_M", "", 1000, 500, "" },
			{ "11Rnd_45ACP_Mag", "",  400, 200, "" },
			{ "CUP_30Rnd_9x19_UZI", "", 400, 200, "" }
			
		};
		accs[] = 
		{
			{ "CUP_optic_Kobra", "", 15000, 7500, "" },
			{ "optic_ERCO_khk_F", "", 15000, 7500, "" },
			{ "muzzle_snds_58_ghex_F", "", 5000, 2500, "" },
			{ "optic_Arco_ghex_F", "", 15000, 7500, "" },
			{ "muzzle_snds_H_khk_F", "", 5000, 2500, "" },
			{ "optic_Hamr", "", 15000, 7500, "" },
			{ "muzzle_snds_M", "", 5000, 2500, "" },
			{ "bipod_01_F_blk", "", 3500, 1700, "" },
			{ "optic_Arco_blk_F", "", 15000, 7500, "" },
			{ "CUP_optic_HoloBlack", "", 5000, 2500, "" },
			{ "CUP_muzzle_snds_L85", "", 1000, 500, "" },
			{ "CUP_muzzle_snds_G36_desert", "", 5000, 2500, "" },
			{ "CUP_optic_SB_11_4x20_PM", "", 25000, 12500, "" },
			{ "CUP_bipod_Harris_1A2_L", "", 3500, 1750, "" },
			{ "CUP_optic_LeupoldMk4", "", 35000, 17500, "" },
			{ "CUP_optic_PSO_1", "", 25000, 12500, "" },
			{ "optic_MRD", "", 4000, 2000, "" },
			{ "muzzle_snds_acp", "", 1000, 500, "" },
			{ "CUP_muzzle_snds_MicroUzi", "", 1000, 500, "" }		
		};
	};
	
    class gang 
	{
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
         items[] = 
		 {
            { "CUP_arifle_AKS74U", "", 120000, 60000, "" },
            { "arifle_Mk20_plain_F", "", 120000, 60000, "" }, 
            { "arifle_TRG21_F", "", 120000, 60000, "" },
            { "CUP_smg_EVO", "", 75000, 30000, "" }, 
            { "SMG_01_F", "", 75000, 30000, "" }, 			
            { "CUP_smg_bizon", "", 85000, 40000, "" }, 
			{ "CUP_hgun_SA61", "", 50000, 25000, "" }			
        };
        mags[] = 
		{
            { "CUP_30Rnd_545x39_AK_M", "", 650, 325, "" },
            { "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "", 650, 325, "" },
            { "30Rnd_556x45_Stanag", "", 600, 300, "" },
            { "CUP_20Rnd_762x51_L129_M", "", 1500, 750, "" },
            { "CUP_30Rnd_9x19_EVO", "", 350, 125, "" },
			{ "30Rnd_9x21_Mag", "", 350, 125, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 350, 125, "" },			
            { "30Rnd_45ACP_Mag_SMG_01_Tracer_Red", "", 350, 125, "" },
			{ "CUP_64Rnd_9x19_Bizon_M", "", 500, 250, "" },
			{ "CUP_64Rnd_White_Tracer_9x19_Bizon_M", "", 500, 250, "" },
			{ "CUP_20Rnd_B_765x17_Ball_M", "", 400, 200, "" }			
        };
        accs[] = 
		{
            { "CUP_optic_Kobra", "", 7500, 3750, "" },
            { "CUP_muzzle_Bizon", "", 3500, 1750, "" },
            { "optic_Aco_smg", "", 5000, 2500, "" },
            { "CUP_optic_CompM4", "", 10000, 5000, "" },
            { "muzzle_snds_L", "", 1000, 500, "" },
			{ "muzzle_snds_acp", "", 1000, 500, "" }			
		};
    };

    //Basic Shops
    class genstore 
	{
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = 
		{
			{ "ACE_fieldDressing", "", 150, 65, "" },
			{ "ACE_packingBandage", "", 150, 65, "" },
			{ "tf_fadak", "", 5000, -1, "" },
			{ "tf_anprc155", "", 10000, -1, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, 25, "" },
            { "NVGoggles_tna_F", "", 2000, 1000, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
            { "ACE_Chemlight_HiOrange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiRed", "", 1500, 150, "" },
            { "ACE_Chemlight_HiYellow", "", 1500, 150, "" },
			{ "ACE_Chemlight_Orange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiWhite", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store 
	{
        name = "Tanoa Fuel Station Store";
        side = "";
        conditions = "";
        items[] = 
		{
            { "Binocular", "", 750, 75, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 250, 25, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, 25, "" },
            { "NVGoggles_tna_F", "", 10000, 1000, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
            { "ACE_Chemlight_HiOrange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiRed", "", 1500, 150, "" },
            { "ACE_Chemlight_HiYellow", "", 1500, 150, "" },
			{ "ACE_Chemlight_Orange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiWhite", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic 
	{
        name = "Tanoa Cop Shop";
        side = "cop";
        conditions = "";
        items[] = 
		{
			{ "ACE_fieldDressing", "", 150, 65, "" },
			{ "ACE_packingBandage", "", 150, 65, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
			{ "ACE_CableTie", "", 1500, 150, "" },
			{ "tf_anprc148jem", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
            { "NVGoggles_tna_F", "", 2000, 1000, "" },
            { "HandGrenade_Stone", "", 1700, 950, "" },
			{ "CUP_arifle_M16A4_Base", "", 1500, 750, "call life_coplevel >= 3" },
            { "CUP_arifle_M4A1_black", "", 1500, 15000, "call life_coplevel >= 6" },
            { "CUP_arifle_M4A1_desert", "", 1200, 600, "call life_coplevel >= 1" },
            { "CUP_srifle_M24_wdl", "", 15000, 7500, "call life_coplevel >= 1" },
            { "CUP_srifle_Mk12SPR", "", 10000, 5000, "call life_coplevel >= 1" },
            { "CUP_smg_MP5A5", "", 17500, 8500, "call life_coplevel >= 2" },
            { "CUP_smg_MP5SD6", "", 17500, 8500, "call life_coplevel >= 4" },
            { "SMG_05_F","", 15000, 7500, "call life_coplevel >= 2" },
            { "CUP_sgun_M1014", "", 30000, 15000, "call life_coplevel >= 5" },
            { "CUP_hgun_Glock17", "", 15000, 7500, "call life_coplevel >= 3" },
            { "CUP_hgun_M9", "", 18000, 9000, "call life_coplevel >= 4" },
            { "CUP_hgun_BallisticShield_Armed", "", 17500, 8750, "call life_coplevel >= 3" }      
        };
        mags[] = 
		{
            { "CUP_30Rnd_556x45_Stanag", "", 125, 60, "" },
            { "CUP_5Rnd_762x51_M24", "", 130, 65, "" },
            { "CUP_20Rnd_556x45_Stanag", "", 130, 65, "" },
            { "CUP_30Rnd_9x19_MP5", "", 250, 125, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 200, 100, "" },
            { "CUP_8Rnd_B_Beneli_74Slug", "", 125, 60, "" },
            { "CUP_17Rnd_9x19_glock17", "", 125, 60, "" },
            { "CUP_15Rnd_9x19_M9", "", 130, 65, "" }
        };
        accs[] = 
		{
            { "optic_Arco_blk_F", "", 3500, 1750, "call life_coplevel >= 2" },
            { "CUP_optic_CompM4", "", 3600, 1800, "call life_coplevel >= 1" },
            { "optic_Hamr", "", 4000, 2000, "call life_coplevel >= 2" },
            { "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "", 1000, 500, "call life_coplevel >= 2" },
            { "CUP_bipod_Harris_1A2_L", "", 3500, 1750, "call life_coplevel >= 2" },
            { "muzzle_snds_B_snd_F", "", 3600, 1800, "call life_coplevel >= 2" },
            { "optic_DMS", "", 7500, 3750, "call life_coplevel >= 5" },
            { "optic_ACO_grn", "", 1000, 500, "call life_coplevel >= 1" },
            { "muzzle_snds_L", "", 1000, 500, "call life_coplevel >= 1" },
            { "CUP_muzzle_snds_M9", "", 1000, 500, "call life_coplevel >= 1" },
            { "bipod_01_F_blk", "", 1000, 500, "call life_coplevel >= 1" }			
		};
	};

    //Medic Shops
    class med_basic 
	{
        name = "store";
        side = "med";
        conditions = "";
        items[] = 
		{
			{ "ACE_elasticBandage", "", 150, 65, "" },
			{ "ACE_epinephrine", "", 150, 65, "" },
			{ "ACE_atropine", "", 150, 65, "" },
			{ "ACE_morphine", "", 150, 65, "" },
			{ "ACE_fieldDressing", "", 150, 65, "" },
			{ "ACE_packingBandage", "", 150, 65, "" },
			{ "ACE_quikclot", "", 150, 65, "" },
			{ "ACE_plasmaIV_250", "", 150, 65, "" },
			{ "ACE_plasmaIV_500", "", 150, 65, "" },
			{ "ACE_salineIV_250", "", 150, 65, "" },
			{ "ACE_salineIV_500", "", 150, 65, "" },
			{ "ACE_bloodIV_250", "", 150, 65, "" },
			{ "ACE_bloodIV_500", "", 150, 65, "" },
			{ "ACE_bloodIV", "", 150, 65, "" },
			{ "ACE_personalAidKit", "", 150, 65, "" },
			{ "ACE_surgicalKit", "", 150, 65, "" },
			{ "ACE_bodyBag", "", 150, 65, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
			{ "tf_anprc148jem", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "NVGoggles_tna_F", "", 1200, 600, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
			{ "ACE_Chemlight_HiOrange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiRed", "", 1500, 150, "" },
            { "ACE_Chemlight_HiYellow", "", 1500, 150, "" },
			{ "ACE_Chemlight_Orange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiWhite", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };
	
	class adac_basic 
	{
        name = "store";
        side = "adac";
        conditions = "";
        items[] = 
		{
			{ "ACE_EarPlugs", "", 150, -1, "" },
			{ "tf_anprc148jem", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "NVGoggles_tna_F", "", 1200, 600, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
			{ "ACE_Chemlight_HiOrange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiRed", "", 1500, 150, "" },
            { "ACE_Chemlight_HiYellow", "", 1500, 150, "" },
			{ "ACE_Chemlight_Orange", "", 1500, 150, "" },
            { "ACE_Chemlight_HiWhite", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};