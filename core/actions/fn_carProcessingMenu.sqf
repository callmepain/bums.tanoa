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

_display = findDisplay 39400;
_Titel = _display displayCtrl 1100;
_Herstellen = _display displayCtrl 1101;

_Titel ctrlSetStructuredText parseText "<t align='center'>Fahrzeugherstellung</t>";
_Herstellen ctrlSetStructuredText parseText "Herstellung starten";


_processor = (_this select 0);
_type = (_this select 3);
_nearVehicles = nearestObjects [_processor,[],25];

//Error check
if(count _nearVehicles == 0) exitWith {[(format [localize "STR_Shop_NoVehNear"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(!(createDialog "car_processing")) exitWith {[(format [localize "STR_Shop_ChopShopError"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (life_is_processing) exitWith {[(format [localize "Der Kollege ist beschäftigt. Bitte nicht stressen!"]),"Hinweis","Yellow"] call MSG_fnc_handle;closeDialog 0;};    

/////// select 0 type select 1 prof
life_car_processing = [_processor,_type select 0,_type select 1];
life_car = [];
_control = ((findDisplay 39400) displayCtrl 39402);





{
	if((alive _x) && (_x in life_vehicles)) then 
	{
		life_car pushBack _x;
	};
} foreach _nearVehicles;


{
	if(alive _x) then 
	{
		_className = typeOf _x;
		_object = format["%1",_x];
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		
		if(_className in life_container) then
		{
			_picture = format["icons\container\%1.paa",_className];
		};
		
		if(_x getVariable ["car_processing",false]) then
		{
			_control lbAdd format["%1 - [Entfernung: %2m] - [Bei der Verarbeitung]",_displayName,round(_processor distance _x)];
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
		}
		else
		{
			_control lbAdd format["%1 - [Entfernung: %2m]",_displayName,round(_processor distance _x)];
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
		};
	};
} foreach life_car;