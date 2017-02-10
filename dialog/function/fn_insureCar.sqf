#include "..\..\script_macros.hpp" 
/* 
File: fn_insureCar.sqf 
Author: Guit0x "Lintox" 
Description: 
Insure a vehicle from the garage. 
*/ 
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_multiplier","_price","_purchasePrice","_insurancePrice"]; 
disableSerialization; 
if ((lbCurSel 2802) isEqualTo -1) exitWith 
{
	[(format[localize "STR_Global_NoSelection"]),"Fehler","red"] call MSG_fnc_handle;
}; 
_vehicle = lbData[2802,(lbCurSel 2802)]; 
_vehicle = (call compile format["%1",_vehicle]) select 0; 
_vehicleLife = _vehicle; 
_vid = lbValue[2802,(lbCurSel 2802)]; 
_pid = getPlayerUID player; 
_unit = player; 
_vehicleName = getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName");

if(isNil "_vehicle") exitWith 
{
	[(format[localize "STR_Garage_Selection_Error"]),"Fehler","red"] call MSG_fnc_handle;
}; 

if ((time - life_action_delay) < 1.5) exitWith 
{
	[(format[localize "STR_NOTF_ActionDelay"]),"Fehler","red"] call MSG_fnc_handle;
}; 

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then 
{ 
	_vehicleLife = "Default"; //Use Default class if it doesn't exist 
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle]; 
}; 

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price"); 
_multiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier"); 
_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier"); 

_insurancePrice = _purchasePrice * _multiplier; 
if(!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500}; 

if(BANK < _insurancePrice) exitWith 
{
	[(format[(localize "STR_GNOTF_NotEnoughMoney"),[_insurancePrice] call life_fnc_numberText]),"Fehler","red"] call MSG_fnc_handle;
}; 

if (life_HC_isActive) then { 
	[_vid,_pid] remoteExecCall ["HC_fnc_insureCar",HC_Life]; 
} else { 
	[_vid,_pid] remoteExecCall ["TON_fnc_insureCar",RSERV]; 
}; 

[(format["Du hast deinen<br/>%1<br/>für $%2 versichert.",_vehicleName,[_insurancePrice] call life_fnc_numberText]),"Fahrzeugversicherung","green"] call MSG_fnc_handle;

BANK = BANK - _insurancePrice; 
life_action_delay = time; 
closeDialog 0;