#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
private ["_nearVehicles","_vehicle"];
_check = [];
{
	_check pushback _x;
} forEach(life_Container);
_check pushback "Car";
_check pushback "Air";
_check pushback "Ship";
_delete =
 [
	format["Bei Fahrzeugen, die mit Containern beladen sind, werden die Container gelöscht! 		Willst du wirklich dein Fahrzeug in die Garage stellen und den Container löschen?"],
	"Fahrzeug in die Garage stellen",
	"Ok",
	"Nein Danke"
] call BIS_fnc_guiMessage;
if(_delete) then {
	if !(isNull objectParent player) then {
		_vehicle = vehicle player;
	} else {
		_nearVehicles = nearestObjects[getPos (_this select 0),_check,30]; //Fetch vehicles within 30m.
		if (count _nearVehicles > 0) then {
			{
				if (!isNil "_vehicle") exitWith {}; //Kill the loop.
				_vehData = _x getVariable ["vehicle_info_owners",[]];
				if (count _vehData  > 0) then {
					_vehOwner = ((_vehData select 0) select 0);
					if ((getPlayerUID player) == _vehOwner && (typeOf _x in life_Container))  then
					{
						deleteVehicle _x;
					}
					else
					{
						_vehicle = _x;
					};
				};
			} forEach _nearVehicles;
		};
	};
};
if (isNil "_vehicle") exitWith {[(format [localize "STR_Garage_NoNPC"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {[(format [localize "STR_Garage_SQLError_Destroyed",_vehicle]),"Hinweis","Yellow"] call MSG_fnc_handle;};

_storetext = localize "STR_Garage_Store_Success";


if (life_HC_isActive) then {
	[_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
	[_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",RSERV];
};


life_garage_store = true;


