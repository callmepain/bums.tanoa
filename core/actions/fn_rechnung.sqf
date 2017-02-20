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

if(_rechnung == 0) exitWith {Hint "Du hast keine offene Rechnung"};

if(CASH < _rechnung) exitWith {hint "Du hast nicht genug Geld dabei."; sleep 1;};
_action =
 [
	format["Deine Tankrechnung beträgt $%1",[_rechnung] call life_fnc_numberText],
	"Tankrechnung bezahlen",
	"Bezahlen",
	"Nein Danke"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	CASH = CASH - _rechnung;
	hint format["Du hast deine Rechnung in Höhe von $%1 bezahlt.",[_rechnung] call life_fnc_numberText];
	player setVariable[format["%1",_marker],0,true];
	[14] call SOCK_fnc_updatePartial;
}
else
{
	_action2 =
	 [
		format["Willst du wirklich nicht deine Rechnung in höhe von $%1 bezahlen?",[_rechnung] call life_fnc_numberText],
		"Tankrechnung bezahlen",
		"Bezahlen",
		"Nein Danke"
	] call BIS_fnc_guiMessage;
	
	if(_action2) then 
	{
		CASH = CASH - _rechnung;
		hint format["Du hast deine Rechnung in Höhe von $%1 bezahlt.",[_rechnung] call life_fnc_numberText];
		player setVariable[format["%1",_marker],0,true];
		[14] call SOCK_fnc_updatePartial;
	}
	else
	{
		sleep 2.5;
		hint "Du hast noch 5 Minuten Zeit, deine Rechnung zu begleichen, sonst wirst du wegen Zechprellerei angezeigt!";
	};
};
