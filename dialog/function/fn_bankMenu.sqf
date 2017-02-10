#include "..\..\script_macros.hpp"
/*
	File: fn_bankMenu.sqf
	Author: OLLI aka Hauklotz
	
	Description:
	Definiert das neue ATM-Menu
*/
#define Btn1 2760
#define Btn2 2761
#define Btn3 2762
#define Btn4 2763
#define Btn5 2764
#define Btn6 2765
#define Btn7 2766
#define Btn8 2767
#define Btn9 2768
#define BtnExit 1010
#define Title 2752

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_type"];

if(!(createDialog "Life_atm_management")) exitWith {};

disableSerialization;
_modus = (_this select 0);


_display = findDisplay 2750;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_BtnExit = _display displayCtrl BtnExit;
_Titel = _display displayCtrl Title;
_text = _display displayCtrl 2751;
_units = _display displayCtrl 2754;

lbClear _units;

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

{
	if(alive _x && _x != player) then //
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Medic"};
			case east: {_type = "TAC"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

switch (_modus) do
{
	case ("gang"):
	{
		_Titel ctrlSetStructuredText parseText "<t align='center'>Geld in die Gangbank einzahlen</t>";

		// Deposit100
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>100€</t>";
		_Btn1 buttonSetAction "[100] call life_fnc_gangDeposit;";

		// Deposit500
		_Btn2 ctrlSetStructuredText parseText "<t align='center'>500€</t>";
		_Btn2 buttonSetAction "[500] call life_fnc_gangDeposit;";

		// Deposit1000
		_Btn3 ctrlSetStructuredText parseText "<t align='center'>1000€</t>";
		_Btn3 buttonSetAction "[1000] call life_fnc_gangDeposit;";
		
		// Deposit5000
		_Btn4 ctrlSetStructuredText parseText "<t align='center'>5000€</t>";
		_Btn4 buttonSetAction "[5000] call life_fnc_gangDeposit;";

		// Deposit10000
		_Btn5 ctrlSetStructuredText parseText "<t align='center'>10000€</t>";
		_Btn5 buttonSetAction "[10000] call life_fnc_gangDeposit;";

		// Deposit5000
		_Btn6 ctrlSetStructuredText parseText "<t align='center'>50000€</t>";
		_Btn6 buttonSetAction "[50000] call life_fnc_gangDeposit;";

		// Deposit10000
		_Btn7 ctrlSetStructuredText parseText "<t align='center'>100000€</t>";
		_Btn7 buttonSetAction "[100000] call life_fnc_gangDeposit;";

		// wunsch
		_Btn8 ctrlSetStructuredText parseText "<t align='center'>Wunschbetrag</t>";
		_Btn8 buttonSetAction "[-1] call life_fnc_gangDeposit;";
		
		_Btn9 ctrlSetStructuredText parseText "<t align='center'>alles Einzahlen</t>";
		_Btn9 buttonSetAction "[1] call life_fnc_gangDeposit;";
		
		_units ctrlShow false;
	};
	
	case ("einzahlen"):
	
	{
		_Titel ctrlSetStructuredText parseText "<t align='center'>Geld auf´s Konto einzahlen</t>";

		// Deposit100
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>100€</t>";
		_Btn1 buttonSetAction "[100] call life_fnc_bankDeposit;";

		// Deposit500
		_Btn2 ctrlSetStructuredText parseText "<t align='center'>500€</t>";
		_Btn2 buttonSetAction "[500] call life_fnc_bankDeposit;";

		// Deposit1000
		_Btn3 ctrlSetStructuredText parseText "<t align='center'>1000€</t>";
		_Btn3 buttonSetAction "[1000] call life_fnc_bankDeposit;";

		// Deposit5000
		_Btn4 ctrlSetStructuredText parseText "<t align='center'>5000€</t>";
		_Btn4 buttonSetAction "[5000] call life_fnc_bankDeposit;";

		// Deposit10000
		_Btn5 ctrlSetStructuredText parseText "<t align='center'>10000€</t>";
		_Btn5 buttonSetAction "[10000] call life_fnc_bankDeposit;";

		// Deposit5000
		_Btn6 ctrlSetStructuredText parseText "<t align='center'>50000€</t>";
		_Btn6 buttonSetAction "[50000] call life_fnc_bankDeposit;";

		// Deposit10000
		_Btn7 ctrlSetStructuredText parseText "<t align='center'>100000€</t>";
		_Btn7 buttonSetAction "[100000] call life_fnc_bankDeposit;";

		// wunsch
		_Btn8 ctrlSetStructuredText parseText "<t align='center'>Wunschbetrag</t>";
		_Btn8 buttonSetAction "[-1] call life_fnc_bankDeposit;";
		
		_Btn9 ctrlSetStructuredText parseText "<t align='center'>alles Einzahlen</t>";
		_Btn9 buttonSetAction "[1] call life_fnc_bankDeposit;";
		
		_units ctrlShow false;
	};

	case ("abheben"):
	{
		_Titel ctrlSetStructuredText parseText "<t align='center'>Geld vom Konto abheben</t>";

		// Deposit100
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>100€</t>";
		_Btn1 buttonSetAction "[100] call life_fnc_bankWithdraw;";

		// Deposit500
		_Btn2 ctrlSetStructuredText parseText "<t align='center'>500€</t>";
		_Btn2 buttonSetAction "[500] call life_fnc_bankWithdraw;";

		// Deposit1000
		_Btn3 ctrlSetStructuredText parseText "<t align='center'>1000€</t>";
		_Btn3 buttonSetAction "[1000] call life_fnc_bankWithdraw;";

		// Deposit5000
		_Btn4 ctrlSetStructuredText parseText "<t align='center'>5000€</t>";
		_Btn4 buttonSetAction "[5000] call life_fnc_bankWithdraw;";

		// Deposit10000
		_Btn5 ctrlSetStructuredText parseText "<t align='center'>10000€</t>";
		_Btn5 buttonSetAction "[10000] call life_fnc_bankWithdraw;";

		// Deposit5000
		_Btn6 ctrlSetStructuredText parseText "<t align='center'>50000€</t>";
		_Btn6 buttonSetAction "[50000] call life_fnc_bankWithdraw;";

		// Deposit10000
		_Btn7 ctrlSetStructuredText parseText "<t align='center'>100000€</t>";
		_Btn7 buttonSetAction "[100000] call life_fnc_bankWithdraw;";

		// wunsch
		_Btn8 ctrlSetStructuredText parseText "<t align='center'>Wunschbetrag</t>";
		_Btn8 buttonSetAction "[-1] call life_fnc_bankWithdraw;";
		
		_Btn9 ctrlShow false;
		_units ctrlShow false;
	};
	
	case ("transfer"):
	{
		_Titel ctrlSetStructuredText parseText "<t align='center'>Geld an Spieler überweisen</t>";

		// Deposit100
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>100€</t>";
		_Btn1 buttonSetAction "[100] call life_fnc_bankTransfer;";

		// Deposit500
		_Btn2 ctrlSetStructuredText parseText "<t align='center'>500€</t>";
		_Btn2 buttonSetAction "[500] call life_fnc_bankTransfer;";

		// Deposit1000
		_Btn3 ctrlSetStructuredText parseText "<t align='center'>1000€</t>";
		_Btn3 buttonSetAction "[1000] call life_fnc_bankTransfer;";

		// Deposit5000
		_Btn4 ctrlSetStructuredText parseText "<t align='center'>5000€</t>";
		_Btn4 buttonSetAction "[5000] call life_fnc_bankTransfer;";

		// Deposit10000
		_Btn5 ctrlSetStructuredText parseText "<t align='center'>10000€</t>";
		_Btn5 buttonSetAction "[10000] call life_fnc_bankTransfer;";

		// Deposit5000
		_Btn6 ctrlSetStructuredText parseText "<t align='center'>50000€</t>";
		_Btn6 buttonSetAction "[50000] call life_fnc_bankTransfer;";

		// Deposit10000
		_Btn7 ctrlSetStructuredText parseText "<t align='center'>100000€</t>";
		_Btn7 buttonSetAction "[100000] call life_fnc_bankTransfer;";

		// wunsch
		_Btn8 ctrlSetStructuredText parseText "<t align='center'>Wunschbetrag</t>";
		_Btn8 buttonSetAction "[-1] call life_fnc_bankTransfer;";
		
		_Btn9 ctrlShow false;
	};
};

_BtnExit buttonSetAction "closeDialog 0;[] call life_fnc_atmMenu;";

[] spawn
{
	waitUntil{!isNull (findDisplay 2750)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 2750)}; //Wait for the spawn selection to be done.
	[16] call SOCK_fnc_updatePartial;
};