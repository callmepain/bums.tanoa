#include "..\..\script_macros.hpp"
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target


disableSerialization;
_curTarget = param [0,objNull,[objNull]];
_seizeRank = LIFE_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_pInact_curTarget = _curTarget;


if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8];
};

if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
	
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;[(format ["Neee, mit dem kannst du nicht interagieren"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Bad side check?


if(!(_curTarget getVariable["restrained",false])) then
{
	_Btn4 ctrlEnable false;
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
};

// if(playerside == west ) then {_Btn5 ctrlEnable false}; //&& side _curTarget == west
if(playerside == independent && side _curTarget == independent) then {_Btn5 ctrlEnable false};


//Set Unrestrain Button
if(!(_curTarget getVariable["restrained",false])) then
{
	
	if(life_inv_handschellen > 0) then 
	{
		_Btn1 buttonSetAction "[false,""handschellen"",1] call life_fnc_handleInv;[] call life_fnc_restrainAction; closeDialog 0;";
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>Spieler festnehmen</t>";
	} 
	else 
	{
		_Btn1 ctrlSetStructuredText parseText "<t align='center'>Du hast keine Handschellen</t>";
		_Btn1 ctrlEnable false;
	};

} else {
	_Btn1 ctrlSetStructuredText parseText "<t align='center'>Spieler frei lassen</t>";
	_Btn1 buttonSetAction "[player] call life_fnc_unrestrain; closeDialog 0;";
};
//Set Check Licenses Button
_Btn2 ctrlSetStructuredText parseText "<t align='center'>Lizenzen kontrollieren</t>";
_Btn2 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",player]";

//Set Search Button
_Btn3 ctrlSetStructuredText parseText "<t align='center'>Spieler durchsuchen</t>";
_Btn3 buttonSetAction "[player] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["isEscorting",false])) then {
	_Btn4 ctrlSetStructuredText parseText "<t align='center'>Stop Spielereskort</t>";
	_Btn4 buttonSetAction "[player] call life_fnc_stopEscorting; [player] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 ctrlSetStructuredText parseText "<t align='center'>Spieler eskortieren</t>";
	_Btn4 buttonSetAction "[player] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetStructuredText parseText "<t align='center'>Ticket ausstellen</t>";
_Btn5 buttonSetAction "[player] call life_fnc_ticketAction;";


_Btn6 ctrlSetStructuredText parseText "<t align='center'>Spieler einsperren</t>";
_Btn6 buttonSetAction "closeDialog 0; createDialog ""jail_time"";";

_Btn7 ctrlSetStructuredText parseText "<t align='center'>Spieler ins Auto einladen</t>";
_Btn7 buttonSetAction "[player] call life_fnc_putInCar;";

//actually the Breathalyser button
// _Btn8 ctrlSetText localize "STR_pInAct_Breathalyzer";
// _Btn8 buttonSetAction "[[player],""life_fnc_breathalyzer"",life_pInact_curTarget,FALSE] spawn life_fnc_MP;closeDialog 0";
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;

