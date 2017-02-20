#include "..\..\script_macros.hpp"
/*
    File: fn_fuelStatOpen.sqf
    Author : NiiRoZz
	Edit by H4uklotz
	
    Description:
    Open dialog Pump.
*/
private ["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_fuelCost"];

disableSerialization;
//Long boring series of checks
if (life_tanken) exitWith 
{
	["Du tankst schon ein Fahrzeug.","Hinweis","yellow"] call MSG_fnc_handle;
};
if (dialog) exitWith {};

life_tanken = true;
_fuelstation = (_this select 0);
_fuelstations = nearestObjects [player, ["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"],10];

if (_fuelstations isEqualTo []) exitWith {life_tanken = false;};

_vehicleList = nearestObjects [player, ["landvehicle","air"], 10];

if (count _vehicleList < 1) exitWith 
{
	[(format[localize "STR_NOTF_VehicleNear"]),"Hinweis","yellow"] call MSG_fnc_handle;
	life_tanken = false;
};

if (!createDialog "Life_FuelStat") exitWith {};

_fuelCost = LIFE_SETTINGS(getNumber,"fuel_cost");

[] spawn {waitUntil {!dialog}; life_tanken = false;};

ctrlSetText [1100,"Fuel Station"];

if (isNil "life_fuelPrices") then 
{
    life_fuelPrices = _fuelCost;
};

//Fetch the shop config.
vehicleFuelList =[];

_control = ((findDisplay 20300) displayCtrl 20302);
lbClear _control; //Flush the list.

ctrlSetText [20322,format [localize "STR_Price_Fuel_Pump",life_fuelPrices]];
ctrlSetText [20323,format ["Total : %1$",life_fuelPrices * 0.1]];

{
	if((alive _x) && (_x in life_vehicles)) then 
	{
		vehicleFuelList pushBack _x;
	};
} foreach _vehicleList;

{
	if(alive _x) then 
	{
		_className = (typeOf _x);
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
				
		if(_x getVariable ["betankung",false]) then
		{
			_control lbAdd format["%1 - [Entfernung: %2m] - [wird aufgetankt]",_displayName,round(_fuelstation distance _x)];
			_control lbSetData [(lbSize _control)-1,_className];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
		}
		else
		{
			_control lbAdd format["%1 - [Entfernung: %2m]",_displayName,round(_fuelstation distance _x)];
			_control lbSetData [(lbSize _control)-1,_className];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
		};
	};
} foreach vehicleFuelList;