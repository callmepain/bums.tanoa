#include "..\..\script_macros.hpp"
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	EDIT by H4uklotz
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type","_gFund"];
if(isDedicated) exitWith {};
if(!life_use_atm) exitWith
{
	[(format [localize "STR_Shop_ATMRobbed"]),"Hinweis","Yellow"] call MSG_fnc_handle;
};

if(!dialog) then
{
	if(!(createDialog "life_atm_menu")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_titel = _display displayCtrl 1100;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;
_Btn1 = _display displayCtrl 2705;
_Btn2 = _display displayCtrl 2706;
_Btn3 = _display displayCtrl 2707;
_Btn4 = _display displayCtrl 2708;
_Btn5 = _display displayCtrl 2709;


_titel ctrlSetStructuredText parseText "<t align='center'>Tanoa Holdings Inc.</t>";
_Btn1 ctrlSetStructuredText parseText "einzahlen in die Gangbank";
_Btn2 ctrlSetStructuredText parseText "abheben von der Gangbank";
_Btn3 ctrlSetStructuredText parseText "Geld einzahlen";
_Btn4 ctrlSetStructuredText parseText "Geld abheben";
_Btn5 ctrlSetStructuredText parseText "Geld überweisen";



lbClear _units;



[] spawn 
{
	disableSerialization;
	_display = findDisplay 2700;
	_text = _display displayCtrl 2701;

	for "_i" from 0 to 1 step 0 do
	{
		_text ctrlSetStructuredText parseText format
		[
			"<t align='center'><img size='1.7' image='icons\ico_bank.paa'/> $%1 [Bank]<br/><img size='1.6' image='icons\ico_money.paa'/> $%2 [Tasche]<br/><img size='1.7' image='icons\ico_bank.paa'/> $%3 [Gang]",
			[BANK] call life_fnc_numberText,
			[CASH] call life_fnc_numberText,
			[GANG_FUNDS] call life_fnc_numberText
		];
		waitUntil{!isNull (findDisplay 2750)}; 
		waitUntil{isNull (findDisplay 2750)}; 
	};
};

{
	if(alive _x && _x != player) then //&& _x != player
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Medic"};
			case east: {_type = "Adac"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

// lbSetCurSel [2703,0];

if (isNil {(group player getVariable "gang_bank")}) then {
	(CONTROL(2700,2705)) ctrlEnable false;
	(CONTROL(2700,2706)) ctrlEnable false;
};

_ownerID = group player getVariable ["gang_owner",""];

if !(_ownerID isEqualTo getPlayerUID player) then {
(CONTROL(2700,2706)) ctrlEnable false;
};
