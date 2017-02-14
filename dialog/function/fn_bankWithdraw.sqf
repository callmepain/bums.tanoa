#include "..\..\script_macros.hpp"
/*
	COPY PASTE TIME
*/
private["_modus","_value"];

_modus = (_this select 0);

_value = 0;

switch (_modus) do
{
	case (100):
	{
		_value = 100;
	};
	
	case (500):
	{
		_value = 500;
	};
	
	case (1000):
	{
		_value = 1000;
	};
	
	case (5000):
	{
		_value = 5000;
	};
	
	case (10000):
	{
		_value = 10000;
	};
	
	case (50000):
	{
		_value = 50000;
	};
	
	case (100000):
	{
		_value = 100000;
	};
	
	case (-1):
	{
		_value = parseNumber(ctrlText 2753);
	};
};

if(_value < 0) exitwith {};


[(format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText]),"Hinweis","Yellow"] call MSG_fnc_handle;

if(_value > BANK) exitWith {[(format [localize "STR_ATM_NotEnoughFunds"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(_value < 100 && BANK > 20000000) exitWith {[(format [localize "STR_ATM_NotEnoughFunds"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;

[(format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText]),"Hinweis","Yellow"] call MSG_fnc_handle;
disableSerialization;
_display = findDisplay 2750;
_text = _display displayCtrl 2751;

_gFund = grpPlayer getVariable ["gang_bank",0];
_text ctrlSetStructuredText parseText format
[
	"<t align='center'>
	<img size='1.7' image='icons\ico_bank.paa'/> %1€ [Bank]
	<br/>
	<img size='1.6' image='icons\ico_money.paa'/> %2€ [Tasche]
	<br/>
	<img size='1.7' image='icons\ico_bank.paa'/> %3€ [Gang]
	",
	[BANK] call life_fnc_numberText,
	[CASH] call life_fnc_numberText,
	[_gFund] call life_fnc_numberText
];


// [6] call SOCK_fnc_updatePartial;
// [8] call SOCK_fnc_updatePartial;

_text = format ["<<<<bankWithdraw>>>>|%1||%2|>>hat %3 von seinem Konto abgehoben",getPlayerUID player,name player,[_value] call life_fnc_numberText];
// [[0,_text],"TON_fnc_log",false,false] spawn life_fnc_MP;
[_text] remoteExec ["TON_fnc_log",0];