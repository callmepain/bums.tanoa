#include "..\..\script_macros.hpp"
/*
    File: fn_demoChargeTimer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the "Demo" timer for the police.
*/
private ["_uiDisp","_time","_timer","_bankindex"];
_pos = param[0, [0,0,0], [objNull, []], [2,3]];

_banks = [];
for "_i" from 1 to 3 do {
	_banks pushback (getmarkerpos format["fed_bank_nr_%1",_i]);
};
{
	if(((getpos player) distance _x) < 10) exitwith {_bankindex	= _forEachIndex+1;}; 
} foreach _banks;
if (isNil "_bankindex") exitwith {};
disableSerialization;
"lifeTimer" cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (1 * 60);
_vault = "";
private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_CommonwealthBank"]]] call TON_fnc_terrainSort;
_vault = (nearestObject [_pos,_vaultHouse]);
for "_i" from 0 to 1 step 0 do {
    if (isNull _uiDisp) then {
        "lifeTimer" cutRsc ["life_timer","PLAIN"];
        _uiDisp = uiNamespace getVariable "life_timer";
        _timer = _uiDisp displayCtrl 38301;
    };
    if (round(_time - time) < 1) exitWith {};
	if (_bankindex isEqualTo 1) then {
		if (!(fed_bank_1 getVariable ["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
	if (_bankindex isEqualTo 2) then {
		if (!(fed_bank_2 getVariable ["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
	if (_bankindex isEqualTo 3) then {
		if (!(fed_bank_3 getVariable ["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
};
"lifeTimer" cutText["","PLAIN"];