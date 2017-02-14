#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Withdraws money from the players account
*/
private["_modus","_value"];

_modus = (_this select 0);

_value = 0;

switch (_modus) do
{
	case (-1):
	{
		_value = parseNumber(ctrlText 2753);
	};
	
	case (1):
	{
		_value = CASH;
	};
	
	default
	{
		_value = _modus;
	};
};

if(_value < 0) exitwith {};
if(_value > BANK) exitWith {[(format [localize "STR_ATM_NotEnoughFunds"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {[(format [localize "STR_ATM_notnumeric"]),"Fehler","red"] call MSG_fnc_handle;};
if(_value < 1 && BANK > 200000000) exitWith {[(format [localize "STR_ATM_NotEnoughFunds"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; 

CASH = CASH + _value;
BANK = BANK - _value;

[(format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText]),"Abhebung","green"] call MSG_fnc_handle;

disableSerialization;
_display = findDisplay 2750;
_text = _display displayCtrl 2751;

_text ctrlSetStructuredText parseText format
[
	"<t align='center'><img size='1.7' image='icons\ico_bank.paa'/> $%1 [Bank]<br/><img size='1.6' image='icons\ico_money.paa'/> $%2 [Tasche]<br/><img size='1.7' image='icons\ico_bank.paa'/> $%3 [Gang]",
	[BANK] call life_fnc_numberText,
	[CASH] call life_fnc_numberText,
	[GANG_FUNDS] call life_fnc_numberText
];

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};