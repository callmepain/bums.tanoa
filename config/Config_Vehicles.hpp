#define FARBEN { "Aqua", "civ", {"#(argb,8,8,3)color(0.247,0.600,1,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, ""},{ "Schwarz", "civ", {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, ""},{ "Dunkel Blau", "civ", {"#(argb,8,8,3)color(0.012,0.059,0.129,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, ""},{ "Dunkel Grün", "civ", {"#(argb,8,8,3)color(0.012,0.122,0.012,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Dunkel Rot", "civ", {"#(argb,8,8,3)color(0.075,0,0,1)", "#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Grün", "civ", {"#(argb,8,8,3)color(0.678,1,0,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Grau", "civ", {"#(argb,8,8,3)color(0.494,0.490,0.494,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)","#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Orange", "civ", {"#(argb,8,8,3)color(0.808,0.416,0,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)" }, "" },{ "Pink", "civ", {"#(argb,8,8,3)color(1,0.1,0.9,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Lila", "civ", {"#(argb,8,8,3)color(0.086,0.012,0.141,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Rot", "civ", {"#(argb,8,8,3)color(0.631,0.004,0,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Weiss", "civ", {"#(argb,8,8,3)color(1,1,1,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)"}, "" },{ "Gelb", "civ", {"#(argb,8,8,3)color(1,0.9,0,1)","#(argb,8,8,3)color(0.2,0.2,0.2,1)", "#(argb,8,8,3)color(1,1,1,0.05)"}, "" }

class CarShops 
{
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
	
    class civ_car_oldtimer 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
			{ "Mrshounka_Vandura_civ", "call life_civpkw_level >= 2" },
			{ "shounka_transam", "call life_civpkw_level >= 4" },
			{ "Urbanized_67Mustang_black", "call life_civpkw_level >= 4" },
			// { "red_beetle_66_bahamablue", "call life_civpkw_level >= 5" },//
			// { "Mrshounka_lincoln_civ", "call life_civpkw_level >= 6" },//
			{ "Urbanized_427_black", "call life_civpkw_level >= 6" }, 
			{ "ivory_gt500", "call life_civpkw_level >= 7" }
        };
    };
	
	class civ_car_gebrauchtwagen 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "shounka_a3_cliors_civ", "call life_civpkw_level >= 1" },
	        { "GeK_Yukon", "call life_civpkw_level >= 1" },
            { "ivory_190e", "call life_civpkw_level >= 1" },
			// { "Mrshounka_twingo_p", "call life_civpkw_level >= 1" },		//	
            { "Mrshounka_a3_smart_civ", "call life_civpkw_level >= 1" },			
            { "shounka_nemo", "call life_civpkw_level >= 2" },			
            { "Mrshounka_golfvi_civ", "call life_civpkw_level >= 2" },			
            { "Mrshounka_mercedes_190_p_civ", "call life_civpkw_level >= 2" },			
            { "Mrshounka_207_civ", "call life_civpkw_level >= 2" },	
	        { "Mrshounka_r5_civ", "call life_civpkw_level >= 2" },
            { "GeK_ElCamino", "call life_civpkw_level >= 3" },
            { "Mrshounka_c4_p_civ", "call life_civpkw_level >= 3" },			
            { "shounka_a3_ds4_civ", "call life_civpkw_level >= 3" },			
            { "Mrshounka_a3_308_civ", "call life_civpkw_level >= 3" },			
            // { "Mrshounka_a3_308_rcz", "call life_civpkw_level >= 3" },		//	
            { "IVORY_PRIUS", "call life_civpkw_level >= 3" },			
            // { "Mrshounka_a3_ds3_civ", "call life_civpkw_level >= 4" },		//	
	        { "Mrshounka_raptor_civ", "call life_civpkw_level >= 4" },
            { "ivory_gti", "call life_civpkw_level >= 4" },
            { "shounka_a3_peugeot508_civ", "call life_civpkw_level >= 4" }
            // { "mrshounka_92_civ", "call life_civpkw_level >= 4" },			//
            // { "Mrshounka_jeep_blinde_noir", "call life_civpkw_level >= 8" }//
        };
    };
	
	class civ_car_sportwagen 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {


          { "red_charger_15_civ", "call life_civpkw_level >= 4" },
 	        // { "red_genesis_16_civ", "call life_civpkw_level >= 4" },//
 	        { "red_xkrs_12_civ", "call life_civpkw_level >= 5" },
 	        { "red_s65_12_civ", "call life_civpkw_level >= 5" },
 	        { "zorak_audi_rs3", "call life_civpkw_level >= 5" },
 	        { "Mrshounka_rs4_civ", "call life_civpkw_level >= 5" },
 	        // { "Mrshounka_bmwm1_civ_orange", "call life_civpkw_level >= 5" },		//	
 	        { "Mrshounka_bmwm6_civ", "call life_civpkw_level >= 5" },
 	        { "Mrshounka_a3_dodge15_civ", "call life_civpkw_level >= 5" },
 	        { "ivory_elise", "call life_civpkw_level >= 5" },
 	        { "GeK_A45", "call life_civpkw_level >= 5" },
 	        { "ivory_lfa", "call life_civpkw_level >= 6" },
 	        { "shounka_a3_rs5_civ", "call life_civpkw_level >= 61" },
 	        { "shounka_rs6", "call life_civpkw_level >= 6" },
 	        { "Urbanized_GranTurismo_black", "call life_civpkw_level >= 6" },
 	        { "GeK_C63_AMG", "call life_civpkw_level >= 6" },
 	        { "IVORY_R8", "call life_civpkw_level >= 7" },
 	        // { "IVORY_R8SPYDER", "call life_civpkw_level >= 7" },//
 	        { "ivory_c", "call life_civpkw_level >= 7" },
 	        { "Mrshounka_c63_2015_civ", "call life_civpkw_level >= 7" }
        };
    };
	
	class civ_car_neuwagen 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "ivory_e36", "call life_civpkw_level >= 3" },
   	        { "shounka_avalanche", "call life_civpkw_level >= 3" },
 	        { "shounka_clk", "call life_civpkw_level >= 3" },
 	        { "Mrshounka_megane_rs_2015_civ", "call life_civpkw_level >= 3" },
 	        { "GeK_TLC100", "call life_civpkw_level >= 3" },
 	        { "GeK_C30", "call life_civpkw_level >= 3" },
 	        { "red_gs350_13_black", "call life_civpkw_level >= 4" },			
 	        { "Mrshounka_Alfa_Romeo_civ", "call life_civpkw_level >= 4" },
 	        // { "GeK_Camaro", "call life_civpkw_level >= 4" },//
 	        { "Mrshounka_raptor2_civ", "call life_civpkw_level >= 4" },
 	        { "ivory_isf", "call life_civpkw_level >= 4" },
 	        { "ivory_evox", "call life_civpkw_level >= 4" },
 	        { "Mrshounka_subaru08_civ", "call life_civpkw_level >= 5" },
 	        { "red_ram_06_civ", "call life_civpkw_level >= 5" },
 	        // { "ivory_m3", "call life_civpkw_level >= 5" },//
 	        { "Mrshounka_mustang_civ", "call life_civpkw_level >= 5" },
 	        { "Mrshounka_hummer_civ", "call life_civpkw_level >= 5" },
 	        { "Mrshounka_cherokee_noir", "call life_civpkw_level >= 5" },
 	        // { "Mrshounka_evox_civ", "call life_civpkw_level >= 5" },//
 	        { "GeK_Mercedes_ML63", "call life_civpkw_level >= 5" },			
 	        { "ivory_r34", "call life_civpkw_level >= 5" },
 	        // { "ivory_wrx", "call life_civpkw_level >= 5" },//
 	        { "GeK_Supra", "call life_civpkw_level >= 5" },
 	        { "ivory_supra", "call life_civpkw_level >= 5" },
 	        { "Mrshounka_Volkswagen_Touareg_civ", "call life_civpkw_level >= 5" },
 	        // { "shounka_h2", "call life_civpkw_level >= 6" },//
			{ "GeK_GTR", "call life_civpkw_level >= 6" }
        };
    };
	
	class civ_car_supersport 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
            // { "shounka_f430_spider", "call life_civpkw_level >= 6" },//
  	        { "Urbanized_458Ferrari_black", "call life_civpkw_level >= 7" },
 	        { "ivory_lp560", "call life_civpkw_level >= 7" },
 	        { "shounka_mp4", "call life_civpkw_level >= 7" },
 	        // { "Mrshounka_cayenne_p_civ", "call life_civpkw_level >= 7" },//
 	        { "shounka_porsche911", "call life_civpkw_level >= 7" },
 	        { "shounka_gt", "call life_civpkw_level >= 8" },			
 	        { "Urbanized_LP700", "call life_civpkw_level >= 8" },
 	        // { "IVORY_REV", "call life_civpkw_level >= 8" },//
 	        { "Mrshounka_pagani_c", "call life_civpkw_level >= 8" },
 	        { "Urbanized_LaFerrari", "call life_civpkw_level >= 8" },
 	        { "mrshounka_huracan_c", "call life_civpkw_level >= 9" },
 	        // { "Mrshounka_veneno_c", "call life_civpkw_level >= 9" },//
 	        { "Mrshounka_agera_p", "call life_civpkw_level >= 10" },
			{ "Mrshounka_lykan_c", "call life_civpkw_level >= 10" }
        };
    };
	
	class civ_container	
	{
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
	
    class kart_shop 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" }
        };
    };

    class civ_truck 
	{
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Van_01_box_F", "call life_civlkw_level >= 1" },
            { "I_Truck_02_transport_F", "call life_civlkw_level >= 1" },
            { "I_Truck_02_covered_F", "call life_civlkw_level >= 2" },
            { "shounka_a3_spr_civ", "call life_civlkw_level >= 3" },
            { "O_Truck_03_transport_F", "call life_civlkw_level >= 4" },
            { "O_Truck_03_covered_F", "call life_civlkw_level >= 4" },
            { "O_Truck_03_repair_F", "call life_civlkw_level >= 5" },
            { "B_Truck_01_transport_F", "call life_civlkw_level >= 6" },
            { "B_Truck_01_covered_F", "call life_civlkw_level >= 6" },
            { "B_Truck_01_box_F", "call life_civlkw_level >= 7" },
            { "C_Van_01_fuel_F", "call life_civlkw_level >= 8" },
            { "I_Truck_02_fuel_F", "call life_civlkw_level >= 8" },
            { "O_Truck_03_fuel_F", "call life_civlkw_level >= 9" },
            { "B_Truck_01_fuel_F", "call life_civlkw_level >= 10" }
        };
    };

     class civ_air 
	 {
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

      class civ_ship 
	  {
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

    // class reb_car {
        // side = "civ";
        // conditions = "";
        // vehicles[] = {
            // { "B_Quadbike_01_F", "" },
            // { "B_G_Offroad_01_F", "" },
            // { "O_MRAP_02_F", "" },
            // { "B_Heli_Light_01_stripped_F", "" },
            // { "B_G_Offroad_01_armed_F", "" }
        // };
    // };

    // class med_shop {
        // side = "med";
        // conditions = "";
        // vehicles[] = {
 //           { "VPC", "" },
  //          { "mercedes_atego_bomberos_ingame", "" },
			// { "vvv_fire_truck", "" }
 //           { "mr_stretcher", "" },
   //         { "FTP_MAN", "" },
        // };
    // };

    // class med_air_hs {
        // side = "med";
        // conditions = "";
        // vehicles[] = {
            // { "B_Heli_Light_01_F", "" },
            // { "O_Heli_Light_02_unarmed_F", "" },
			// { "C_hh60j_unarmed_F", "" }
        // };
    // };

    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "red_charger_15_p_sheriff", "call life_coplevel >= 1" },
            { "ivory_rs4_marked", "call life_coplevel >= 1" },
            { "ivory_m3_marked", "call life_coplevel >= 1" },
            { "shounka_a3_brinks", "call life_coplevel >= 1" },
            { "Urbanized_67Mustang_UC1", "call life_coplevel >= 1" },
            { "Mrshounka_cherokee_noir", "call life_coplevel >= 1" },
            { "ivory_isf_marked", "call life_coplevel >= 1" },
            { "GeK_Mercedes_ML63", "call life_coplevel >= 1" },
            { "Urbanized_G65_UC1", "call life_coplevel >= 1" },
            { "shounka_a3_gendsprinter", "call life_coplevel >= 1" },
            { "ivory_evox_marked", "call life_coplevel >= 1" },
            { "ivory_wrx_marked", "call life_coplevel >= 1" },
            { "GeK_S60_Police_ST", "call life_coplevel >= 3" }
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
	// class vvv_NewYacht {
        // vItemSpace = 120;
        // conditions = "";
        // price = 1500000;
        // textures[] = { };
    // };
	///////////civ air//////////////
	// class ivory_b206 {
        // vItemSpace = 20;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	// class IVORY_BELL512 {
        // vItemSpace = 20;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	///////////autos meds//////////////
	// class mercedes_atego_bomberos_ingame {
        // vItemSpace = 100;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	// class vvv_fire_truck {
        // vItemSpace = 100;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	// class mr_stretcher {
        // vItemSpace = 100;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	// class FTP_MAN {
        // vItemSpace = 100;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	// class C_hh60j_unarmed_F {
        // vItemSpace = 100;
        // conditions = "";
        // price = 74000;
        // textures[] = { };
    // };
	
	/////////LKWS/////////
	class shounka_a3_spr_civ {
        vItemSpace = 100;
        conditions = "";
        price = 98725;
        textures[] = { FARBEN };
    };
	
	///////////autos cops//////////////
	class red_charger_15_p_sheriff {
        vItemSpace = 100;
        conditions = "";
        price = 39900;
        textures[] = { };
    };
	class ivory_rs4_marked {
        vItemSpace = 100;
        conditions = "";
        price = 48900;
        textures[] = { };
    };
	class ivory_m3_marked {
        vItemSpace = 100;
        conditions = "";
        price = 37400;
        textures[] = { };
    };
	class shounka_a3_brinks {
        vItemSpace = 100;
        conditions = "";
        price = 24900;
        textures[] = { };
    };
	class Urbanized_67Mustang_UC1 {
        vItemSpace = 100;
        conditions = "";
        price = 16990;
        textures[] = { };
    };
	class ivory_isf_marked {
        vItemSpace = 100;
        conditions = "";
        price = 35000;
        textures[] = { };	
    };
	class Urbanized_G65_UC1 {
        vItemSpace = 100;
        conditions = "";
        price = 320000;
        textures[] = { };	
    };
	class shounka_a3_gendsprinter {
        vItemSpace = 100;
        conditions = "";
        price = 38000;
        textures[] = { };
	};
	class ivory_evox_marked {
        vItemSpace = 100;
        conditions = "";
        price = 25000;
        textures[] = { };	
    };
	class ivory_wrx_marked {
        vItemSpace = 100;
        conditions = "";
        price = 35000;
        textures[] = { };		
    };
	class GeK_S60_Police_ST {
        vItemSpace = 100;
        conditions = "";
        price = 15000;
        textures[] = { };	
    };
		
	///////////autos gebraucht//////////////
	class shounka_a3_cliors_civ {
        vItemSpace = 40;
        conditions = "";
        price = 3500;
        textures[] = { FARBEN };
    };
	
	class shounka_nemo {
        vItemSpace = 40;
        conditions = "";
        price = 8900;
        textures[] = { FARBEN };
    };
	
	class GeK_Yukon {
        vItemSpace = 45;
        conditions = "";
        price = 19500;
        textures[] = {};
    };
	
	class ivory_190e {
        vItemSpace = 45;
        conditions = "";
        price = 1300;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_twingo_p {
        vItemSpace = 45;
        conditions = "";
        price = 1750;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_a3_smart_civ {
        vItemSpace = 45;
        conditions = "";
        price = 2000;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_golfvi_civ {
        vItemSpace = 35;
        conditions = "";
        price = 5000;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_mercedes_190_p_civ {
        vItemSpace = 45;
        conditions = "";
        price = 2699;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_207_civ {
        vItemSpace = 45;
        conditions = "";
        price = 7500;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_r5_civ {
        vItemSpace = 45;
        conditions = "";
        price = 5000;
        textures[] = { FARBEN };
    };
	
	class GeK_ElCamino {
        vItemSpace = 35;
        conditions = "";
        price = 8949;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_c4_p_civ {
        vItemSpace = 35;
        conditions = "";
        price = 5800;
        textures[] = { FARBEN };
    };
	
	class shounka_a3_ds4_civ {
        vItemSpace = 40;
        conditions = "";
        price = 10980;
        textures[] = { FARBEN };
    };

	class Mrshounka_a3_308_civ {
        vItemSpace = 45;
        conditions = "";
        price = 9999;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_a3_308_rcz {
        vItemSpace = 45;
        conditions = "";
        price = 11250;
        textures[] = { FARBEN };
    };
	class IVORY_PRIUS {
        vItemSpace = 50;
        conditions = "";
        price = 2000;
        textures[] = { FARBEN };
    };

	class Mrshounka_a3_ds3_civ {
        vItemSpace = 40;
        conditions = "";
        price = 15400;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_raptor_civ {
        vItemSpace = 45;
        conditions = "";
        price = 18500;
        textures[] = { FARBEN };
    };
	class ivory_gti {
        vItemSpace = 45;
        conditions = "";
        price = 7650;
        textures[] = { FARBEN };
    };

	class shounka_a3_peugeot508_civ {
        vItemSpace = 45;
        conditions = "";
        price = 13350;
        textures[] = { FARBEN };
    };
	
	class mrshounka_92_civ {
        vItemSpace = 35;
        conditions = "";
        price = 58964;
        textures[] = { FARBEN };
    };
	class Mrshounka_jeep_blinde_noir {
        vItemSpace = 65;
        conditions = "";
        price = 500000;
        textures[] = { FARBEN };
    };
					
	///////////autos neuwagen//////////////	
	
	class ivory_e36 {
        vItemSpace = 45;
        conditions = "";
        price = 22500;
        textures[] = { FARBEN };
    };

	class shounka_avalanche {
        vItemSpace = 35;
        conditions = "";
        price = 13800;
        textures[] = { FARBEN };
    };
	
	class shounka_clk {
        vItemSpace = 40;
        conditions = "";
        price = 38500;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_megane_rs_2015_civ {
        vItemSpace = 45;
        conditions = "";
        price = 16350;
        textures[] = { FARBEN };
    };
	
	class GeK_TLC100 {
        vItemSpace = 45;
        conditions = "";
        price = 21350;
        textures[] = { FARBEN };
    };

	class GeK_C30 {
        vItemSpace = 45;
        conditions = "";
        price = 15250;
        textures[] = { FARBEN };
    };
	
	class red_gs350_13_black {
        vItemSpace = 35;
        conditions = "";
        price = 34569;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_Alfa_Romeo_civ {
        vItemSpace = 35;
        conditions = "";
        price = 10990;
        textures[] = { FARBEN };
    };
		
	class GeK_Camaro {
        vItemSpace = 35;
        conditions = "";
        price = 29000;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_raptor2_civ {
        vItemSpace = 45;
        conditions = "";
        price = 47999;
        textures[] = { FARBEN };
    };
	class ivory_isf {
        vItemSpace = 45;
        conditions = "";
        price = 28900;
        textures[] = { FARBEN };
    };	
	class ivory_evox {
        vItemSpace = 35;
        conditions = "";
        price = 20999;
        textures[] = { FARBEN };
    };
	class Mrshounka_subaru08_civ {
        vItemSpace = 45;
        conditions = "";
        price = 22570;
        textures[] = { FARBEN };
    };
	class red_ram_06_civ {
        vItemSpace = 65;
        conditions = "";
        price = 27990;
        textures[] = { FARBEN };
    };	
	class ivory_m3 {
        vItemSpace = 45;
        conditions = "";
        price = 33500;
        textures[] = { FARBEN };
    };
	class Mrshounka_mustang_civ {
        vItemSpace = 45;
        conditions = "";
        price = 16990;
        textures[] = { FARBEN };
    };
	class Mrshounka_hummer_civ {
        vItemSpace = 45;
        conditions = "";
        price = 86900;
        textures[] = { FARBEN };
    };	
	class Mrshounka_cherokee_noir {
        vItemSpace = 40;
        conditions = "";
        price = 45000;
        textures[] = { FARBEN };
    };
	class Mrshounka_evox_civ {
        vItemSpace = 40;
        conditions = "";
        price = 15000;
        textures[] = { FARBEN };
    };
	class GeK_Mercedes_ML63 {
        vItemSpace = 45;
        conditions = "";
        price = 68890;
        textures[] = { FARBEN };
    };	
	class ivory_r34 {
        vItemSpace = 35;
        conditions = "";
        price = 24500;
        textures[] = { FARBEN };
    };
	class ivory_wrx {
        vItemSpace = 45;
        conditions = "";
        price = 35762;
        textures[] = { FARBEN };
    };
	class GeK_Supra {
        vItemSpace = 45;
        conditions = "";
        price = 30000;
        textures[] = { FARBEN };
    };
	class ivory_supra {
        vItemSpace = 45;
        conditions = "";
        price = 37985;
        textures[] = { FARBEN };
    };
	class Mrshounka_Volkswagen_Touareg_civ {
        vItemSpace = 65;
        conditions = "";
        price = 45000;
        textures[] = { FARBEN };
    };	
	class shounka_h2 {
        vItemSpace = 40;
        conditions = "";
        price = 41900;
        textures[] = { FARBEN };
    };
	class GeK_GTR {
        vItemSpace = 45;
        conditions = "";
        price = 61999;
        textures[] = { FARBEN };
    };

	
		///////////autos oldtimer//////////////
	
	
	
	class Mrshounka_Vandura_civ {
        vItemSpace = 35;
        conditions = "";
        price = 10000;
        textures[] = { FARBEN };
    };
	
	class Urbanized_67Mustang_black {
        vItemSpace = 35;
        conditions = "";
        price = 24900;
        textures[] = { FARBEN };
    };
	
	class shounka_transam {
        vItemSpace = 35;
        conditions = "";
        price = 15645;
        textures[] = { FARBEN };
    };
	
	class red_beetle_66_bahamablue {
        vItemSpace = 35;
        conditions = "";
        price = 10990;
        textures[] = { FARBEN };
    };
	
	class Urbanized_427_black {
        vItemSpace = 35;
        conditions = "";
        price = 139950;
        textures[] = {  };
    };
	
	class Mrshounka_lincoln_civ {
        vItemSpace = 35;
        conditions = "";
        price = 22500;
        textures[] = { FARBEN };
    };
	
	class ivory_gt500 {
        vItemSpace = 35;
        conditions = "";
        price = 43000;
        textures[] = { FARBEN };
    };
	
	
	///////////autos sportwagen//////////////
	
	
	class red_charger_15_civ {
        vItemSpace = 35;
        conditions = "";
        price = 39900;
        textures[] = { FARBEN };
    };

	class red_genesis_16_civ {
        vItemSpace = 35;
        conditions = "";
        price = 34700;
        textures[] = { FARBEN };
    };

	class red_xkrs_12_civ {
        vItemSpace = 35;
        conditions = "";
        price = 24900;
        textures[] = { FARBEN };
    };

	class red_s65_12_civ {
        vItemSpace = 35;
        conditions = "";
        price = 43700;
        textures[] = { FARBEN };
    };
	class zorak_audi_rs3 {
        vItemSpace = 35;
        conditions = "";
        price = 43900;
        textures[] = { FARBEN };
    };
	class Mrshounka_rs4_civ {

        vItemSpace = 35;
        conditions = "";
        price = 48900;
        textures[] = { FARBEN };
    };
	class Mrshounka_bmwm1_civ_orange {
        vItemSpace = 35;
        conditions = "";
        price = 45499;
        textures[] = { FARBEN };
    };
	
	class Mrshounka_bmwm6_civ {
        vItemSpace = 35;
        conditions = "";
        price = 54990;
        textures[] = { FARBEN };
    };

	class Mrshounka_a3_dodge15_civ {
        vItemSpace = 35;
        conditions = "";
        price = 39900;
        textures[] = { FARBEN };
    };
	class ivory_elise {
        vItemSpace = 35;
        conditions = "";
        price = 36500;
        textures[] = { FARBEN };
    };
	class GeK_A45 {
        vItemSpace = 35;
        conditions = "";
        price = 49880;
        textures[] = { FARBEN };
    };
	class ivory_lfa {
        vItemSpace = 35;
        conditions = "";
        price = 449000;
        textures[] = { FARBEN };
    };
	class shounka_a3_rs5_civ {
        vItemSpace = 35;
        conditions = "";
        price = 54830;
        textures[] = { FARBEN };
    };	
	class shounka_rs6 {
        vItemSpace = 35;
        conditions = "";
        price = 83224;
        textures[] = { FARBEN };
    };

	class Urbanized_GranTurismo_black {
        vItemSpace = 35;
        conditions = "";
        price = 52990;
        textures[] = { FARBEN };
    };
	class GeK_C63_AMG {
        vItemSpace = 35;
        conditions = "";
        price = 111222;
        textures[] = { FARBEN };
    };
	class IVORY_R8 {
        vItemSpace = 35;
        conditions = "";
        price = 154990;
        textures[] = { FARBEN };
    };
	class IVORY_R8SPYDER {
        vItemSpace = 35;
        conditions = "";
        price = 135000;
        textures[] = { FARBEN };
    };
	class ivory_c {
        vItemSpace = 35;
        conditions = "";
        price = 241451;
        textures[] = { FARBEN };
    };
	class Mrshounka_c63_2015_civ {
        vItemSpace = 35;
        conditions = "";
        price = 186000;
        textures[] = { FARBEN };
    };	
	
	
	///////////autos Supersport//////////////
	
	class shounka_f430_spider {
        vItemSpace = 35;
        conditions = "";
        price = 105000;
        textures[] = { FARBEN };
    };

	class Urbanized_458Ferrari_black {
        vItemSpace = 35;
        conditions = "";
        price = 189950;
        textures[] = { FARBEN };
    };
	class ivory_lp560 {
        vItemSpace = 35;
        conditions = "";
        price = 165000;
        textures[] = { FARBEN };
    };
	class shounka_mp4 {
        vItemSpace = 35;
        conditions = "";
        price = 179900;
        textures[] = { FARBEN };
    };

	class Mrshounka_cayenne_p_civ {
        vItemSpace = 35;
        conditions = "";
        price = 74990;
        textures[] = { FARBEN };
    };
	
	class shounka_porsche911 {
        vItemSpace = 35;
        conditions = "";
        price = 30000;
        textures[] = { FARBEN };
    };

	class shounka_gt {
        vItemSpace = 35;
        conditions = "";
        price = 300000;
        textures[] = { FARBEN };
    };
	class Urbanized_LP700 {
        vItemSpace = 35;
        conditions = "";
        price = 230000;
        textures[] = { FARBEN };
    };
	class IVORY_REV {
        vItemSpace = 35;
        conditions = "";
        price = 275000;
        textures[] = { FARBEN };
    };

	class Mrshounka_pagani_c {
        vItemSpace = 35;
        conditions = "";
        price = 325000;
        textures[] = { FARBEN };
    };
	
	class Urbanized_LaFerrari {
        vItemSpace = 35;
        conditions = "";
        price = 350000;
        textures[] = { FARBEN };
    };

	class mrshounka_huracan_c {
        vItemSpace = 35;
        conditions = "";
        price = 300000;
        textures[] = { FARBEN };
    };
	class Mrshounka_veneno_c {
        vItemSpace = 35;
        conditions = "";
        price = 350000;
        textures[] = { FARBEN };
    };
	class Mrshounka_agera_p {
        vItemSpace = 35;
        conditions = "";
        price = 675325;
        textures[] = { FARBEN };
    };

	class Mrshounka_lykan_c {
        vItemSpace = 35;
        conditions = "";
        price = 400000;
        textures[] = { FARBEN };
    };

	// Ende Bearbeitung Tolga wuhu was ein scheiß kleinkram
	
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
        textures[] = { };
    };

	class I_MRAP_03_hmg_F {
        vItemSpace = 60;
        conditions = "";
        price = 626250;
        textures[] = { };
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
        textures[] = { };
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
        textures[] = { };
    };


    class B_Quadbike_01_F {
        vItemSpace = 20;
        conditions = "license_civ_driver";
        price = 1500;
        textures[] = { };
    };


    class I_Truck_02_covered_F {
        vItemSpace = 80;
        conditions = "license_civ_trucking";
        price = 55775;
        textures[] = { };
    };


    class I_Truck_02_transport_F {
        vItemSpace = 70;
        conditions = "license_civ_trucking";
        price = 59800;
        textures[] = { };
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
        textures[] = { };
    };


    class C_SUV_01_F {
        vItemSpace = 30;
        conditions = "license_civ_driver || call life_coplevel >= 1";
        price = 11300;
        textures[] = { };
    };

    class C_Van_01_transport_F {
        vItemSpace = 50;
        conditions = "license_civ_driver";
        price = 32597;
        textures[] = { };
    };

    class C_Van_01_box_F {
        vItemSpace = 60;
        conditions = "license_civ_trucking";
        price = 34500;
        textures[] = { };
    };


    class B_MRAP_01_F {
        vItemSpace = 60;
        conditions = "";
        price = 120000;
        textures[] = { };
    };


     class B_Heli_Light_01_stripped_F {
        vItemSpace = 30;
        conditions = "";
        price = 60000;
        textures[] = { };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 30;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 60000;
        textures[] = { };
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
        textures[] = { };
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
        textures[] = { };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 250;
        vFuelSpace = 42000;
        conditions = "license_civ_trucking";
        price = 66700;
          textures[] = { };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 650;
        vFuelSpace = 50000;
        conditions = "license_civ_trucking";
        price = 448500;
        textures[] = {};
    };
};