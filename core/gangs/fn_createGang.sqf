#include "..\..\script_macros.hpp"
/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Pulls up the menu and creates the gang with the name the user enters in.
*/
private ["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_dialog = findDisplay 2520;

_gangName = ctrlText (CONTROL(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ - ");
if (_length > 32) exitWith {[(format [localize "STR_GNOTF_Over32"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {[(format [localize "STR_GNOTF_IncorrectChar"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price")) - BANK)] call life_fnc_numberText];};

if (life_HC_isActive) then {
    [player,getPlayerUID player,_gangName] remoteExec ["HC_fnc_insertGang",HC_Life];
} else {
    [player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",RSERV];
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_createdGang_BEF",_gangName,(LIFE_SETTINGS(getNumber,"gang_price"))];
    } else {
        advanced_log = format [localize "STR_DL_AL_createdGang",profileName,(getPlayerUID player),_gangName,(LIFE_SETTINGS(getNumber,"gang_price"))];
    };
    publicVariableServer "advanced_log";
};

[(format [localize "STR_NOTF_SendingData"]),"Hinweis","Green"] call MSG_fnc_handle;
closeDialog 0;
life_action_gangInUse = true;

