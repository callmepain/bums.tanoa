#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_list_1x","_list_2x"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;


_basePrice = [_className,__GETC__(life_vehicle_prices)] call TON_fnc_index;
if(_basePrice == -1) then {_basePrice = 1000;} else {_basePrice = (__GETC__(life_vehicle_prices) select _basePrice) select 1;};
_lagerpreis = [_className,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_lagerpreis == -1) then {_lagerpreis = 1000;} else {_lagerpreis = (__GETC__(life_garage_prices) select _lagerpreis) select 1;};
_verkaufpreis = [_className,__GETC__(life_garage_sell)] call TON_fnc_index;
if(_verkaufpreis == -1) then {_verkaufpreis = 1000;} else {_verkaufpreis = (__GETC__(life_garage_sell) select _verkaufpreis) select 1;};
_impoundpreis = [_className,__GETC__(life_vehicle_impound)] call TON_fnc_index;
if(_impoundpreis == -1) then {_impoundpreis = 1000;} else {_impoundpreis = (__GETC__(life_vehicle_impound) select _impoundpreis) select 1;};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_list_2x = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Offroad_01_F"];


switch (true) do 
{

	case (_className isKindOf "Air"):
	{
		(getControl(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>%1€</t><br/>"
			+(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b' align='right'>%2€</t><br/>"
			+"Verkaufspreis:"+" <t color='#8cff9b' align='right'>%11€</t><br/>"
			+"Lagerpreis:"+" <t color='#8cff9b' align='right'>%10€</t><br/>"
			+"Auslösegebühr:"+" <t color='#8cff9b' align='right'>%12€</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_DSeats")+ " <t color='#8cff9b' align='right'>1</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%6</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%7 Liter</t><br/>"
			+"max. kaufbar" +	"<t color='#8cff9b' align='right'>%9</t>",
		[_basePrice] call life_fnc_numberText,
		[round(_basePrice * 1.5)] call life_fnc_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if(_trunkSpace == -1) then {"keine"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleInfo select 13,
		if(_className in _list_2x) then {"2x"} else {"1x"},
		[_lagerpreis] call life_fnc_numberText,
		[_verkaufpreis] call life_fnc_numberText,
		[_impoundpreis] call life_fnc_numberText
		];
	};
	case (_className in life_Container):
	{
		(getControl(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>%1€</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%2</t><br/>"
			+"max. kaufbar" +	"<t color='#8cff9b' align='right'>nur Mietbar</t>",
		[_basePrice] call life_fnc_numberText,
		if(_trunkSpace == -1) then {"keine"} else {_trunkSpace}
		];
	};
	default
	{
		(getControl(2300,2303)) ctrlSetStructuredText parseText format[
			(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b' align='right'>%1€</t><br/>"
			+(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b' align='right'>%2€</t><br/>"
			+"Verkaufspreis:"+" <t color='#8cff9b' align='right'>%11€</t><br/>"
			+"Lagerpreis:"+" <t color='#8cff9b' align='right'>%10€</t><br/>"
			+"Auslösegebühr:"+" <t color='#8cff9b' align='right'>%12€</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_HPower")+ " <t color='#8cff9b' align='right'>%4 KW (%8 PS)</t><br/>"
			+(localize "STR_Shop_Veh_UI_DSeats")+ " <t color='#8cff9b' align='right'>1</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%6</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%7 Liter</t><br/>"
			+"max. kaufbar" +	"<t color='#8cff9b' align='right'>%9</t>",
		[_basePrice] call life_fnc_numberText,
		[round(_basePrice * 1.5)] call life_fnc_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if(_trunkSpace == -1) then {"keine"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleInfo select 13,
		if(_className in _list_2x) then {"2x"} else {"1x"},
		[_lagerpreis] call life_fnc_numberText,
		[_verkaufpreis] call life_fnc_numberText,
		[_impoundpreis] call life_fnc_numberText,
		_vehicleInfo select 14
		];
	};
};

true;

ctrlShow [2303,true];
ctrlShow [2330,true];