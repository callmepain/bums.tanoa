#include "..\..\script_macros.hpp"
/*
	File: fn_KautionInit.sqf
	Author:H4uklotz
	
	Description:
	Menü für die Kaution
*/
disableSerialization;
private["_nearVehicles","_control"];

if(!dialog) then
{
	if(!(createDialog "kaution")) exitWith {};
};

_display = findDisplay 55550;
_Titel = _display displayCtrl 1100;
_control = _display displayCtrl 55553;
_kaution = _display displayCtrl 55554;

_Titel ctrlSetStructuredText parseText "<t align='center'>inhaftierte Personen</t>";
_kaution ctrlSetStructuredText parseText "Kaution bezahlen";

_kaution ctrlEnable false;	

_exit = false;
{
	if(alive _x) then 
	{		
		if(_x getVariable ["arrested",false]) then
		{
			_kaution = _x getVariable ["kaution",0];
			
			_control lbAdd format["%1",_x getVariable["realname", name _x]];	
			_control lbSetData [(lbSize _control)-1,str(_x)];
			_control lbSetValue [(lbSize _control)-1,_kaution];
		};
	};
} foreach playableUnits;