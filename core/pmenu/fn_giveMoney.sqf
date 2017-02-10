#include "..\..\script_macros.hpp"
/*
    File: fn_giveMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives the selected amount of money to the selected player.
*/
private ["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if ((lbCurSel 2022) isEqualTo -1) exitWith {[(format [localize "STR_NOTF_noOneSelected"]),"Hinweis","Yellow"] call MSG_fnc_handle;ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format ["%1",_unit];
if (isNil "_unit") exitWith {ctrlShow[2001,true];};
if (_unit == player) exitWith {ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if (!life_use_atm) exitWith {[(format [localize "STR_NOTF_recentlyRobbedBank"]),"Hinweis","Yellow"] call MSG_fnc_handle;ctrlShow[2001,true];};
if (!([_amount] call TON_fnc_isnumber)) exitWith {[(format [localize "STR_NOTF_notNumberFormat"]),"Hinweis","Yellow"] call MSG_fnc_handle;ctrlShow[2001,true];};
if (parseNumber(_amount) <= 0) exitWith {[(format [localize "STR_NOTF_notEnoughtToGive"]),"Hinweis","Yellow"] call MSG_fnc_handle;ctrlShow[2001,true];};
if (parseNumber(_amount) > CASH) exitWith {[(format [localize "STR_NOTF_notEnoughtToGive"]),"Hinweis","Yellow"] call MSG_fnc_handle;ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; [(format [localize "STR_NOTF_notWithinRange"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

[(format [localize "STR_NOTF_youGaveMoney",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable ["realname",name _unit]]),"Hinweis","Yellow"] call MSG_fnc_handle;
CASH = CASH - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;
ctrlShow[2001,true];

