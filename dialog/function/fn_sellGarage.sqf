#include "..\..\script_macros.hpp"
/*
    File: fn_sellGarage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells a vehicle from the garage.
*/
private ["_vehicle","_vehicleLife","_vid","_pid","_sellPrice","_multiplier","_price","_purchasePrice"];
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {[(format [localize "STR_Global_NoSelection"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;



if (isNil "_vehicle") exitWith {[(format [localize "STR_Garage_Selection_Error"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if ((time - life_action_delay) < 1.5) exitWith {[(format [localize "STR_NOTF_ActionDelay"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then {
    _vehicleLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
switch (playerSide) do {
    case civilian: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
    };
    case independent: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
    };
    case east: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
    };
};

_sellPrice = _purchasePrice * _multiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

if (life_HC_isActive) then {
    [_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["HC_fnc_vehicleDelete",HC_Life];
} else {
    [_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
};

hint format [localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
BANK = BANK + _sellPrice;
[1] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_soldVehicle_BEF",_vehicleLife,[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        advanced_log = format [localize "STR_DL_AL_soldVehicle",profileName,(getPlayerUID player),_vehicleLife,[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

life_action_delay = time;
closeDialog 0;