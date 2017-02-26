#include "..\..\script_macros.hpp"
/*
    File: fn_fuelLBChange.sqf
    Author: NiiRoZz
	Edit by H4uklotz
	
    Description:
    Change when slide change. That descripotion
*/
disableSerialization;
private ["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicle = (vehiclefuelList select _vindex);
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;

 ctrlShow[20302,true];
 ctrlShow[20303,true];
 ctrlShow[20304,true];
 ctrlShow[20305,true];
 ctrlShow[20307,true];
 ctrlShow[20308,true];
 ctrlShow[20309,true];

 
 _display = findDisplay 20300;
_preis = _display displayCtrl 20303;
_tanken = _display displayCtrl 20309;



_tanken ctrlSetStructuredText parseText format["Fahrzeug auftanken"];
 
_fuel = fuel _vehicle;
_fueltank = (_vehicleInfo select 12);
_fuelCost = 0;

if((typeOf _vehicle) in life_FahrenPKW) then
{
	_fuelCost = LIFE_SETTINGS(getNumber,"fuel_price_benzin");
};

if((typeOf _vehicle) in life_FahrenLKW) then
{
	_fuelCost = LIFE_SETTINGS(getNumber,"fuel_price_diesel");
};

if((typeOf _vehicle) in life_Fahrenair) then
{
	_fuelCost = LIFE_SETTINGS(getNumber,"fuel_price_kerosin");
};

life_fuelPrices = _fuelCost;

(CONTROL(20300,20308)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_Fuel")+ " %1l<br/>" +
    (localize "STR_Fuel_Tank_Vehicle")+ " %2l",
    _fueltank,
    round(_fueltank * _fuel)
];

{
    slidersetRange [_x,(floor(_fuel * _fueltank)),_fueltank];
	sliderSetPosition[_x ,(floor(_fuel * _fueltank))];
} forEach [20307];

_preis ctrlSetStructuredText parseText format["<t align='left'>Preis: <t align='right'>$%1</t>",life_fuelPrices];
true;
