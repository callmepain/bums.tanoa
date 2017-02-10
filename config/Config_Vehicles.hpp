class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car_oldtimer {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "ADM_Ford_F100", "call life_civpkw_level >= 1" },
            { "BRP_1960_Black", "call life_civpkw_level >= 3" },
            { "ADM_1964_Impala", "call life_civpkw_level >= 1" },
            { "ADM_1969_Charger", "call life_civpkw_level >= 7" },
            { "SIG_SuperBeeB", "call life_civpkw_level >= 6" },
//			{ "Jonzie_XB", "call life_civpkw_level >= 5" },
            { "ivory_gt500", "call life_civpkw_level >= 5" }
        };
    };
	class civ_car_gebrauchtwagen {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "ADM_GMC_Vandura", "call life_civpkw_level >= 1" },
//            { "D_Cobalt_Blue", "call life_civpkw_level >= 1" },
            { "ivory_e36", "call life_civpkw_level >= 2" },
            { "GeK_CTSV", "call life_civpkw_level >= 3" },
            { "GeK_ElCamino", "call life_civpkw_level >= 3" },
			{ "ivory_gti", "call life_civpkw_level >= 2" },
			{ "xs_niva_F", "call life_civpkw_level >= 2" },
			{ "xs_niva_fermer_F", "call life_civpkw_level >= 1" },
//			{ "Jonzie_Galant", "call life_civpkw_level >=3" },
//			{ "mtz_80", "call life_civpkw_level >= 1" },
			{ "ivory_wrx", "call life_civpkw_level >= 4" },
			{ "IVORY_PRIUS", "call life_civpkw_level >= 2" },
			{ "Gek_TLC100", "call life_civpkw_level >= 1" },
            { "GeK_Supra", "call life_civpkw_level >= 5" }
        };
    };
	class civ_car_sportwagen {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "Tal_Maserati_Black", "call life_civpkw_level >= 5" },
            { "GeK_Camaro", "call life_civpkw_level >= 6" },
            { "quiet_Ford_shelbyGT500_blanche_f", "call life_civpkw_level >= 7" },
            { "AM_Holden_Black", "call life_civpkw_level >= 6" },
            { "ivory_elise", "call life_civpkw_level >= 5" },
			{ "GeK_GTR", "call life_civpkw_level >= 6" },
			{ "ivory_r34", "call life_civpkw_level >= 5" }
        };
    };
	class civ_car_neuwagen {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "ivory_rs4", "call life_civpkw_level >= 4" },
            { "GeK_A45", "call life_civpkw_level >= 5" },
            { "GeK_C63_AMG", "call life_civpkw_level >= 6" },
            { "Urbanized_G65_blue", "call life_civpkw_level >= 6" },
            { "GeK_Mercedes_ML63", "call life_civpkw_level >= 7" },
			{ "quiet_cadillac_blanche_f", "call life_civpkw_level >= 5" },
			{ "GeK_Yukon", "call life_civpkw_level >= 3" },
			{ "ivory_isf", "call life_civpkw_level >= 3" },
			{ "quiet_sub2015_blanche_f", "call life_civpkw_level >= 4" },
			{ "GeK_C30", "call life_civpkw_level >= 3" },
			{ "GeK_S60", "call life_civpkw_level >= 4" }
        };
    };
	class civ_car_supersport {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "Tal_Murci_Black", "call life_civpkw_level >= 9" },
            { "Quiet_v2_r8plus_noir_f", "call life_civpkw_level >= 9" },
            { "ivory_c", "call life_civpkw_level >= 8" },
            { "quiet_Bugatti_blanche_f", "call life_civpkw_level >= 10" },
			{ "ivory_lp560", "call life_civpkw_level >= 9" },
			{ "bv_caressa_gt_black2", "call life_civpkw_level >= 9" },
			{ "bv_458_cardinal", "call life_civpkw_level >= 8" },
			{ "ivory_lfa", "call life_civpkw_level >= 8" }
        };
    };
	class civ_container	{
		side = "civ";
		conditions = "";
		vehicles[] = {
			{"Box_NATO_AmmoVeh_F", ""},
			{"Box_East_AmmoVeh_F", ""},
			{"Box_IND_AmmoVeh_F", ""},
			{"Land_CargoBox_V1_F", ""},
			{"Land_Cargo20_blue_F", ""},
			{"Land_Cargo20_brick_red_F", ""},
			{"Land_Cargo20_cyan_F", ""},
			{"Land_Cargo20_grey_F", ""},
			{"Land_Cargo20_light_blue_F", ""},
			{"Land_Cargo20_light_green_F", ""},
			{"Land_Cargo20_military_green_F", ""},
			{"Land_Cargo20_orange_F", ""},
			{"Land_Cargo20_red_F", ""},
			{"Land_Cargo20_sand_F", ""},
			{"Land_Cargo20_white_F", ""},
			{"Land_Cargo20_yellow_F", ""}
		};
	};
    class kart_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" }
        };
    };

    class civ_truck {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Van_01_box_F", "" },
            { "I_Truck_02_transport_F", "" },
            { "I_Truck_02_covered_F", "" },
            { "B_Truck_01_transport_F", "" },
            { "O_Truck_03_transport_F", "" },
			{ "B_Truck_01_Repair_F", "" },
			{ "O_Truck_03_repair_F", "" },
			{ "B_Truck_01_covered_F", "" },
            { "O_Truck_03_covered_F", "" },
            { "B_Truck_01_box_F", "" },
            { "O_Truck_03_device_F", "" },
            { "C_Van_01_fuel_F", "" },
            { "I_Truck_02_fuel_F", "" },
			{ "O_Truck_03_fuel_F", "" },
            { "B_Truck_01_fuel_F", "" }
        };
    };

    class civ_air {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", "" },
			{ "B_Heli_Light_01_stripped_F", "" },
            { "B_Heli_Light_01_F", "" },
			{ "I_Heli_Transport_02_F", "" },
			{ "O_Heli_Transport_04_F", "" },
			{ "B_Heli_Transport_03_unarmed_F", "" },
            { "O_Heli_Light_02_unarmed_F", "" },
			{ "IVORY_BELL512", "" },
			{ "ivory_b206", "" }
        };
    };

     class civ_ship {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Rubberboat", "" },
            { "C_Boat_Civil_01_F", "" },
			{ "O_Lifeboat", "" },
			{ "C_Boat_Civil_01_rescue_F", "" },
            { "B_SDV_01_F", "" },
			 { "vvv_NewYacht", "" }
        };
    };

    class reb_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "B_G_Offroad_01_F", "" },
            { "O_MRAP_02_F", "" },
            { "B_Heli_Light_01_stripped_F", "" },
            { "B_G_Offroad_01_armed_F", "" }
        };
    };

    class med_shop {
        side = "med";
        conditions = "";
        vehicles[] = {
 //           { "VPC", "" },
  //          { "mercedes_atego_bomberos_ingame", "" },
			{ "vvv_fire_truck", "" }
 //           { "mr_stretcher", "" },
   //         { "FTP_MAN", "" },
        };
    };

    class med_air_hs {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
            { "O_Heli_Light_02_unarmed_F", "" },
			{ "C_hh60j_unarmed_F", "" }
        };
    };

    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "charger_pd", "call life_coplevel >= 1" },
            { "Urbanized_G65_UC3", "call life_coplevel >= 1" },
            { "Urbanized_CTSV_UC1", "call life_coplevel >= 1" },
			{ "bv_the_crowner_cop_sher", "call life_coplevel >= 2" },
			{ "GeK_S60_Police_ST", "call life_coplevel >= 2" }
//			{ "VPC", "call life_coplevel >= 2" }
        };
    };

    class cop_air {
        side = "cop";
        conditions = "call life_coplevel >= 3";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "B_Heli_Light_01_armed_F", "" },
			{ "B_Heli_Transport_01_camo_F", "" },
            { "B_Heli_Transport_01_F", "call life_coplevel >= 4" }
        };
    };

    class cop_ship {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "B_Boat_Transport_01_F", "" },
			{ "B_G_Boat_Transport_01_F", "" },
			{ "O_Lifeboat", "" },
            { "C_Boat_Civil_01_police_F", "" },
            { "B_Boat_Armed_01_minigun_F", "call life_coplevel >= 3" },
            { "B_SDV_01_F", "" }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        conditions = "";
        price = -1;
        textures[] = {};
    };
	///////////civ boot//////////////
	class vvv_NewYacht {
        vItemSpace = 120;
        conditions = "";
        price = 1500000;
        textures[] = { };
    };
	///////////civ air//////////////
	class ivory_b206 {
        vItemSpace = 20;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class IVORY_BELL512 {
        vItemSpace = 20;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	///////////autos meds//////////////
	class mercedes_atego_bomberos_ingame {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class vvv_fire_truck {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class mr_stretcher {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class FTP_MAN {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class C_hh60j_unarmed_F {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	///////////autos cops//////////////
	class charger_pd {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class Urbanized_G65_UC3 {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class Urbanized_CTSV_UC1 {
        vItemSpace = 100;
        conditions = "";
        price = 7400;
        textures[] = { };
    };
	class bv_the_crowner_cop_sher {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class GeK_S60_Police_ST {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	class VPC {
        vItemSpace = 100;
        conditions = "";
        price = 74000;
        textures[] = { };
    };
	
	
	///////////autos gebraucht//////////////
	class ADM_GMC_Vandura {
        vItemSpace = 150;
        conditions = "";
        price = 7400;
        textures[] = { };
    };
	class Gek_TLC100 {
        vItemSpace = 65;
        conditions = "";
        price = 9800;
        textures[] = { };
    };
	
	class D_Cobalt_Blue {
        vItemSpace = 40;
        conditions = "";
        price = 14000;
        textures[] = { };
    };
	
	class ivory_e36 {
        vItemSpace = 35;
        conditions = "";
        price = 18700;
        textures[] = { };
    };
	
	class GeK_CTSV {
        vItemSpace = 35;
        conditions = "";
        price = 44900;
        textures[] = { };
    };
	
	class GeK_ElCamino {
        vItemSpace = 35;
        conditions = "";
        price = 32500;
        textures[] = { };
    };
	
	class ivory_gti {
        vItemSpace = 30;
        conditions = "";
        price = 30525;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	
	class xs_niva_F {
        vItemSpace = 30;
        conditions = "";
        price = 14500;
        textures[] = { };
    };
	
	class xs_niva_fermer_F {
        vItemSpace = 30;
        conditions = "";
        price = 2400;
        textures[] = { };
    };
	
	class Jonzie_Galant {
        vItemSpace = 45;
        conditions = "";
        price = 9400;
        textures[] = { };
    };
	
	class mtz_80 {
        vItemSpace = 30;
        conditions = "";
        price = 2200;
        textures[] = { };
    };
	
	class ivory_wrx {
        vItemSpace = 45;
        conditions = "";
        price = 32500;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	class IVORY_PRIUS {
        vItemSpace = 45;
        conditions = "";
        price = 31500;
        textures[] = { };
    };
	
	class GeK_Supra {
        vItemSpace = 45;
        conditions = "";
        price = 39500;
        textures[] = { };
    };
	
	///////////autos neuwagen//////////////	
	
	class ivory_rs4 {
        vItemSpace = 65;
        conditions = "";
        price = 77550;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	
	class GeK_A45 {
        vItemSpace = 45;
        conditions = "";
        price = 56000;
        textures[] = { };
    };
	
	class GeK_C63_AMG {
        vItemSpace = 45;
        conditions = "";
        price = 115430;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	
	class Urbanized_G65_blue {
        vItemSpace = 55;
        conditions = "";
        price = 245000;
        textures[] = { };
    };
	
	class GeK_Mercedes_ML63 {
        vItemSpace = 45;
        conditions = "";
        price = 121558;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	
	class quiet_cadillac_blanche_f {
        vItemSpace = 30;
        conditions = "";
        price = 99500;
        textures[] = { };
    };
	
	class GeK_Yukon {
        vItemSpace = 100;
        conditions = "";
        price = 51230;
        textures[] = { };
    };
	
	class ivory_isf {
        vItemSpace = 45;
        conditions = "";
        price = 29900;
        textures[] = { };
    };
	
	class quiet_sub2015_blanche_f {
        vItemSpace = 45;
        conditions = "";
        price = 67923;
        textures[] = { };
    };
	
	class GeK_C30 {
        vItemSpace = 45;
        conditions = "";
        price = 18600;
        textures[] = { };
    };
	
	class GeK_S60 {
        vItemSpace = 45;
        conditions = "";
        price = 28650;
        textures[] = { };
    };
	
	
		///////////autos oldtimer//////////////
	
	
	
	class ADM_Ford_F100 {
        vItemSpace = 35;
        conditions = "";
        price = 14900;
        textures[] = { };
    };
	
	class BRP_1960_Black {
        vItemSpace = 35;
        conditions = "";
        price = 64900;
        textures[] = { };
    };
	
	class ADM_1964_Impala {
        vItemSpace = 35;
        conditions = "";
        price = 17500;
        textures[] = { };
    };
	
	class ADM_1969_Charger {
        vItemSpace = 35;
        conditions = "";
        price = 95000;
        textures[] = { };
    };
	
	class SIG_SuperBeeB {
        vItemSpace = 35;
        conditions = "";
        price = 85000;
        textures[] = { };
    };
	
	class Jonzie_XB {
        vItemSpace = 35;
        conditions = "";
        price = 150000;
        textures[] = { };
    };
	
	class ivory_gt500 {
        vItemSpace = 35;
        conditions = "";
        price = 125000;
        textures[] = { };
    };
	
	
	///////////autos sportwagen//////////////
	
	
	class Tal_Maserati_Black {
        vItemSpace = 35;
        conditions = "";
        price = 142900;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	class GeK_Camaro {
        vItemSpace = 35;
        conditions = "";
        price = 39990;
        textures[] = { };
    };
	class quiet_Ford_shelbyGT500_blanche_f {
        vItemSpace = 35;
        conditions = "";
        price = 159900;
        textures[] = { };
    };
	class AM_Holden_Black {
        vItemSpace = 35;
        conditions = "";
        price = 65000;
        textures[] = { };
    };
	class ivory_elise {
        vItemSpace = 35;
        conditions = "";
        price = 37999;
        textures[] = { };
    };
	class GeK_GTR {
        vItemSpace = 35;
        conditions = "";
        price = 62900;
        textures[] = { };
    };
	class ivory_r34 {
        vItemSpace = 35;
        conditions = "";
        price = 19900;
        textures[] = { };
    };
	
	
	///////////autos Supersport//////////////
	
	
	class Tal_Murci_Black {
        vItemSpace = 35;
        conditions = "";
        price = 229000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	class Quiet_v2_r8plus_noir_f {
        vItemSpace = 35;
        conditions = "";
        price = 190000;
        textures[] = { };
    };
	class ivory_c {
        vItemSpace = 35;
        conditions = "";
        price = 264775;
        textures[] = { };
    };
	class quiet_Bugatti_blanche_f {
        vItemSpace = 35;
        conditions = "";
        price = 1000000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
    };
	class ivory_lp560 {
        vItemSpace = 35;
        conditions = "";
        price = 355000;
        textures[] = { };
    };
	class ivory_lfa {
        vItemSpace = 35;
        conditions = "";
        price = 375000;
        textures[] = { };
    };	
	class bv_caressa_gt_black2 {
        vItemSpace = 35;
        conditions = "";
        price = 452692;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Rot", "civ", {
                "#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Blau", "civ", {
                "#(argb,8,8,3)color(0,0,0.1,1)", 
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Grün", "civ", {
                "#(argb,8,8,3)color(0,0.7,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Pink", "civ", {
                "#(argb,8,8,3)color(1,0,0.5,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Weiss", "civ", {
                "#(argb,8,8,3)color(1,1,1,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" },
			{ "Gelb", "civ", {
                "#(argb,8,8,3)color(0.2,0.2,0,1)",
                "#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
                "#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
            }, "" }
        };
	};
	class bv_458_cardinal {
		vItemSpace = 35;
		conditions = "";
		price = 194000;
		textures[] = {
			{ "Schwarz", "civ", {
				"#(argb,8,8,3)color(0.05,0.05,0.05,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Rot", "civ", {
				"#(argb,8,8,3)color(0.8,0,0,1)",	//karosse
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Blau", "civ", {
				"#(argb,8,8,3)color(0,0,0.1,1)", 
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Grün", "civ", {
				"#(argb,8,8,3)color(0,0.7,0,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Pink", "civ", {
				"#(argb,8,8,3)color(1,0,0.5,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Weiss", "civ", {
				"#(argb,8,8,3)color(1,1,1,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" },
			{ "Gelb", "civ", {
				"#(argb,8,8,3)color(0.2,0.2,0,1)",
				"#(argb,8,8,3)color(0.2,0.2,0.2,1)", //felgen
				"#(argb,8,8,3)color(1,1,1,0.05)" //scheiben
			}, "" }
		};
	};	
	
	
	//////////autos alt//////////////
    class I_Truck_02_medical_F {
        vItemSpace = 150;
        conditions = "";
        price = 25000;
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        conditions = "";
        price = 45000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        conditions = "";
        price = 60000;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 45;
        conditions = "license_civ_boat";
        price = 2500;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 50;
        conditions = "license_cop_cAir";
        price = 270000;
        textures[] = {};
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 60;
        conditions = "";
        price = 506250;
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };
	class I_MRAP_03_hmg_F {
        vItemSpace = 60;
        conditions = "";
        price = 626250;
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 65;
        conditions = "";
        price = 285000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        conditions = "";
        price = 1500;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 285;
        conditions = "license_civ_trucking";
        price = 228850;
        textures[] = { };
    };
	
	class B_Truck_01_Repair_F {
        vItemSpace = 1337;
        conditions = "license_civ_trucking";
        price = 690000;
        textures[] = { };
    };
	
	class O_Truck_03_repair_F {
        vItemSpace = 110;
        conditions = "license_civ_trucking";
        price = 165600;
        textures[] = { };
    };
	
	class B_Truck_01_covered_F {
        vItemSpace = 130;
        conditions = "license_civ_trucking";
        price = 402500;
        textures[] = { };
    };
	class O_Truck_03_fuel_F {
        vItemSpace = 325;
        conditions = "license_civ_trucking";
        price = 133343;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 500;
        conditions = "license_civ_trucking";
        price = 230000;
        textures[] = { };
    };
	
	
	
/*                   cargo box                            */


    class Land_CargoBox_V1_F {
        vItemSpace = 200;
        conditions = "";
        price = 15000;
        textures[] = {};
    };
	
	class Box_NATO_AmmoVeh_F {
        vItemSpace = 200;
        conditions = "";
        price = 15000;
        textures[] = {};
    };
	
	class Box_East_AmmoVeh_F {
        vItemSpace = 200;
        conditions = "";
        price = 15000;
        textures[] = {};
    };
	
	class Box_IND_AmmoVeh_F {
        vItemSpace = 200;
        conditions = "";
        price = 15000;
        textures[] = {};
    };
	
	class Land_Cargo20_blue_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_brick_red_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_cyan_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_grey_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_light_blue_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_light_green_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_military_green_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_orange_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	
	class Land_Cargo20_red_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	
	class Land_Cargo20_sand_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	
	class Land_Cargo20_white_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };
	
	class Land_Cargo20_yellow_F {
        vItemSpace = 700;
        conditions = "";
        price = 52500;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 200;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 200;
        conditions = "";
        price = -1;
        textures[] = {};
    };

	
	
	
	
    class B_G_Offroad_01_F {
        vItemSpace = 30;
        conditions = "";
        price = 5250;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 30;
        conditions = "license_civ_rebel";
        price = 750000;
        textures[] = { };
    };
	class I_G_Offroad_01_armed_F {
        vItemSpace = 30;
        conditions = "license_civ_rebel";
        price = 750000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 60;
        conditions = "license_civ_boat";
        price = 6800;
        textures[] = { };
    };
	
	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 65;
        conditions = "license_civ_boat";
        price = 9500;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 65;
        conditions = "";
        price = 6800;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 1000;
        conditions = "license_civ_trucking";
        price = 690000;
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 120;
        conditions = "license_civ_trucking";
        price = 460000;
        textures[] = { };
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        conditions = "license_civ_driver";
        price = 350000;
        textures[] = { };
    };
	class I_MRAP_03_F {
        vItemSpace = 60;
        conditions = "license_civ_driver";
        price = 450000;
        textures[] = { };
    };

    class C_Offroad_01_F {
        vItemSpace = 30;
        conditions = "license_civ_driver || call life_coplevel >= 1";
        price = 5250;
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            }, "" },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            }, "" },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            }, "" },
            { "Taxi", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            }, "" },
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 60;
        conditions = "license_civ_driver";
        price = 15000;
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {
        vItemSpace = 30;
        conditions = "license_civ_driver || call life_coplevel >= 1";
        price = 9750;
        textures[] = {
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 20;
        conditions = "license_civ_driver";
        price = 1500;
        textures[] = {
            { "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            }, "" },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            }, "" },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            }, "" },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            }, "" },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 80;
        conditions = "license_civ_trucking";
        price = 55775;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 70;
        conditions = "license_civ_trucking";
        price = 59800;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 100;
        conditions = "license_civ_trucking";
        price = 114418;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 30;
        conditions = "license_civ_driver";
        price = 7500;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            }, "" },
            { "White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            }, "" },
            { "Grey", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            }, "" },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            }, "" }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 30;
        conditions = "license_civ_driver || call life_coplevel >= 1";
        price = 11300;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
            { "Police", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            }, "" }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 50;
        conditions = "license_civ_driver";
        price = 32597;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 60;
        conditions = "license_civ_trucking";
        price = 34500;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 60;
        conditions = "";
        price = 120000;
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 30;
        conditions = "";
        price = 60000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 30;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 60000;
        textures[] = {
            { "Police", "cop", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            }, "" },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            }, "" },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "" },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            }, "" }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 30;
		conditions = "license_civ_pilot || call life_coplevel >= 4";
        price = 45000;
    };
	
	class B_Heli_Light_01_armed_F {
        vItemSpace = 50;
		conditions = "call life_coplevel >= 4";
        price = 320000;
    };
	
	class B_Heli_Transport_01_camo_F {
        vItemSpace = 50;
		conditions = "license_civ_pilot || {license_med_mAir} || call life_coplevel >= 4";
        price = 500000;
    };
	
	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 75;
		conditions = "license_civ_pilot || {license_med_mAir}";
        price = 320000;
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 50;
		conditions = "license_civ_pilot || {license_med_mAir}";
        price = 337000;
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 50;
		conditions = "license_civ_pilot || {license_med_mAir} || call life_coplevel >= 4";
        price = 120000;
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 75;
		conditions = "license_civ_pilot || {license_med_mAir}";
        price = 159000;
    };


    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price = 110000;
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            }, "" },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            }, "" },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "" },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            }, "" }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 100;
        conditions = "";
        price = 23490;
        textures[] = {};
    };
	
	class O_Lifeboat {
        vItemSpace = 55;
        conditions = "";
        price = 5000;
        textures[] = {};
    };
	
	class B_G_Boat_Transport_01_F {
        vItemSpace = 50;
        conditions = "";
        price = 5000;
        textures[] = {};
    };

	class C_Van_01_fuel_F {
        vItemSpace = 100;
        vFuelSpace = 19500;
        conditions = "license_civ_trucking";
        price = 40250;
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            }, "" }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 250;
        vFuelSpace = 42000;
        conditions = "license_civ_trucking";
        price = 66700;
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            }, "" }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 650;
        vFuelSpace = 50000;
        conditions = "license_civ_trucking";
        price = 448500;
        textures[] = {};
    };
};
