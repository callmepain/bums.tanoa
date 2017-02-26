#include "..\..\script_macros.hpp"
/*
	File: fn_rechnung.sqf
	Author: Hauklotz
	
	Description:
	Tankstellenrechnung bezahlen
*/
private["_tankestelle","_rechnung","_action"];

_tankestelle = (_this select 3);

_marker = "";
for "_i" from 0 to 50 step 1 do 
{
		_marker = format ["tankstelle_%1",_i];
		if ((player distance (getMarkerPos _marker)) < 40) exitWith 
		{
			_rechnung = player getVariable[format["%1",_marker],0];
		};
};

if(_rechnung == 0) exitWith 
{
	["Du hast keine offene Rechnung","Hinweis","yellow"] call MSG_fnc_handle;	
};

if(CASH < _rechnung) exitWith 
{
	
};
_action =
 [
	format["Deine Tankrechnung beträgt<t color='#FFFF00'> $%1</t>",[_rechnung] call life_fnc_numberText],
	"Tankrechnung bezahlen",
	"Bezahlen",
	"Nein Danke"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	CASH = CASH - _rechnung;
	[(format["Du hast deine Rechnung in Höhe von <t color='#FFFF00'> $%1</t> bezahlt.",[_rechnung] call life_fnc_numberText]),"Tankrechnung","green"] call MSG_fnc_handle;	
	player setVariable[format["%1",_marker],0,true];
	[14] call SOCK_fnc_updatePartial;
}
else
{
	_action2 =
	 [
		format["Willst du wirklich nicht deine Rechnung in Höhe von <t color='#FFFF00'> $%1</t> bezahlen?",[_rechnung] call life_fnc_numberText],
		"Tankrechnung bezahlen",
		"Bezahlen",
		"Nein Danke"
	] call BIS_fnc_guiMessage;
	
	if(_action2) then 
	{
		CASH = CASH - _rechnung;

		[(format["Du hast deine Rechnung in Höhe von <t color='#FFFF00'> $%1</t> bezahlt.",[_rechnung] call life_fnc_numberText]),"Tankrechnung","green"] call MSG_fnc_handle;	
		
		player setVariable[format["%1",_marker],0,true];
		[14] call SOCK_fnc_updatePartial;
	}
	else
	{
		sleep 2.5;		
		[(format["Du hast noch 5 Minuten Zeit um deine Rechnung in Höhe von<br/><t color='#FFFF00'> $%1.</t><br/>zu bezahlen. Danach wirst du wegen Zechprellerei gesucht!",[_rechnung] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;	
	};
};
