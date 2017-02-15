#include "..\..\script_macros.hpp"
/*
	File: fn_Kaution.sqf
	Author:H4uklotz
	
	Description:
	Bezahlt die Kaution für den ausgewählten spieler.
*/


if((lbCurSel 55553) == -1) exitWith {[(format [localize "STR_Shop_Veh_DidntPick"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_control = ((findDisplay 55550) displayCtrl 55553);
_unit = _control lbData (lbCurSel _control);
_unit = call compile format["%1", _unit];
_kaution = lbValue[55553,(lbCurSel 55553)];


if(_unit getVariable ["kautionZeit",0] isEqualTo 0) exitWith 
{
	["Kaution kann nicht bezahlt werden.","Hinweis","Green"] call MSG_fnc_handle;
};

if(_kaution > CASH) exitWith 
{
	["Du hast nicht genug geld.","Hinweis","yellow"] call MSG_fnc_handle;
};


CASH = CASH - _kaution;

[(format["du hast %1 für $%2 ausn knast geholt",_unit,_kaution]),"Hinweis","yellow"] call MSG_fnc_handle;

_unit setVariable ["arrested",false,true];

[14] call SOCK_fnc_updatePartial;