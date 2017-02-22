#include "..\..\script_macros.hpp"
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_player_data","_sf_array","_alive"];
_weight = life_schliessfach getVariable["schliessfach_groesse",0];
_alive = life_schliessfach getVariable["schliessfach_alive",0];
if (_alive isEqualTo 0) then {_alive = false;}else{_alive = true;};
_sfnow = format["Stufe%1",_weight];
_sfCfg = missionConfigFile >> "schliessfach" >> _sfnow;
_sfnext = getText(_sfCfg >> "next");
_sfgroesse = getNumber(_sfCfg >> "groesse");

_sfnextCfg = missionConfigFile >> "schliessfach" >> _sfnext;
_sfnextpreis = getNumber(_sfnextCfg >> "preis");
_sfnextgroesse = getNumber(_sfnextCfg >> "groesse");

_sfkaufen= getNumber(missionConfigFile >> "cfgschliessfach" >> "kaufen");
_mWeight = _sfgroesse;

if(!createDialog "SchliessfachMenu") exitWith {[(format [localize "STR_MISC_DialogError"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Couldn't create the menu?
disableSerialization;

if !(_alive) then {
	((findDisplay 4500) displayCtrl 4010) ctrlShow false;
	((findDisplay 4500) displayCtrl 4011) ctrlShow false;
	((findDisplay 4500) displayCtrl 4013) ctrlShow false;
	((findDisplay 4500) displayCtrl 4014) ctrlShow false;
	((findDisplay 4500) displayCtrl 1600) ctrlShow false;
	((findDisplay 4500) displayCtrl 4200) ctrlShow false;
	((findDisplay 4500) displayCtrl 4201) ctrlShow false;
	((findDisplay 4500) displayCtrl 4502) ctrlShow false;
	((findDisplay 4500) displayCtrl 4503) ctrlShow false;
	((findDisplay 4500) displayCtrl 4505) ctrlShow false;
	((findDisplay 4500) displayCtrl 4506) ctrlShow false;
	((findDisplay 4500) displayCtrl 4100) ctrlShow false;
	((findDisplay 4500) displayCtrl 1601) ctrlSetStructuredText parseText format["Schliessfach kaufen für %1$",[_sfkaufen] call life_fnc_numberText];
} else {
	((findDisplay 4500) displayCtrl 4202) ctrlShow false;
	((findDisplay 4500) displayCtrl 1601) ctrlShow false;
};
if (_sfnow isEqualTo _sfnext)then {
	((findDisplay 4500) displayCtrl 1600) ctrlShow false;
};
if (life_cash < _sfkaufen) then {
	((findDisplay 4500) displayCtrl 1601) ctrlEnable false;
};
_display = findDisplay 4500;
_Titel = _display displayCtrl 4100;
_Btn1 = _display displayCtrl 4010;
_Btn2 = _display displayCtrl 4011;
_Btn3 = _display displayCtrl 4013;
_Btn4 = _display displayCtrl 4014;
_Btn5 = _display displayCtrl 1600;

if (life_cash < _sfnextpreis) then {
	((findDisplay 4500) displayCtrl 1600) ctrlEnable false;
};

life_sf_now = _sfnow;
life_sf_next = _sfnext;
_Btn5 buttonSetAction "[life_sf_now,life_sf_next] spawn life_fnc_erweiternSf;";
_Btn1 ctrlSetStructuredText parseText "Nehmen";
_Btn2 ctrlSetStructuredText parseText "Lagern";
_Btn3 ctrlSetStructuredText parseText "alles ausgewählte Nehmen";
_Btn4 ctrlSetStructuredText parseText "alles ausgewählte Lagern";
_Btn5 ctrlSetStructuredText parseText format["Schliessfach erweitern auf %2 Slots, für %1$ kaufen",[_sfnextpreis] call life_fnc_numberText,_sfnextgroesse];

[life_schliessfach] call life_fnc_schliessfachUpdateWeight; //To ensure everything is ok

_player_data = [_mWeight,(life_schliessfach getVariable["schliessfach",[[],0]]) select 1];
_Titel ctrlSetStructuredText parseText format["<t align='center'>Schliessfach</t><t align='right'>%1: %2/%3</t>",(localize "STR_MISC_Weight"),_player_data select 1,_player_data select 0];

[life_schliessfach] call life_fnc_schliessfachInventory;

life_schliessfach spawn
{
	waitUntil {isNull (findDisplay 4500)};
	[0,_this] remoteExec ['TON_fnc_update_schliessfach',2];
};