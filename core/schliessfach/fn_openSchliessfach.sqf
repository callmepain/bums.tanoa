#include "..\..\script_macros.hpp"
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];

_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_vehicle = player;
if(!createDialog "SchliessfachMenu") exitWith {[(format [localize "STR_MISC_DialogError"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Couldn't create the menu?
disableSerialization;

_display = findDisplay 4500;
_Titel = _display displayCtrl 4100;
_Btn1 = _display displayCtrl 4010;
_Btn2 = _display displayCtrl 4011;
_Btn3 = _display displayCtrl 4013;
_Btn4 = _display displayCtrl 4014;


_Btn1 ctrlSetStructuredText parseText "Nehmen";
_Btn2 ctrlSetStructuredText parseText "Lagern";
_Btn3 ctrlSetStructuredText parseText "alles ausgewählte Nehmen";
_Btn4 ctrlSetStructuredText parseText "alles ausgewählte Lagern";

//log
_text = format ["<<<<openInventory>>>>|%1||%2|>>hat das Schliessfach geöffnet",getPlayerUID player,name player];

[_text] remoteExec ["TON_fnc_log",0];
//log
ctrlSetText[4501,format[(localize "STR_MISC_VehStorage")+ " - %1","test"]];
	

[_vehicle] call life_fnc_schliessfachUpdateWeight; //To ensure everything is ok
_mWeight = 10000;
_veh_data = [_mWeight,(_vehicle getVariable["schliessfach",[[],0]]) select 1];

_Titel ctrlSetStructuredText parseText format["<t align='center'>Schliessfach</t><t align='right'>%1: %2/%3</t>",(localize "STR_MISC_Weight"),_veh_data select 1,_veh_data select 0];

[_vehicle] call life_fnc_schliessfachInventory;
life_schliessfach = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 4500)};
	[_this] remoteExec ['TON_fnc_save_schliessfach',2];
};

