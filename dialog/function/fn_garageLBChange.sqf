#include "..\..\script_macros.hpp"
/*
    File: fn_garageLBChange.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_insurance","_insuranceMultiplier","_price","_storageFee","_purchasePrice","_insurancePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format ["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;
_insurance = (_dataArr select 3);


if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_dataArr select 1)) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_fuel = ((_dataArr select 2) * (_vehicleInfo select 12));

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier");
_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier");
_insuranceMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier");
 
_retrievePrice = round(_purchasePrice * _storageFee);
_sellPrice = round(_purchasePrice * _sellMultiplier);
_insurancePrice = round(_purchasePrice * _insuranceMultiplier);

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};
if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 500;};
if (!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500;};

switch (true) do 
{

	case (_className isKindOf "Air"):
	{
		(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
			("Stellplatzgebühr:")+ " <t color='#8cff9b' align='right'>$%1</t><br/>"
			+(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b' align='right'>$%2</t><br/>"
			+( "Versicherungsgebühr:")+ " <t color='#8cff9b' align='right'>$%9</t><br/>"
			+( "Versicherungsstatus:")+ "<t align='right'>%10</t><br/>"			
			+(localize "STR_Shop_Veh_UI_Color")+ " <t color='#8cff9b' align='right'>%8</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%4</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%6 Liter</t><br/>"
			+("akt. Tankvolumen")+ " <t color='#8cff9b' align='right'>%8 Liter</t>",
		[_retrievePrice] call life_fnc_numberText,
		[_sellPrice] call life_fnc_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 10,
		if(_trunkSpace == -1) then {"keinen"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleColor,
		_fuel,
		[_insurancePrice] call life_fnc_numberText,
		if(_insurance == 1) then {"<t color='#8cff9b'>versichert</t>"} else {"<t color='#FF0000'>nicht versichert</t>"}
		];
	};
	default
	{
		(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
			("Stellplatzgebühr:")+ " <t color='#8cff9b' align='right'>$%1</t><br/>"
			+(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b' align='right'>$%2</t><br/>"
			+( "Versicherungsgebühr:")+ " <t color='#8cff9b' align='right'>$%11</t><br/>"
			+( "Versicherungsstatus:")+ "<t align='right'>%12</t><br/>"			
			+(localize "STR_Shop_Veh_UI_Color")+ " <t color='#8cff9b' align='right'>%8</t><br/>"
			+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b' align='right'>%3 km/h</t><br/>"
			+(localize "STR_Shop_Veh_UI_HPower")+ " <t color='#8cff9b' align='right'>%4 KW (%9 PS)</t><br/>"
			+(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b' align='right'>%5</t><br/>"
			+(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b' align='right'>%6</t><br/>"
			+(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b' align='right'>%7 Liter</t><br/>"
			+("akt. Tankvolumen")+ " <t color='#8cff9b' align='right'>%10 Liter</t>",
		[_retrievePrice] call life_fnc_numberText,
		[_sellPrice] call life_fnc_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if(_trunkSpace == -1) then {"keinen"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleColor,
		_vehicleInfo select 13,
		_fuel,
		[_insurancePrice] call life_fnc_numberText,
		if(_insurance == 1) then {"<t color='#8cff9b'>versichert</t>"} else {"<t color='#FF0000'>nicht versichert</t>"}
		];
	};
};

if(_insurance == 1) then 
{
	ctrlEnable [2806,False];
}
else
{
	ctrlEnable [2806,True];
};
ctrlShow [2803,true];
ctrlShow [2830,true];
ctrlShow [2803,true];
ctrlShow [2804,true];
ctrlShow [2805,true];
ctrlShow [2806,true];

