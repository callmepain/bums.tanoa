#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_unit = call compile format["%1",(lbData[2754,(lbCurSel 2754)])];

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



if(isNull _unit) exitWith {};
if((lbCurSel 2754) == -1) exitWith {[(format [localize "STR_ATM_NoneSelected"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(isNil "_unit") exitWith {[(format [localize "STR_ATM_DoesntExist"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

if(_value < 0) exitwith {};

if(_value > BANK) exitWith {[(format [localize "STR_ATM_NotEnough"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_tax = [_value] call life_fnc_taxRate;
if((_value + _tax) > BANK) exitWith {[(format [localize "STR_ATM_SentMoneyFail",_value,_tax]),"Hinweis","Yellow"] call MSG_fnc_handle;};

BANK = BANK - (_value + _tax);

[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
disableSerialization;
_display = findDisplay 2750;
_text = _display displayCtrl 2751;

_gFund = grpPlayer getVariable ["gang_bank",0];
_text ctrlSetStructuredText parseText format
[
	"<t align='center'>
	<img size='1.7' image='icons\ico_bank.paa'/> %1€ [Bank]<br/>
	<img size='1.6' image='icons\ico_money.paa'/> %2€ [Tasche]<br/>
	<img size='1.7' image='icons\ico_bank.paa'/> %3€ [Gang]
	",
	[BANK] call life_fnc_numberText,
	[CASH] call life_fnc_numberText,
	[_gFund] call life_fnc_numberText
];
hint format[localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
// [6] call SOCK_fnc_updatePartial;
// [8] call SOCK_fnc_updatePartial;


_text = format ["<<<<bankTransfer>>>>|%1||%2|>>hat %3 an |%4||%5| überwiesen",getPlayerUID player,name player,[_value] call life_fnc_numberText,getPlayerUID _unit,name _unit];
// [[0,_text],"TON_fnc_log",false,false] spawn life_fnc_MP;
[_text] remoteExec ["TON_fnc_log",0];