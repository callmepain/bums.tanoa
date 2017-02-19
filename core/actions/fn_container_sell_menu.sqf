#include "..\..\script_macros.hpp"
/*
	File: fn_carProcessingMenu.sqf
	Author:H4uklotz
	
	Description:
	Men� f�r Carprocessing
*/

if(life_action_inUse) exitWith {[(format [localize "STR_NOTF_ActionInProc"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
disableSerialization;
private["_nearVehicles","_control"];

_display = findDisplay 49400;
_Titel = _display displayCtrl 1100;
_Herstellen = _display displayCtrl 1101;

_Titel ctrlSetStructuredText parseText "<t align='center'>Container r�ckgabe</t>";
_Herstellen ctrlSetStructuredText parseText "Container zur�ckgeben";


_processor = (_this select 0);
_nearVehicles = nearestObjects [_processor,life_Container,30];

//Error check
if(count _nearVehicles == 0) exitWith {[(format [localize "STR_Shop_NoVehNear"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(!(createDialog "container_sell")) exitWith {[(format [localize "STR_Shop_ChopShopError"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

/////// select 0 type select 1 prof
//life_car_processing = [_processor,_type select 0,_type select 1];
life_car = [];
_control = ((findDisplay 49400) displayCtrl 49402);

{
	life_car pushBack _x;
} foreach _nearVehicles;

{
_className = typeOf _x;
_object = format["%1",_x];
_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
//_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
_picture = format["icons\container\%1.paa",_className];
_control lbAdd format["%1 - [Entfernung: %2m]",_displayName,round(_processor distance _x)];
_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
_control lbSetPicture [(lbSize _control)-1,_picture];

} foreach life_car;