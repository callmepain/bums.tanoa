#include "..\..\script_macros.hpp"
/*
    File: fn_storeContainer.sqf
    Author: CallmePain

    Description:
    Stores the Container in the garage.
*/
disableSerialization;
if (isDedicated) exitWith {};
if((lbCurSel 39402) == -1) exitWith {[(format [localize "STR_Shop_Veh_DidntPick"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_control = ((findDisplay 39400) displayCtrl 39402);
_index =  lbValue[39402,(lbCurSel 39402)];
_vehicle = (life_car select _index);
if(isNull _vehicle) exitWith {};
closeDialog 0;

_vehData = _vehicle getVariable ["vehicle_info_owners",[]];
_vehOwner = ((_vehData select 0) select 0);
if ((getPlayerUID player) == _vehOwner)  then
{
	_type = typeOf _vehicle;
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_type,"price");
	_rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier");
	_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier");
	_price = (_price * _rentMultiplier) * _sellMultiplier;
	CASH = CASH + _price;
	deleteVehicle _vehicle;
	[(format ["Du hast für deinen Container: <t color='#FFFF00'>$%1</t> bekommen",[_price] call life_fnc_numberText]),"Hinweis","Green"] call MSG_fnc_handle;
}
/*if !(isNull objectParent player) then {
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos (_this select 0),life_Container,30]; //Fetch vehicles within 30m.
	if (count _nearVehicles > 0) then {
		{
			if (!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable ["vehicle_info_owners",[]];
			if (count _vehData  > 0) then {
				_vehOwner = ((_vehData select 0) select 0);
				if ((getPlayerUID player) == _vehOwner)  then
				{
					_type = typeOf _x;
					_price = M_CONFIG(getNumber,"LifeCfgVehicles",_type,"price");
					_price = _price / 2;
					CASH = CASH + _price;
					deleteVehicle _x;
					[(format ["Du hast für deinen Container: %1 $ bekommen",_price]),"Hinweis","Green"] call MSG_fnc_handle;
				}
			};
		} forEach _nearVehicles;
	};
};*/