#include "..\..\script_macros.hpp"
/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/
private ["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if (_mode isEqualTo -1 || _value isEqualTo -1) exitWith {};
disableSerialization;

switch (_mode) do {
    case 0:
    {
        life_settings_viewDistanceFoot = round(_value);
        ctrlSetText[2902,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceFoot",round(_value)];
    };

    case 1:
    {
        life_settings_viewDistanceCar = round(_value);
        ctrlSetText[2912,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceCar",round(_value)];
    };

    case 2:
    {
        life_settings_viewDistanceAir = round(_value);
        ctrlSetText[2922,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceAir",round(_value)];
    };

    case 3: {
        _classname = lbData[20306,(lbCurSel 20306)];
        _index =  lbValue[20306,(lbCurSel 20306)];
        if ((lbCurSel 20306) isEqualTo -1) exitWith {[(format[localize "STR_Select_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;};
        if (!isNil "_classname" || _classname =="") then 
		{
            _car = (vehiclefuelList select _index);
            _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
            _fuel = fuel _car;
            _fueltank = (_vehicleInfo select 12);
						
			((findDisplay 20300) displayCtrl 20304) ctrlSetStructuredText parseText  format ["<t align='left'>Tankmenge: <t align='right'>%1L</t>",round(_value) - (floor(_fuel * _fueltank))];
			((findDisplay 20300) displayCtrl 20305) ctrlSetStructuredText parseText  format ["<t align='left'>Gesamtkosten: <t align='right'>$%1</t>",round ((life_fuelPrices * (round(_value) -(floor(_fuel * _fueltank))))*100)/100 ];
        } 
		else 
		{
            [(format[localize "STR_Select_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;
        };
    };

    case 4: {
        player setDir (360 - _value);
    };
};
