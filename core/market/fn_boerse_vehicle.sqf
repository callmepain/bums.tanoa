#include <macro.h>
/*
	File: fn_economy_vehicle.sqf
	
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];

disableSerialization;
//Long boring series of checks
if(!createDialog "Life_Vehicle_Shop_v3") exitWith {diag_log "!dialog";};


ctrlSetText [2301,"Fahrzeugpreisliste"];

//Fetch the shop config.


_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2303,false];
ctrlShow [2304,false];


_list =
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
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F",
	"B_MRAP_01_hmg_F",
	"I_MRAP_03_hmg_F",
	"I_G_Offroad_01_armed_F",

	"C_Van_01_box_F",
	"I_Truck_02_transport_F",
	"I_Truck_02_covered_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
	"O_Truck_03_repair_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_box_F",
	"B_Truck_01_Repair_F",
	"C_Van_01_fuel_F",
	"I_Truck_02_fuel_F",
	"O_Truck_03_fuel_F",
	"B_Truck_01_fuel_F",
	"O_Truck_03_device_F",
	


	"B_Heli_Light_01_F",
	"B_Heli_Light_01_armed_F",
	"B_Heli_Transport_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_03_unarmed_F",
	// "B_Heli_Attack_01_F",637500
	"C_Heli_Light_01_civil_F",
	"I_Heli_Transport_02_F",
	"I_Heli_light_03_unarmed_F",
	"O_Heli_Transport_04_F",
	"O_Heli_Light_02_unarmed_F",
	


	"C_Rubberboat",
	"O_Lifeboat",
	"I_Boat_Transport_01_F",
	"I_G_Boat_Transport_01_F",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_police_F",
	"C_Boat_Civil_01_rescue_F",
	"B_Boat_Armed_01_minigun_F",
	"O_Boat_Armed_01_hmg_F",
	"B_SDV_01_F",

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


//Loop through
{
	_className = _x;
	
	_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach _list;

