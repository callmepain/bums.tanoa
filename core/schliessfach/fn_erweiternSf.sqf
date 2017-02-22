#include "..\..\script_macros.hpp"
private["_veh_data","_price","_aktuelle","_sfnow","_sfnext","_sfgroesse","_sfnextpreis","_sfnextgroesse","_buy","_sfpreis"];
params [
    "_sfnow",
    "_sfnext"
];
_aktuelle = life_schliessfach getVariable["schliessfach_groesse",0];
_sf = format["Stufe%1",_aktuelle];
if (_sf isEqualTo _sfnow)then {
	_aktuelle = (_aktuelle+1);
	_sfnow = format["Stufe%1",_aktuelle];
	_sfCfg = missionConfigFile >> "schliessfach" >> _sfnow;
	_sfnext = getText(_sfCfg >> "next");
	_sfpreis = getNumber(_sfCfg >> "preis");
	_sfgroesse = getNumber(_sfCfg >> "groesse");
	_sfnextCfg = missionConfigFile >> "schliessfach" >> _sfnext;
	_sfnextpreis = getNumber(_sfnextCfg >> "preis");
	_sfnextgroesse = getNumber(_sfnextCfg >> "groesse");
} else {
	_sfnow = format["Stufe%1",_aktuelle];
	_sfCfg = missionConfigFile >> "schliessfach" >> _sfnow;
	_sfnext = getText(_sfCfg >> "next");
	_sfpreis = getNumber(_sfCfg >> "preis");
	_sfgroesse = getNumber(_sfCfg >> "groesse");
	_sfnextCfg = missionConfigFile >> "schliessfach" >> _sfnext;
	_sfnextpreis = getNumber(_sfnextCfg >> "preis");
	_sfnextgroesse = getNumber(_sfnextCfg >> "groesse");
};
_price = _sfpreis;
_mWeight = _sfgroesse;
_buy =
 [
	parseText format["Willst du wirklich dein Schliessfach erweitern für <t color='#ff0000'>%1$</t>",[_price] call life_fnc_numberText],
	"Schliessfach Erweiterung kaufen",
	"Ok",
	"Nein Danke"
] call BIS_fnc_guiMessage;
if !(_buy) exitWith{};

if (_price > CASH) exitWith {[(format [localize "STR_NOTF_NotEnoughMoney"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

CASH = CASH - _price;

if (_sfnow isEqualTo _sfnext)then {
	((findDisplay 4500) displayCtrl 1600) ctrlShow false;
} else {
	life_schliessfach setVariable["schliessfach_groesse",(_aktuelle+1),true];
	[1,life_schliessfach,(_aktuelle+1)] remoteExec ['TON_fnc_update_schliessfach',2];
};
_veh_data = [_mWeight,(life_schliessfach getVariable["schliessfach",[[],0]]) select 1];
disableSerialization;
_display = findDisplay 4500;
_Titel = _display displayCtrl 4100;
_Btn5 = _display displayCtrl 1600;
_Btn5 ctrlSetStructuredText parseText format["Schliessfach erweitern auf %2 Slots, für %1$ kaufen",[_sfnextpreis] call life_fnc_numberText,_sfnextgroesse];
_Titel ctrlSetStructuredText parseText format["<t align='center'>Schliessfach</t><t align='right'>%1: %2/%3</t>",(localize "STR_MISC_Weight"),_veh_data select 1,_veh_data select 0];
[(format ["Du hast dir eine Schliessfach erweiterung für <t color='#ff0000'>%1$</t> gekauft!",[_price] call life_fnc_numberText]),"Hinweis","Green"] call MSG_fnc_handle;