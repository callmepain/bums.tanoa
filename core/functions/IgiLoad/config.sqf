#include "..\..\..\script_macros.hpp"
//if true then show debug globalChat (TODO add more hints)
IL_DevMod = false;

if (isnil "IL_Variables") then
{
	IL_Variables = true;

	//Check new vehicles time
	IL_Check_Veh_Min = 30;
	IL_Check_Veh_Max = 60;
		
	//Dealing with cargo damage
	//-1 - do nothing
	//0 - set to 0
	//1 - keep such as before loading/unloading
	IL_CDamage = 1;

	//AddAction menu position
	IL_Action_LU_Priority = 30; //Load and (para)unload
	IL_Action_O_Priority = 0;	//Open and close
	IL_Action_S_Priority = 0; //Setup

	//Maximum capacity for vehicles
	IL_Num_Slots_MOTORBOAT = -2;
	IL_Num_Slots_OFFROAD = -2;
	IL_Num_Slots_VAN = -3;
	IL_Num_Slots_RAPTOR = -2;
	IL_Num_Slots_MOHAWK = -7;
	IL_Num_Slots_KAMAZ = -4;
	IL_Num_Slots_TEMPEST = -5;
	IL_Num_Slots_HEMTT = -6;
	
	//Player addScore after loading and unloading
	IL_Load_Score = 20;
	//Para unload score = 2 * IL_Unload_Score
	IL_Unload_Score = 10;
	
	//The minimum altitude for the drop with parachute
	IL_Para_Drop_ATL = 50;
	IL_Para_Jump_ATL = 30;
	//The minimum altitude for parachute opening
	IL_Para_Drop_Open_ATL = 150;
	IL_Para_Jump_Open_ATL = 150;
	//Parachute get velocity from player or cargo
	IL_Para_Drop_Velocity = true;
	IL_Para_Jump_Velocity = true;

	//Set smoke and light for parachute drop.
	IL_Para_Smoke = true;
	IL_Para_Light = true;
	//Additional smoke after landing
	IL_Para_Smoke_Add = true;
	//Additional light after landing
	IL_Para_Light_Add = true;
	//Smoke and light color
	IL_Para_Smoke_Default = "SmokeshellGreen";
	IL_Para_Light_Default = "Chemlight_green";
	IL_Para_Smoke_Veh = "SmokeshellBlue";
	IL_Para_Light_Veh = "Chemlight_blue";

	//This allows for loading or unloading, if a player is in the area of loading or copilot
	IL_Can_Inside = true;
	IL_Can_CoPilot = true;
	IL_Can_Outside = true;

	//
	//IL_SDistU = 20;//No longer needed
	IL_SDistL = 4.5;
	IL_SDistL_Heli_offset = 1;

	//Load and unload (not para) max speed in km/h
	IL_LU_Speed = 10;
	//Load and unload (not para) max height in m
	IL_LU_Alt = 3;
	//Enable or disable usable cargo ramp in CH-49
	IL_Ramp = true;
	
	//Enable change of vehicle mass
	IL_Mass = true;
	
	// Supported vehicles
	IL_Supported_Vehicles_Motorboat = ["C_Boat_Civil_01_F", "C_Boat_Civil_01_rescue_F", "C_Boat_Civil_01_police_F"];
	IL_Supported_Vehicles_OFFROAD = ["Mrshounka_raptor_civ"];
	IL_Supported_Vehicles_VAN = ["C_Van_01_box_F", "B_G_Van_01_transport_F", "C_Van_01_transport_F"];
	IL_Supported_Vehicles_HEMTT = ["B_Truck_01_transport_F"];
	IL_Supported_Vehicles_HEMTT_Transporter = ["B_Truck_01_covered_F"];
	IL_Supported_Vehicles_HEMTT_BOX = ["B_Truck_01_box_F"];
	IL_Supported_Vehicles_KAMAZ_Transporter = ["I_Truck_02_covered_F", "O_Truck_02_covered_F"];
	IL_Supported_Vehicles_KAMAZ = ["I_Truck_02_transport_F", "O_Truck_02_transport_F"];
	IL_Supported_Vehicles_TEMPEST_Transporter = ["O_Truck_03_covered_F","O_Truck_03_repair_F"];
	IL_Supported_Vehicles_TEMPEST = ["O_Truck_03_transport_F"];
	IL_Supported_Vehicles_MOHAWK = ["I_Heli_Transport_02_F", "CH49_Mohawk_FG", "Marinir_CH49_Mohawk_FG"];

	
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_HEMTT_BOX + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_KAMAZ + IL_Supported_Vehicles_KAMAZ_Transporter + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_TEMPEST_Transporter + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_HEMTT_Transporter + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD + IL_Supported_Vehicles_Motorboat;

	// Vehicles with the ability to dropping the load on the parachute
	IL_Para_Drop_Vehicles = IL_Supported_Vehicles_MOHAWK;

	//Supported cargo
	IL_Supported_HEMTT = ["B_Truck_01_covered_F", "B_Truck_01_transport_F", "B_Truck_01_box_F", "Marinir_Truck_01_box_FG", "Marinir_Truck_01_transport_FG", "Marinir_Truck_01_covered_FG", "B_mas_mar_Truck_01_covered_F", "B_mas_mar_Truck_01_transport_F", "B_Truck_01_mover_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F", "B_Truck_01_Repair_F"];
	IL_Supported_KAMAZ = ["I_Truck_02_transport_F", "O_Truck_02_transport_F", "I_Truck_02_covered_F", "O_Truck_02_covered_F", "caf_HLVW_open_AR", "caf_HLVW_open", "caf_HLVW_covered_ar", "caf_HLVW_covered"];
	IL_Supported_TEMPEST = ["O_Truck_03_transport_F", "O_Truck_03_covered_F"];
	IL_Supported_Strider = ["I_MRAP_03_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "CAF_TAPV_ar", "caf_tapv_gl_ar", "caf_tapv_50_ar", "CAF_TAPV_tw", "caf_tapv_gl_tw", "caf_tapv_50_tw", "Night_B_MRAP_03_F", "Night_B_MRAP_03_gmg_F", "Night_B_MRAP_03_hmg_F"];
	IL_Supported_Hunter = ["B_MRAP_01_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F", "Marinir_B_MRAP_01_FG" , "Marinir_MRAP_01_gmg_FG", "Marinir_MRAP_01_hmg_FG", "B_mas_mar_MRAP_01_med_F", "B_mas_mar_MRAP_01_F", "B_mas_mar_MRAP_01_gmg_F", "B_mas_mar_MRAP_01_hmg_F"];
	IL_Supported_Ifrit = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F"];
	IL_Supported_VAN = life_FahrenPKW;//["C_Van_01_box_F", "B_G_Van_01_transport_F", "C_Van_01_transport_F"];
	IL_Supported_OFFROAD = ["Mrshounka_raptor_civ"];
	IL_Supported_SUV = ["C_SUV_01_F"];
	IL_Supported_Motorboat = ["C_Boat_Civil_01_F", "C_Boat_Civil_01_rescue_F", "C_Boat_Civil_01_police_F"];
    IL_Supported_Speedboot = ["B_Boat_Armed_01_minigun_F", "I_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F"];
	IL_Supported_Hatchback = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F"];
	IL_Supported_Quadbike = ["I_Quadbike_01_F", "C_Quadbike_01_F", "O_Quadbike_01_F", "B_G_Quadbike_01_F", "B_Quadbike_01_F", "CAF_Quadbike_OD", "CAF_Quadbike_AR", "Marinir_Quadbike_01_FG", "B_mas_mar_Quadbike_01_F"];
	IL_Supported_Kart = ["C_Kart_01_Blu_F", "C_Kart_01_Red_F", "C_Kart_01_Fuel_F", "C_Kart_01_Vrana_F", "C_Kart_01_F"]; 
	IL_Supported_Veh_Ammo = ["Box_NATO_AmmoVeh_F", "Box_East_AmmoVeh_F", "Box_IND_AmmoVeh_F", "Land_CargoBox_V1_F", "ASC_B_box"];
	IL_Supported_Rubberboat = ["I_Boat_Transport_01_F", "O_Boat_Transport_01_F", "B_G_Boat_Transport_01_F", "B_Boat_Transport_01_F", "C_Rubberboat", "O_Lifeboat", "B_Lifeboat", "Marinir_duck_base_F", "B_mas_mar_Boat_Transport_01_F"];
	IL_Supported_SDV = ["I_SDV_01_F", "O_SDV_01_F", "B_SDV_01_F", "B_mas_mar_SDV_01_F"];
	IL_Supported_Cargo20 = ["Land_Cargo20_blue_F", "Land_Cargo20_brick_red_F", "Land_Cargo20_cyan_F", "Land_Cargo20_grey_F", "Land_Cargo20_light_blue_F", "Land_Cargo20_light_green_F", "Land_Cargo20_military_green_F", "Land_Cargo20_orange_F", "Land_Cargo20_red_F", "Land_Cargo20_sand_F", "Land_Cargo20_white_F", "Land_Cargo20_yellow_F"];

	IL_Supported_Cargo_ALL = IL_Supported_Quadbike + IL_Supported_Kart;
	
	IL_Supported_Cargo_NonVeh_Motorboat = (IL_Supported_Veh_Ammo);
	IL_Supported_Cargo_Motorboat = IL_Supported_Cargo_NonVeh_Motorboat;
	
	IL_Supported_Cargo_Veh_Offroad = IL_Supported_Cargo_ALL;
	IL_Supported_Cargo_NonVeh_Offroad = (IL_Supported_Veh_Ammo);
	IL_Supported_Cargo_Offroad = IL_Supported_Cargo_Veh_Offroad + IL_Supported_Cargo_NonVeh_Offroad;
	
	IL_Supported_Cargo_Veh_VAN = IL_Supported_Cargo_ALL + IL_Supported_Cargo_Veh_Offroad;
	IL_Supported_Cargo_NonVeh_VAN = IL_Supported_Cargo_NonVeh_Offroad;
	IL_Supported_Cargo_VAN = IL_Supported_Cargo_Veh_VAN + IL_Supported_Cargo_NonVeh_VAN;
	
	
	IL_Supported_Cargo_Veh_Kamaz = [];
	IL_Supported_Cargo_Veh_Kamaz_Transporter = [];
	IL_Supported_Cargo_Veh_HEMTT = [];
	IL_Supported_Cargo_Veh_HEMTT_BOX = [];
	IL_Supported_Cargo_Veh_TEMPEST = [];
	IL_Supported_Cargo_Veh_TEMPEST_Transporter = [];
	
	if(playerside == east) then 
	{
		IL_Supported_Cargo_Veh_Kamaz = IL_Supported_Cargo_ALL + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_VAN + IL_Supported_OFFROAD + IL_Supported_Motorboat + IL_Supported_Speedboot;
		IL_Supported_Cargo_Veh_Kamaz_Transporter = IL_Supported_Cargo_ALL + IL_Supported_Rubberboat;
		IL_Supported_Cargo_Veh_TEMPEST = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_KAMAZ;
		IL_Supported_Cargo_Veh_TEMPEST_Transporter = IL_Supported_Cargo_Veh_Kamaz_Transporter;
		IL_Supported_Cargo_Veh_HEMTT = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_Strider + IL_Supported_Hunter + IL_Supported_Ifrit + IL_Supported_HEMTT + IL_Supported_TEMPEST + IL_Supported_KAMAZ;
		IL_Supported_Cargo_Veh_HEMTT_BOX = IL_Supported_SDV;
	}
	else
	{
		IL_Supported_Cargo_Veh_Kamaz = IL_Supported_Cargo_ALL + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Motorboat;
		IL_Supported_Cargo_Veh_Kamaz_Transporter = IL_Supported_Cargo_ALL + IL_Supported_Rubberboat;
		IL_Supported_Cargo_Veh_TEMPEST = IL_Supported_Cargo_Veh_Kamaz;
		IL_Supported_Cargo_Veh_TEMPEST_Transporter = IL_Supported_Cargo_Veh_Kamaz_Transporter;
		IL_Supported_Cargo_Veh_HEMTT = IL_Supported_Cargo_Veh_Kamaz;
		;
	};
	
	IL_Supported_Cargo_NonVeh_Kamaz = IL_Supported_Veh_Ammo + IL_Supported_Cargo20;
	IL_Supported_Cargo_Kamaz = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_Cargo_NonVeh_Kamaz;
	
	IL_Supported_Cargo_NonVeh_Kamaz_Transporter = IL_Supported_Veh_Ammo;
	IL_Supported_Cargo_Kamaz_Transporter = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_Cargo_NonVeh_Kamaz;
	
	IL_Supported_Cargo_NonVeh_HEMTT = IL_Supported_Cargo_NonVeh_Kamaz;
	IL_Supported_Cargo_HEMTT = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Cargo_NonVeh_HEMTT;
	
	IL_Supported_Cargo_NonVeh_HEMTT_Transporter = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Cargo_NonVeh_HEMTT;
	IL_Supported_Cargo_HEMTT_Transporter = IL_Supported_Cargo_NonVeh_HEMTT_Transporter;
	
	IL_Supported_Cargo_NonVeh_TEMPEST = IL_Supported_Cargo_NonVeh_HEMTT;
	IL_Supported_Cargo_TEMPEST = IL_Supported_Cargo_Veh_TEMPEST + IL_Supported_Cargo_NonVeh_TEMPEST;
	
	IL_Supported_Cargo_NonVeh_TEMPEST_Transporter = IL_Supported_Cargo_NonVeh_Kamaz_Transporter;
	IL_Supported_Cargo_TEMPEST_Transporter = IL_Supported_Cargo_Veh_TEMPEST + IL_Supported_Cargo_NonVeh_TEMPEST_Transporter;
	
	IL_Supported_Cargo_Veh_Mohawk = IL_Supported_Cargo_ALL + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback;
	IL_Supported_Cargo_NonVeh_Mohawk = IL_Supported_Veh_Ammo;
	IL_Supported_Cargo_Mohawk = IL_Supported_Cargo_Veh_Mohawk + IL_Supported_Cargo_NonVeh_Mohawk;
};
//	END VARIABLES
