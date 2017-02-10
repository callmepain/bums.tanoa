/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist","_kopfgeld"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_mylist = [];
_kopfgeld = _display displayCtrl 2403;
_data = call compile format["%1", _data];



if(isNil "_data") exitWith {_list lbAdd "keine Verbrechen vorhanden";};
if(typeName _data != "ARRAY") exitWith {_list lbAdd "keine Verbrechen vorhanden";};
if(count _data == 0) exitWith {_list lbAdd "keine Verbrechen vorhanden";};
lbClear _list;

_uid = _data select 1;
_crimes = _data select 2;
_bounty = _data select 3;

{
	_crime = _x;
	if(!(_crime in _mylist)) then
	{
		_mylist set[count _mylist,_crime];
		_list lbAdd format["%1x %2",{_x == _crime} count _crimes,_crime];
		
	};
} foreach _crimes;


_kopfgeld ctrlSetStructuredText parseText format["<t align='right'>Kopfgeld: $%1<t>",[_bounty] call life_fnc_numberText];