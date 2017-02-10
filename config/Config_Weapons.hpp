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
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 6500, 3250, "" },
            { "hgun_Pistol_01_F", "", 7000, 3500, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 9850, 4925, "" },
            { "hgun_ACPC2_F", "", 11500, 5750, "" },
            { "SMG_05_F", "", 18000, 9000, "" }, //Apex DLC
            { "hgun_PDW2000_F", "", 20000, 10000, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250, 125, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, 125, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 1250, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
            { "arifle_TRG20_F", "", 25000, 12500, "" },
            { "arifle_Katiba_F", "", 30000, 15000, "" },
            { "srifle_DMR_01_F", "", 50000, 25000, "" },
            { "arifle_SDAR_F", "", 20000, 10000, "" },
            { "arifle_AK12_F", "", 22000, 11000, "" }, //Apex DLC
            { "arifle_AKS_F", "", 22000, 11000, "" }, //Apex DLC
            { "arifle_AKM_F", "", 22000, 11000, "" }, //Apex DLC
            { "arifle_ARX_blk_F", "", 22000, 11000, "" }, //Apex DLC
            { "arifle_SPAR_01_blk_F", "", 33000, 16500, "" }, //Apex DLC
            { "arifle_CTAR_blk_F", "", 30000, 15000, "" } //Apex DLC
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300, 150, "" },
            { "30Rnd_762x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_green", "", 275, 140, "" },
            { "10Rnd_762x54_Mag", "", 500, 250, "" },
            { "20Rnd_556x45_UW_mag", "", 125, 60, "" },
            { "30Rnd_580x42_Mag_F", "", 125, 60, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500, 1750, "" },
            { "optic_Holosight", "", 3600, 1800, "" },
            { "optic_Hamr", "", 7500, 3750, "" },
            { "acc_flashlight", "", 1000, 500, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, 750, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, 1250, "" },
            { "hgun_ACPC2_F", "", 4500, 2250, "" },
            { "hgun_PDW2000_F", "", 9500, 4750, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950, 475, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
			{ "ACE_fieldDressing", "", 150, 65, "" },
			{ "ACE_packingBandage", "", 150, 65, "" },
			{ "tf_pnr1000a", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "Chemlight_red", "", 300, 150, "" },
            { "Chemlight_yellow", "", 300, 150, "" },
            { "Chemlight_green", "", 300, 150, "" },
            { "Chemlight_blue", "", 300, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, 75, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 250, 25, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, 25, "" },
            { "FirstAidKit", "", 750, 75, "" },
            { "NVGoggles", "", 10000, 1000, "" },
            { "Chemlight_red", "", 1500, 150, "" },
            { "Chemlight_yellow", "", 1500, 150, "" },
            { "Chemlight_green", "", 1500, 150, "" },
            { "Chemlight_blue", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Altis Cop Shop";
        side = "cop";
        conditions = "";
        items[] = {
			{ "ACE_fieldDressing", "", 150, 65, "" },
			{ "ACE_packingBandage", "", 150, 65, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
			{ "tf_anprc148jem", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "HandGrenade_Stone", "", 1700, 850, "" },
            { "hgun_P07_snds_F", "", 2000, 1000, "" },
            { "arifle_SDAR_F", "", 20000, 10000, "" },
            { "hgun_P07_F", "", 7500, 3750, "" },
            { "hgun_P07_khk_F", "", 7500, 3750, "" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 9500, 4750, "call life_coplevel >= 1" },
            { "SMG_02_ACO_F", "", 30000, 15000, "call life_coplevel >= 2" },
            { "arifle_MX_Base_F", "", 35000, 17500, "call life_coplevel >= 2" },
            { "arifle_MX_F", "", 35000, 17500, "call life_coplevel >= 2" },
            { "hgun_ACPC2_F", "", 17500, 8750, "call life_coplevel >= 3" },
            { "arifle_MXC_F", "", 30000, 15000, "call life_coplevel >= 3" },
            { "srifle_DMR_07_blk_F", "", 32000, 16000, "call life_coplevel >= 3" } //Apex DLC Sniper
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "20Rnd_556x45_UW_mag", "", 125, 60, "" },
            { "11Rnd_45ACP_Mag", "", 130, 65, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 130, 65, "call life_coplevel >= 2" },
            { "30Rnd_9x21_Mag", "", 250, 125, "call life_coplevel >= 2" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "call life_coplevel >= 3" },
            { "20Rnd_650x39_Cased_Mag_F", "", 200, 100, "call life_coplevel >= 3" } //Apex DLC
        };
        accs[] = {
            // { "muzzle_snds_L", "", 650, 325, "" },
            // { "optic_MRD", "", 2750, 1375, "call life_coplevel >= 1" },
            // { "acc_flashlight", "", 750, 375, "call life_coplevel >= 2" },
            // { "optic_Holosight", "", 1200, 600, "call life_coplevel >= 2" },
            // { "optic_Arco", "", 2500, 1250, "call life_coplevel >= 2" },
            // { "ACE_optic_Hamr_2D", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_Hamr_PIP", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_Arco_2D", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_Arco_PIP", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_MRCO_2D", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_MRCO_PIP", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_SOS_2D", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_SOS_PIP", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_LRPS_2D", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_LRPS_PIP", "", 2750, 1375, "call life_coplevel >= 2" },
            // { "ACE_optic_DMS", "", 2750, 1375, "call life_coplevel >= 2" }
			{"muzzle_snds_h","",650,325,""},
			{"muzzle_snds_h_khk_F","",650,325,""},
			{"muzzle_snds_h_snd_F","",650,325,""},
			{"muzzle_snds_65_TI_blk_F","",650,325,""},
			{"muzzle_snds_65_TI_hex_F","",650,325,""},
			{"muzzle_snds_65_TI_ghex_F","",650,325,""},
			{"ACE_muzzle_mzls_H","",650,325,""},
			{"muzzle_snds_B","",650,325,""},
			{"muzzle_snds_B_khk_F","",650,325,""},
			{"muzzle_snds_B_snd_F","",650,325,""},
			{"optic_Nightstalker","",650,325,""},
			{"optic_tws","",650,325,""},
			{"optic_tws_mg","",650,325,""},
			{"optic_NVS","",650,325,""},
			{"optic_SOS","",650,325,""},
			{"optic_SOS_khk_F","",650,325,""},
			{"optic_MRCO","",650,325,""},
			{"optic_Arco","",650,325,""},
			{"optic_Arco_ghex_F","",650,325,""},
			{"optic_Arco_blk_F","",650,325,""},
			{"optic_aco","",650,325,""},
			{"optic_ACO_grn","",650,325,""},
			{"optic_aco_smg","",650,325,""},
			{"optic_ACO_grn_smg","",650,325,""},
			{"optic_hamr","",650,325,""},
			{"optic_Hamr_khk_F","",650,325,""},
			{"optic_Holosight","",650,325,""},
			{"optic_Holosight_smg","",650,325,""},
			{"optic_Holosight_blk_F","",650,325,""},
			{"optic_Holosight_khk_F","",650,325,""},
			{"optic_Holosight_smg_blk_F","",650,325,""},
			{"optic_DMS","",650,325,""},
			{"optic_DMS_ghex_F","",650,325,""},
			{"optic_LRPS","",650,325,""},
			{"optic_LRPS_ghex_F","",650,325,""},
			{"optic_LRPS_tna_F","",650,325,""},
			{"optic_AMS","",650,325,""},
			{"optic_AMS_khk","",650,325,""},
			{"optic_AMS_snd","",650,325,""},
			{"optic_KHS_blk","",650,325,""},
			{"optic_KHS_hex","",650,325,""},
			{"optic_KHS_old","",650,325,""},
			{"optic_KHS_tan","",650,325,""},
			{"optic_ERCO_blk_F","",650,325,""},
			{"optic_ERCO_khk_F","",650,325,""},
			{"optic_ERCO_snd_F","",650,325,""},
			{"ACE_optic_Hamr_2D","",650,325,""},
			{"ACE_optic_Hamr_PIP","",650,325,""},
			{"ACE_optic_Arco_2D","",650,325,""},
			{"ACE_optic_Arco_PIP","",650,325,""},
			{"ACE_optic_MRCO_2D","",650,325,""},
			{"ACE_optic_MRCO_PIP","",650,325,""},
			{"ACE_optic_SOS_2D","",650,325,""},
			{"ACE_optic_SOS_PIP","",650,325,""},
			{"ACE_optic_LRPS_2D","",650,325,""},
			{"ACE_optic_LRPS_PIP","",650,325,""},
			{"acc_flashlight","",650,325,""},
			{"acc_pointer_IR","",650,325,""},
			{"ACE_acc_pointer_red","",650,325,""},
			{"ACE_acc_pointer_green","",650,325,""},
			{"ACE_acc_pointer_green_IR","",650,325,""}
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
			{ "ACE_elasticBandage", "", 150, 65, "" },
			{ "ACE_epinephrine", "", 150, 65, "" },
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
			{ "ACE_personalAidKit", "", 150, 65, "" },
			{ "ACE_surgicalKit", "", 150, 65, "" },
			{ "ACE_bodyBag", "", 150, 65, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
			{ "tf_anprc148jem", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 1200, 600, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
