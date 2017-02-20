#include "..\..\script_macros.hpp"
/*
    File: fn_jerryRefuel.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Refuels the vehicle if the player has a fuel can.
*/
private ["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
//_vehicle = cursorObject;
_vehicle = _this select 1;
_vehicleInfo = [typeOf _vehicle] call life_fnc_fetchVehInfo;
_vehicleTankMax = _vehicleInfo select 12;
_fuel_old = fuel _vehicle;
_cantype = _this select 0;

_can = [0,""];
_Sprit = 0;
switch (_cantype) do {
	case "fuelFB5L": { _can = [5, "benzin"]; };
	case "fuelFD25L": { _can = [25, "diesel"]; };
	case "fuelFK50L": { _can = [50, "kerosin"]; };
};
if (_fuel_old > 0.9) exitWith {hint "Dein Auto ist schon voll getankt"};
if ((typeOf _vehicle) in life_hmmt) then {
	_Sprit = ((1 - _fuel_old) / (((_vehicleTankMax * 10) - ((_vehicleTankMax * 10) * _fuel_old)) / (_can select 0)));
} else {
	_Sprit = ((1 - _fuel_old) / ((_vehicleTankMax - (_vehicleTankMax * _fuel_old)) / (_can select 0)));
};
life_interrupted = false;

if (isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if (!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if (player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};
if (!((typeOf _vehicle) in life_FahrenPKW && (_can select 1) == "benzin") && !((typeOf _vehicle) in life_hmmt && (_can select 1) == "diesel") && !((typeOf _vehicle) in life_FahrenLKW && (_can select 1) == "diesel") && !((typeOf _vehicle) in life_Fahrenair && (_can select 1) == "kerosin")) exitWith {hint "Du hast den falschen Kanister dabei!"};
if (((typeOf _vehicle) in life_FahrenPKW) && (_can select 1) == "benzin") then {
	if(!([false,"fuelFB5L",1] call life_fnc_handleInv)) exitWith {hint "Du hast keinen Kanister dabei!"};
} else {
	if (((typeOf _vehicle) in life_FahrenLKW || (typeOf _vehicle) in life_hmmt) && (_can select 1) == "diesel") then {
		if(!([false,"fuelFD25L",1] call life_fnc_handleInv)) exitWith {hint "Du hast keinen Kanister dabei!"};
	}else {
		if ((typeOf _vehicle) in life_Fahrenair && (_can select 1) == "kerosin") then {
			if(!([false,"fuelFK50L",1] call life_fnc_handleInv)) exitWith {hint "Du hast keinen Kanister dabei!"};
		}; 
	};
};
//if (!([false,"fuelFull",1] call life_fnc_handleInv)) exitWith {};
life_action_inUse = true;

_displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

_upp = format [localize "STR_ISTR_Jerry_Process",_displayName];

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.2;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (!alive player) exitWith {};
    if (life_interrupted) exitWith {};
};
life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


if(!local _vehicle) then
{
	[_vehicle,(Fuel _vehicle) + _Sprit] remoteExecCall ["life_fnc_setFuel",_vehicle];
}
else
{
	_vehicle setFuel ((Fuel _vehicle) + _Sprit);
};
titleText[format [localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];
switch (_cantype) do {
	case "fuelFB5L": { [true,"fuelFBE",1] call life_fnc_handleInv; };
	case "fuelFD25L": { [true,"fuelFDE",1] call life_fnc_handleInv; };
	case "fuelFK50L": { [true,"fuelFKE",1] call life_fnc_handleInv; };
};