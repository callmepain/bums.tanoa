/*
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	Edit by H4uklotz
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
// _info = [_this,0,[],[[]]] call BIS_fnc_param;
_info = [_this,0,[]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;



_units = [];
{
	_units set[count _units, name _x];
} foreach playableUnits;

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

ctrlSetText[2404,"Verbindung hergestellt"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Keine Kriminelle vorhanden";
};