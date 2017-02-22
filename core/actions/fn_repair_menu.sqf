#include "..\..\script_macros.hpp"
/*
	File: fn_carProcessingMenu.sqf
	Author:H4uklotz
	
	Description:
	Menü für Carprocessing
*/

if(life_action_inUse) exitWith {[(format [localize "STR_NOTF_ActionInProc"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [(_this select 0),[],30];
//Error check
if(count _nearVehicles == 0) exitWith {[(format [localize "STR_Shop_NoVehNear"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(!(createDialog "car_processing")) exitWith {[(format [localize "STR_Shop_ChopShopError"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_display = findDisplay 39400;
_Titel = _display displayCtrl 1100;
_Titel ctrlSetStructuredText parseText "<t align='center'>Auto Reperatur</t>";
_Btn = _display displayCtrl 1101;
_Btn ctrlSetStructuredText parseText "Auto Reparieren";
_Btn buttonSetAction "[] spawn life_fnc_car_repair;";

life_car = [];
_control = ((findDisplay 39400) displayCtrl 39402);

{
	if(_x in life_vehicles) then 
	{
		life_car pushBack _x;
	};
} foreach _nearVehicles;

{
_className = typeOf _x;
_object = format["%1",_x];
_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
//_picture = format["icons\container\%1.paa",_className];
_control lbAdd format["%1 - [Entfernung: %2m]",_displayName,round((_this select 0) distance _x)];
_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
_control lbSetPicture [(lbSize _control)-1,_picture];

} foreach life_car;