#include "..\..\script_macros.hpp"
/*
    File: fn_unimpound.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Yeah... Gets the vehicle from the garage.
*/
private ["_vehicle","_vehicleLife","_vid","_pid","_unit","_price","_price","_storageFee","_purchasePrice"];
disableSerialization;
if ((lbCurSel 3802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[3802,(lbCurSel 3802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[3802,(lbCurSel 3802)];
_pid = getPlayerUID player;
_unit = player;
_sp = getMarkerPos life_garage_sp;
_garage = life_garage_sp;

_spawntext = localize "STR_Garage_spawn_Success";
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then {
    _vehicleLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

switch(_garage) do
{
	case "impound_car":
	{
		_sp = getMarkerPos "impound_car";
		
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "impound_car_1";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "impound_car_2";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "impound_car_3";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "impound_car_4";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "impound_car_5";
		};
	};
	
	case "impound_air":
	{
		_sp = getMarkerPos "impound_air";
		
		if(count(nearestObjects[_sp,["Car","Ship","Air"],4.5]) > 0) then 
		{
			_sp = getMarkerPos "impound_air_1";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],4.5]) > 0) then 
		{
			_sp = getMarkerPos "impound_air_2";
		};
	};
};

_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],3];
if(count _nearVehicles > 0) exitWith
{
	// [[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_impound_multiplier");
_price = _price * _storageFee;

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (BANK < _price) exitWith 
{
	[(format[localize "STR_Garage_CashError",[_price] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;
};

[(format["Dein Fahrzeug<br/><t color='#FFFF00'>%1<t><t color='#FFFFFF'><br/>wird geholt.<br/><br/>Du hast eine Auslösegebühr von <t color='#FFFF00'>$%2<t><t color='#FFFFFF'> gezahlt.<br/>Bitte warten.<br/>Der zuständige Mitarbeiter such noch den Schlüssel.<t>",_vehicleName,[_price] call life_fnc_numberText]),"Verwahrstelle","green"] call MSG_fnc_handle;

uiSleep 2;

if (life_garage_sp isEqualType []) then 
{
	[_vid,_pid,(life_garage_sp select 0),_unit,_price,(life_garage_sp select 1),_spawntext] remoteExec ["TON_fnc_spawnImpoundVehicle",RSERV];
} 
else 
{
	[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnImpoundVehicle",RSERV];
};


BANK = BANK - _price;
[15] call SOCK_fnc_updatePartial;
closeDialog 0;
