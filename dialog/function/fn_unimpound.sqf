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
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
_vehicleName = getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName");

_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then {
    _vehicleLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");
_price = _price * _storageFee;

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (BANK < _price) exitWith 
{
	[(format[localize "STR_Garage_CashError",[_price] call life_fnc_numberText]),"Hinweiß","yellow"] call MSG_fnc_handle;
};

[(format["Dein Fahrzeug<br/><t color='#FFFF00'>%1<t><t color='#FFFFFF'><br/>wird geholt.<br/><br/>Du hast <t color='#FFFF00'>$%2<t><t color='#FFFFFF'> für den Stellplatz bezahlt.<br/>Bitte warten.<br/>Der zuständige Mitarbeiter such noch den Schlüssel.<t>",_vehicleName,[_price] call life_fnc_numberText]),"Fahrzeuggarage","green"] call MSG_fnc_handle;

if (life_garage_sp isEqualType []) then 
{
	[_vid,_pid,(life_garage_sp select 0),_unit,_price,(life_garage_sp select 1),_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
} 
else 
{
	[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
};



BANK = BANK - _price;
[15] call SOCK_fnc_updatePartial;
closeDialog 0;
