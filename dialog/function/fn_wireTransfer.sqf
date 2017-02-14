#include "..\..\script_macros.hpp"
/*
    File: fn_wireTransfer.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Initiates the wire-transfer
*/
params [
    ["_value",0,[0]],
    ["_from","",[""]]
];

if (_value isEqualTo 0 || _from isEqualTo "" || _from isEqualTo profileName) exitWith {}; //No
BANK = BANK + _value;
[1] call SOCK_fnc_updatePartial;
[(format [localize "STR_ATM_WireTransfer",_from,[_value] call life_fnc_numberText]),"Überweisung","green"] call MSG_fnc_handle;


