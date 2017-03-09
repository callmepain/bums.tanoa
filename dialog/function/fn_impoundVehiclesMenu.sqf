#include "..\..\script_macros.hpp"
/*
	File: fn_impoundVehiclesMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: OLLI aka Hauklotz
	
	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private ["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];
ctrlShow[3803,false];
ctrlShow[3830,false];
waitUntil {!isNull (findDisplay 3800)};

if (count _vehicles isEqualTo 0) exitWith 
{
    ctrlSetText[3811,localize "STR_Garage_NoVehicles"];
};

_control = CONTROL(3800,3802);
lbClear _control;

_display = findDisplay 3800;
_Titel = _display displayCtrl 1100;

_Titel ctrlSetStructuredText parseText format["<t align='center'>Verwahrstelle</t>"];

{
    _vehicleInfo = [(_x select 2)] call life_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    //_tmp = [(_x select 2),(_x select 8),(_x select 9),(_x select 10)];
    _tmp = [(_x select 2),(_x select 8),(_x select 9)];
    _tmp = str(_tmp);
    _control lbSetData [(lbSize _control)-1,_tmp];
    _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
    _control lbSetValue [(lbSize _control)-1,(_x select 0)];
} forEach _vehicles;

ctrlShow[3810,false];
ctrlShow[3811,false];
