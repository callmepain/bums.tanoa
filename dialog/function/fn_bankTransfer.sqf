#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_unit = call compile format["%1",(lbData[2754,(lbCurSel 2754)])];

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



if(isNull _unit) exitWith {};
if((lbCurSel 2754) == -1) exitWith {[(format [localize "STR_ATM_NoneSelected"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(isNil "_unit") exitWith {[(format [localize "STR_ATM_DoesntExist"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

if(_value < 0) exitwith {};

if(_value > BANK) exitWith {[(format [localize "STR_ATM_NotEnough"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_tax = _value * LIFE_SETTINGS(getNumber,"bank_transferTax");
if((_value + _tax) > BANK) exitWith {[(format [localize "STR_ATM_SentMoneyFail",_value,_tax]),"Hinweis","Yellow"] call MSG_fnc_handle;};

BANK = BANK - (_value + _tax);

[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[(format [localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call life_fnc_numberText]),"Überweisung","green"] call MSG_fnc_handle;

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
        money_log = format [localize "STR_DL_ML_transferredBank_BEF",_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_transferredBank",profileName,(getPlayerUID player),_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
