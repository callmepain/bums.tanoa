#include "..\..\script_macros.hpp"
/*
    File: fn_storeContainer.sqf
    Author: CallmePain

    Description:
    Stores the Container in the garage.
*/
private ["_nearVehicles","_vehicle"];
if !(isNull objectParent player) then {
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
};