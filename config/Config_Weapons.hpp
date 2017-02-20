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
            { "hgun_mas_mak_F", "", 6000, 3000, "" },
            { "hgun_mas_uzi_F", "", 15000, 7500, "" }, 
            { "hgun_mas_acp_F", "", 9000, 4500, "" },
            { "hgun_mas_m9_F", "", 7500, 3750, "" },
            { "hgun_mas_p226_F", "",8000, 4000, "" }
        };
        mags[] = 
		{
            { "8Rnd_mas_9x18_Mag", "", 125, 60, "" },
            { "25Rnd_mas_9x19_Mag", "", 150, 75, "" },
            { "12Rnd_mas_45acp_Mag", "", 200, 100, "" },
            { "17Rnd_mas_9x21_Mag", "", 250, 125, "" }
        };
        accs[] = 
		{
            { "optic_ACO_grn_smg", "", 2500, 1250, "" }
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
			{ "hgun_mas_grach_F", "", 20000, 10000, "" },
			{ "arifle_mas_akm", "", 50000, 25000, "" },			
			{ "arifle_mas_aks74", "", 35000, 17500, "" },
			{ "arifle_mas_aks74u", "", 33000, 16500, "" },
			{ "arifle_mas_fal", "", 22000, 11000, "" },
			{ "arifle_mas_lee", "", 22000, 11000, "" },
			{ "arifle_mas_mp40", "", 30000, 15000, "" },			
			{ "srifle_mas_svd", "", 25000, 12500, "" },
			{ "srifle_mas_vss", "", 22000, 11000, "" }
		};
		mags[] = 
		{
			{ "5Rnd_mas_762x51_Stanag", "",   125, 60, "" },
			{ "8Rnd_mas_9x18_Mag", "",   150, 75, "" },
			{ "10Rnd_mas_762x54_mag", "", 175, 85, "" },
			{ "13Rnd_mas_9x21_Mag", "",   200, 100, "" },
			{ "15Rnd_mas_9x21_Mag", "",   225, 112, "" },
			{ "17Rnd_mas_9x21_Mag", "",   275, 135, "" },
			{ "20Rnd_762x51_Mag", "",   400, 200, "" },
			{ "20Rnd_mas_762x51_Stanag", "",   400, 200, "" },
			{ "20Rnd_mas_762x51_T_Stanag", "",   400, 200, "" },
			{ "20Rnd_mas_9x39_mag", "", 400, 200, "" },
			{ "30Rnd_mas_545x39_T_mag", "",   500, 250, "" },
			{ "30Rnd_mas_545x39_mag", "",   500, 250, "" },			
			{ "30Rnd_mas_762x39_T_mag", "", 500, 250, "" },
			{ "30Rnd_mas_762x39_mag", "",  500, 250, "" },
			{ "30Rnd_mas_9x21_Stanag", "", 500, 250, "" }
			
		};
		accs[] = 
		{
			{ "optic_mas_acog"", ", 3500, 1750, "" },
			{ "optic_mas_aim"", ", 3600, 1800, "" },
			{ "optic_mas_Arco_blk", "", 4000, 2000, "" },
			{ "optic_mas_MRCO_camo", "", 3500, 1750, "" },
			{ "optic_mas_kobra_c", "", 3500, 1750, "" },
			{ "acc_flashlight"", ", 1000, 500, "" },
			{ "bipod_02_F_blk", "", 1000, 500, "" }			
		};
	};
	
    class gang 
	{
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
         items[] = 
		 {
            { "hgun_mas_mak_F", "", 6000, 3000, "" },
            { "hgun_mas_uzi_F", "", 15000, 7500, "" }, 
            { "hgun_mas_acp_F", "", 9000, 4500, "" },
            { "hgun_mas_m9_F", "", 7500, 3750, "" },
            { "hgun_mas_p226_F", "", 8000, 4000, "" }, 
            { "arifle_mas_m1014", "", 12000, 6000, "" }, 			
            { "arifle_mas_lee", "", 28000, 14000, "" }, 		
        };
        mags[] = 
		{
            { "8Rnd_mas_9x18_Mag", "", 125, 60, "" },
            { "25Rnd_mas_9x19_Mag", "", 150, 75, "" },
            { "12Rnd_mas_45acp_Mag", "", 200, 100, "" },
            { "17Rnd_mas_9x21_Mag", "", 250, 125, "" },
            { "17Rnd_mas_9x21_Mag", "", 250, 125, "" },
            { "7Rnd_mas_12Gauge_Slug", "", 250, 125, "" },			
            { "5Rnd_mas_762x51_Stanag", "", 250, 125, "" },			
        };
        accs[] = 
		{
            { "optic_mas_acog"", ", 3500, 1750, "" },
            { "optic_mas_aim"", ", 3600, 1800, "" },
            { "optic_mas_Arco_blk", "", 4000, 2000, "" },
            { "optic_mas_MRCO_camo", "", 3500, 1750, "" },
            { "acc_flashlight"", ", 1000, 500, "" },
            { "bipod_02_F_blk", "", 1000, 500, "" }			
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
			{ "tf_pnr1000a", "", 150, -1, "" },
			{ "tf_anprc155", "", 150, -1, "" },
			{ "ACE_EarPlugs", "", 150, -1, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles_mas_h", "", 2000, 1000, "" },
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
        name = "Altis Fuel Station Store";
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
            { "FirstAidKit", "", 750, 75, "" },
            { "NVGoggles_mas_h", "", 10000, 1000, "" },
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
        name = "Altis Cop Shop";
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
            { "FirstAidKit", "", 150, 75, "" },
			{ "ACE_Flashlight_XL50", "", 1500, 150, "" },
            { "NVGoggles_mas_h", "", 2000, 1000, "" },
            { "HandGrenade_Stone", "", 1700, 950, "" },
			{ "hgun_mas_glock_F", "", 1500, 750, "call life_coplevel >= 3" },
            { "hgun_Pistol_heavy_02_F", "", 1500, 15000, "call life_coplevel >= 6" },
            { "hgun_mas_acp_F", "", 1200, 600, "call life_coplevel >= 1" },
            { "arifle_mas_mp5sd_ds", "", 15000, 7500, "call life_coplevel >= 1" },
            { "arifle_mas_mp5", "", 10000, 5000, "call life_coplevel >= 1" },
            { "arifle_mas_m4c", "", 17500, 8500, "call life_coplevel >= 2" },
            { "arifle_mas_m4_m203", "", 17500, 8500, "call life_coplevel >= 4" },
            { "arifle_mas_m4","", 15000, 7500, "call life_coplevel >= 2" },
            { "srifle_mas_m24", "", 30000, 15000, "call life_coplevel >= 5" },
            { "arifle_mas_m16", "", 15000, 7500, "call life_coplevel >= 3" },
            { "arifle_mas_m16_gl", "", 18000, 9000, "call life_coplevel >= 4" },
            { "arifle_mas_m14", "", 17500, 8750, "call life_coplevel >= 3" },
            { "srifle_mas_hk417", "", 40000, 20000, "call life_coplevel >= 7" },
            { "arifle_mas_hk416", "", 32000, 16000, "call life_coplevel >= 7" },
            { "arifle_mas_hk416c", "", 30000, 15000, "call life_coplevel >= 7" },
            { "arifle_mas_hk416_m203c", "", 35000, 17500, "call life_coplevel >= 7" },
            { "arifle_mas_m1014", "", 5000, 2500, "call life_coplevel >= 2" }            
        };
        mags[] = 
		{
            { "30Rnd_mas_9x21_Stanag", "", 125, 60, "" },
            { "30Rnd_mas_556x45_Stanag", "", 130, 65, "" },
            { "3Rnd_SmokeYellow_Grenade_shell", "", 130, 65, "" },
            { "3Rnd_Smoke_Grenade_shell", "", 250, 125, "" },
            { "3Rnd_SmokeOrange_Grenade_shell", "", 200, 100, "" },
            { "30Rnd_556x45_Stanag_Tracer_Red", "", 125, 60, "" },
            { "5Rnd_mas_762x51_Stanag", "", 125, 60, "" },
            { "20Rnd_mas_762x51_Stanag", "", 130, 65, "" },
            { "7Rnd_mas_12Gauge_Slug", "", 130, 65, "" },
            { "7Rnd_mas_12Gauge_Pellets", "", 250, 125, "" },
            { "17Rnd_mas_9x21_Mag", "", 200, 100, "" },
            { "12Rnd_mas_45acp_Mag", "", 200, 100, "" },
            { "6Rnd_45ACP_Cylinder", "", 200, 100, "" }
        };
        accs[] = 
		{
            { "optic_mas_acog"", ", 3500, 1750, "call life_coplevel >= 2" },
            { "optic_mas_aim"", ", 3600, 1800, "call life_coplevel >= 1" },
            { "optic_mas_Arco_blk", "", 4000, 2000, "call life_coplevel >= 2" },
            { "optic_mas_Holosight_blk", "", 1000, 500, "call life_coplevel >= 2" },
            { "optic_mas_MRCO_camo", "", 3500, 1750, "call life_coplevel >= 2" },
            { "optic_Hamr"", ", 3600, 1800, "call life_coplevel >= 2" },
            { "optic_DMS", "", 7500, 3750, "call life_coplevel >= 5" },
            { "acc_mas_pointer_IR", "", 1000, 500, "call life_coplevel >= 1" },
            { "optic_Yorris", "", 1000, 500, "call life_coplevel >= 1" },
            { "acc_flashlight"", ", 1000, 500, "call life_coplevel >= 1" },
            { "bipod_02_F_blk", "", 1000, 500, "call life_coplevel >= 1" }			
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
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles_mas_h", "", 1200, 600, "" },
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