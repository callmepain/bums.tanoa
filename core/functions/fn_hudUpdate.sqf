#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart
	Edit by H4uklotz
	
    Description:
    Updates the HUD when it needs to.
*/
// disableSerialization;


private["_ui","_food","_water","_health","_battery"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_battery = _ui displayCtrl 23520; 
_direction = _ui displayCtrl 23521; 
_fps = _ui displayCtrl 23522; 
_fatigue = _ui displayCtrl 23523; 
_status = _ui displayCtrl 23524; 


_heading = "";
_dir = getDir vehicle player;


switch (true) do 
{
	case (life_hunger >= 50): 	{_food ctrlSetTextColor [0,1,0,1];};
	case (life_hunger >= 30): 	{_food ctrlSetTextColor [1,1,0,1];};
	case (life_hunger >= 20): 	{_food ctrlSetTextColor [1,0.645,0,1];};
	case (life_hunger <= 10): 	{_food ctrlSetTextColor [1,0,0,1];};

};

switch (true) do 
{
	case (life_thirst >= 50): 	{_water ctrlSetTextColor [0,1,0,1];};
	case (life_thirst >= 30): 	{_water ctrlSetTextColor [1,1,0,1];};
	case (life_thirst >= 20): 	{_water ctrlSetTextColor [1,0.645,0,1];};
	case (life_thirst <= 10): 	{_water ctrlSetTextColor [1,0,0,1];};
};

// switch (true) do 
// {
	// case (life_battery >= 50): 	{_battery ctrlSetTextColor [0,1,0,1];};
	// case (life_battery >= 30): 	{_battery ctrlSetTextColor [1,1,0,1];};
	// case (life_battery >= 20): 	{_battery ctrlSetTextColor [1,0.645,0,1];};
	// case (life_battery <= 10): 	{_battery ctrlSetTextColor [1,0,0,1];};
// };

switch (true) do {
		
	case (damage Player >= 0.75): {_health ctrlSetTextColor [1,0,0,1];};
	case (damage Player >= 0.5):  {_health ctrlSetTextColor [1,0.645,0,1];};
	case (damage Player >= 0.25): {_health ctrlSetTextColor [1,1,0,1];};
    case (damage Player < 0.25):  {_health ctrlSetTextColor [0,1,0,1];}; 
};


switch (true) do {

	case (getFatigue Player >= 0.75): {_fatigue ctrlSetTextColor [1,0,0,1];};
	case (getFatigue Player >= 0.50): {_fatigue ctrlSetTextColor [1,0.645,0,1];};
	case (getFatigue Player >= 0.25): {_fatigue ctrlSetTextColor [1,1,0,1];};  
	case (getFatigue Player < 0.25):  	{_fatigue ctrlSetTextColor [0,1,0,1];}; 
};

switch (true) do {

	case (_dir >= 337.5 || _dir < 22.5): 	{_heading = "N";};
	case (_dir >= 292.5 && _dir < 337.5): {_heading = "NW";};
	case (_dir >= 247.5 && _dir < 292.5): {_heading = "W";};
	case (_dir >= 202.5 && _dir < 247.5): {_heading ="SW";};
	case (_dir >= 157.5 && _dir < 202.5): {_heading ="S";};
	case (_dir >= 112.5 && _dir < 157.5): {_heading ="SO";};
	case (_dir >= 67.5 && _dir < 112.5): 	{_heading ="O";};
	case (_dir >= 22.5 && _dir < 67.5): 	{_heading ="NO";};
};

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.368];
_food ctrlSetText format["%1%2", life_hunger,"%"];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.322];
_water ctrlSetText format["%1%2", life_thirst,"%"];
_water ctrlCommit 0;
// Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.276];
_health ctrlSetText format["%1%2", round((1 - (damage player)) * 100),"%"];
_health ctrlCommit 0;
//Update battery
// _battery ctrlSetPosition [safeZoneX+safeZoneW-0.0925,safeZoneY+safeZoneH-0.27];
// _battery ctrlSetText format["%1%2", life_battery,"%"];
// _battery ctrlCommit 0;
//Update direction
_direction ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.18];
_direction ctrlSetText format ["%1", _heading];
_direction ctrlCommit 0;
//Update fps
_fps ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.1325];
_fps ctrlSetText format ["%1 FPS", round diag_fps];
_fps ctrlCommit 0;
//Update fatigue
_fatigue ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.2275];
_fatigue ctrlSetText format ["%1%2", round((1 - (getFatigue player)) * 100), "%"];
_fatigue ctrlCommit 0;
//Update statusbar
// _status ctrlSetPosition [safezoneX + safezoneW-0.09,safezoneY + safezoneH - 0.08];
_status ctrlSetText format["Cops: %1 | Civs: %2 | Medic: %3 | ADAC: %4 | ASSI-TS-ADRESSE | powered by Team [ASSI] ", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, east countSide playableUnits];
_status ctrlCommit 0;