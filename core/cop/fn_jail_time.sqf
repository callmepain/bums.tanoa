/*

	Player clicked arrest/ok

*/

private ["_time","_kaution"];

// if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {[(format ["Ungültiges Ziel."]),"Hinweis","Yellow"] call MSG_fnc_handle;	};

//Get minutes
_time = ctrlText 1400;
_kaution = ctrlText 1401;

if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	[(format ["Du musst eine Zahl eingeben."]),"Hinweis","Yellow"] call MSG_fnc_handle;	
};

_time = parseNumber _time; //requested number
_time = round _time;

_kaution = parseNumber _kaution; //requested number
_kaution = round _kaution;

if(_kaution == 0) then {[(format ["Kaution ist nicht bezahlbar!"]),"Hinweis","Yellow"] call MSG_fnc_handle;	};
if(_time < 5 || _time > 120) exitWith {[(format ["Du kannst Personen nur zwischen 5 - 120 Minuten ins Gefängnis stecken!"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(_kaution > 120) exitWith {[(format ["Du kannst die Kautionszeit nur zw. 0 - 120 Minuten festlegen!"]),"Hinweis","Yellow"] call MSG_fnc_handle;	};

closeDialog 0; 
[life_pInact_curTarget, _time,_kaution] call life_fnc_arrestAction;