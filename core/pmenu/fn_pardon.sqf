#include "..\..\script_macros.hpp"
/*
    File: fn_pardon.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Pardons the selected player.
*/
private ["_display","_list"];
disableSerialization;
if !(playerSide isEqualTo west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
if (!(_data isEqualType [])) exitWith {};
if (_data isEqualTo []) exitWith {};


diag_log ["_data: %1",_data];

diag_log ["_data: %1",(_data select 1)];

 [(_data select 1)] remoteExecCall ["life_fnc_wantedPardon",RSERV];