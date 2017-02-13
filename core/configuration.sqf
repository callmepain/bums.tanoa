#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:
	Edit by H4uklotz
	
    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
life_save_gear = [];
life_container_activeObj = objNull;
life_disable_getIn = false;
life_disable_getOut = false;
life_admin_debug = true;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_position = [];
life_markers = false;
life_canpay_bail = true;
life_unconscious = false;
life_smartphoneTarget = ObjNull;
life_autosafe = false;

//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

life_istazed = false;
life_isknocked = false;
Life_ohrstecker = false;
life_vehicles = [];

for "_i" from 1 to 50 do 
{
	player setVariable[format["tankstelle_%1",_i],0,true];
};


/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

//////SkillSystem/////////
{
    _varName = getText(_x >> "variable");
    _sideFlag = getArray(_x >> "side");

	for "_i" from 0 to count(_sideFlag)-1 do {
		missionNamespace setVariable [SKILLSYSTEM_VARNAME(_varName,(_sideFlag select _i)),[1,0]];
	};
} forEach ("true" configClasses (missionConfigFile >> "profession"));



life_FahrenPKW = [];
life_FahrenLKW = [];
life_Fahrenair = [];


_pkw = missionConfigFile  >> "CarShops" >> "civ_car_oldtimer"; 
_pkws = getArray(_pkw >> "vehicles");
{ 
	life_FahrenPKW pushBack (_x select 0);
} forEach _pkws;

_pkw = missionConfigFile  >> "CarShops" >> "civ_car_gebrauchtwagen"; 
_pkws = getArray(_pkw >> "vehicles");
{ 
	life_FahrenPKW pushBack (_x select 0);
} forEach _pkws;

_pkw = missionConfigFile  >> "CarShops" >> "civ_car_sportwagen"; 
_pkws = getArray(_pkw >> "vehicles");
{ 
	life_FahrenPKW pushBack (_x select 0);
} forEach _pkws;

_pkw = missionConfigFile  >> "CarShops" >> "civ_car_neuwagen"; 
_pkws = getArray(_pkw >> "vehicles");
{ 
	life_FahrenPKW pushBack (_x select 0);
} forEach _pkws;

_pkw = missionConfigFile  >> "CarShops" >> "civ_car_supersport"; 
_pkws = getArray(_pkw >> "vehicles");
{ 
	life_FahrenPKW pushBack (_x select 0);
} forEach _pkws;

_lkw = missionConfigFile  >> "CarShops" >> "civ_truck"; 
_lkws = getArray(_lkw >> "vehicles");
{ 
	life_FahrenLKW pushBack (_x select 0);
} forEach _lkws;

_air = missionConfigFile  >> "CarShops" >> "civ_air"; 
_airs = getArray(_air >> "vehicles");
{ 
	life_Fahrenair pushBack (_x select 0);
} forEach _airs;

life_Container =
[
        "Box_NATO_AmmoVeh_F",
        "Box_East_AmmoVeh_F",
        "Box_IND_AmmoVeh_F",
        "Land_CargoBox_V1_F",
        "Land_Cargo20_blue_F",
        "Land_Cargo20_brick_red_F",
        "Land_Cargo20_cyan_F",
        "Land_Cargo20_grey_F",
        "Land_Cargo20_light_blue_F",
        "Land_Cargo20_light_green_F",
        "Land_Cargo20_military_green_F",
        "Land_Cargo20_orange_F",
        "Land_Cargo20_red_F",
        "Land_Cargo20_sand_F",
        "Land_Cargo20_white_F",
        "Land_Cargo20_yellow_F"
];
 
life_house =
[
        "Land_i_House_Big_02_V1_F",
        "Land_i_House_Big_02_V2_F",
        "Land_i_House_Big_02_V3_F",
        "Land_i_House_Big_01_V1_F",
        "Land_i_House_Big_01_V2_F",
        "Land_i_House_Big_01_V3_F",
        "Land_i_Garage_V1_F",
        "Land_i_Garage_V2_F",
        "Land_i_House_Small_01_V1_F",
        "Land_i_House_Small_01_V2_F",
        "Land_i_House_Small_01_V3_F",
        "Land_i_House_Small_02_V1_F",
        "Land_i_House_Small_02_V2_F",
        "Land_i_House_Small_02_V3_F",
        "Land_i_House_Small_03_V1_F",
        "Land_i_Stone_HouseSmall_V2_F",
        "Land_i_Stone_HouseSmall_V1_F",
        "Land_i_Stone_HouseSmall_V3_F"
];
 
life_truck =
[
        "C_Van_01_box_F",
        "I_Truck_02_covered_F",
        "I_Truck_02_transport_F",
        "O_Truck_03_covered_F",
        "O_Truck_03_transport_F",
        "O_Truck_03_repair_F",
        "C_Van_01_fuel_F",
        "I_Truck_02_fuel_F",
        "O_Truck_03_fuel_F",
        "O_Truck_03_device_F",
		"B_MRAP_01_F",
        "O_MRAP_02_F",
        "I_MRAP_03_F",
        "B_MRAP_01_hmg_F",
        "I_MRAP_03_hmg_F"
];
 
 
life_boat =
[
        "C_Rubberboat",
        "O_Lifeboat",
        "I_Boat_Transport_01_F",
        "O_Boat_Transport_01_F",
        "B_Boat_Transport_01_F",
        "I_G_Boat_Transport_01_F",
        "B_G_Boat_Transport_01_F",
        "O_G_Boat_Transport_01_F",
        "C_Boat_Civil_01_F",
        "C_Boat_Civil_01_police_F",
        "C_Boat_Civil_01_rescue_F",
        "B_Boat_Armed_01_minigun_F",
        "I_Boat_Armed_01_minigun_F",
        "O_Boat_Armed_01_hmg_F",
        "B_SDV_01_F",
        "O_SDV_01_F",
        "I_SDV_01_F"
];
 
life_heli =
[
        "B_Heli_Light_01_F",
        "B_Heli_Light_01_armed_F",
        "B_Heli_Transport_01_F",
        "B_Heli_Transport_01_camo_F",
        "B_Heli_Transport_03_unarmed_F",
        "B_Heli_Attack_01_F",
        "C_Heli_Light_01_civil_F",
        "I_Heli_Transport_02_F",
        "I_Heli_light_03_unarmed_F",
        "O_Heli_Transport_04_F",
        "O_Heli_Light_02_unarmed_F"
];

life_heli_M900 =
[
		"C_Heli_Light_01_civil_F",
		"B_Heli_Light_01_F",
        "B_Heli_Light_01_armed_F"
];
 
life_car =
[
        "C_Kart_01_Blu_F",
        "C_Kart_01_Fuel_F",
        "C_Kart_01_Red_F",
        "C_Kart_01_Vrana_F",
        "B_Quadbike_01_F",
        "C_Hatchback_01_F",
        "C_Hatchback_01_sport_F",
        "C_Offroad_01_F",
        "B_G_Offroad_01_F",
        "C_SUV_01_F",
        "C_Van_01_transport_F",
        "I_G_Offroad_01_armed_F"
];

life_hmmt =
[
		"B_Truck_01_covered_F",
        "B_Truck_01_transport_F",
        "B_Truck_01_box_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_Repair_F"
];