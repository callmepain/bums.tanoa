#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopLBChange.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz
	Edit by H4uklotz
	
    Description:
    Called when a new selection is made in the list box and
    displays various bits of information about the vehicle.
*/
disableSerialization;
private ["_className","_classNameLife","_initalPrice","_buyMultiplier","_rentMultiplier","_vehicleInfo","_colorArray","_ctrl","_trunkSpace","_maxspeed","_horsepower","_passengerseats","_fuel","_armor"];

//Fetch some information.
_className = (_this select 0) lbData (_this select 1);
_classNameLife = _className;
_vIndex = (_this select 0) lbValue (_this select 1);

_initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");

_buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier");
_rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier");
_insureMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier");

_purchasePrice = round(_initalPrice * _buyMultiplier);
_rentPrice = round(_initalPrice * _rentMultiplier);
_insurePrice = round(_purchasePrice + ( _purchasePrice * _insureMultiplier));

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
[_className] call life_fnc_vehicleShop3DPreview;

ctrlShow [2330,true];

switch (true) do 
{

	case (_className isKindOf "Air"):
	{
		(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>$%1</t><br/>"
			+(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b' align='right'>$%2</t><br/>"
			+("Kaufpreis inkl. Versicherung ")+ " <t color='#8cff9b' align='right'>$%7</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%4</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%6 Liter</t><br/>",
			[_rentPrice] call life_fnc_numberText,
			[_purchasePrice] call life_fnc_numberText,
			_vehicleInfo select 8,
			_vehicleInfo select 10,
			if(_trunkSpace == -1) then {"keine"} else {_trunkSpace},
			_vehicleInfo select 12,
			[_insurePrice] call life_fnc_numberText
		];
	};
	case (_className in life_Container):
	{
		(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>$%1</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%2</t><br/>",
		[_rentPrice] call life_fnc_numberText,
		if(_trunkSpace == -1) then {"keine"} else {_trunkSpace}
		];
	};
	default
	{
		(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>$%1</t><br/>"
			+(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b' align='right'>$%2</t><br/>"
			+("Kaufpreis inkl. Versicherung ")+ " <t color='#8cff9b' align='right'>$%9</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_HPower")+ " <t color='#8cff9b' align='right'>%4 KW (%8 PS)</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%6</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%7 Liter</t><br/>",
			[_rentPrice] call life_fnc_numberText,
			[_purchasePrice] call life_fnc_numberText,
			_vehicleInfo select 8,
			_vehicleInfo select 11,
			_vehicleInfo select 10,
			if(_trunkSpace == -1) then {"keine"} else {_trunkSpace},
			_vehicleInfo select 12,
			_vehicleInfo select 13,
			[_insurePrice] call life_fnc_numberText
		];
	};
};



_ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};
_colorArray = M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures");

{
    _flag = (_x select 1);
    _textureName = (_x select 0);
    if ((life_veh_shop select 2) isEqualTo _flag) then {
        _x params ["_texture"];
        private _toShow = [_x] call life_fnc_levelCheck;
        if (_toShow) then {
            _ctrl lbAdd _textureName;
            _ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
        };
    };
} forEach _colorArray;

lbSort _ctrl;

_ctrl lbSetCurSel 0;

if !((lbSize _ctrl)-1 isEqualTo -1) then {
    ctrlShow[2304,true];
} else {
    ctrlShow[2304,false];
};
((findDisplay 2300) displayCtrl 2304) lbSetCurSel 0;
true;
