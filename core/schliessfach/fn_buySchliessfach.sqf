#include "..\..\script_macros.hpp"

//_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_alive = life_schliessfach getVariable["schliessfach_alive",0];
_weight = life_schliessfach getVariable["schliessfach_groesse",0];
_sfnow = format["Stufe%1",_weight];
_sfCfg = missionConfigFile >> "schliessfach" >> _sfnow;
_sfnext = getText(_sfCfg >> "next");
_sfgroesse = getNumber(_sfCfg >> "groesse");
_sfnextCfg = missionConfigFile >> "schliessfach" >> _sfnext;
_sfnextpreis = getNumber(_sfnextCfg >> "preis");
_sfnextgroesse = getNumber(_sfnextCfg >> "groesse");
_sfkaufen= getNumber(missionConfigFile >> "cfgschliessfach" >> "kaufen");

if (_alive isEqualTo 0) then {_alive = false;}else{_alive = true;};
_msg =
[
	parseText format["Willst du dir wirklich ein Schliessfach für <t color='#ff0000'>%1$</t> kaufen?",[_sfkaufen] call life_fnc_numberText],
	"Schliessfach kaufen",
	"Ok",
	"Nein Danke"
] call BIS_fnc_guiMessage;

if !(_msg) exitWith{};

CASH = CASH - _sfkaufen;
life_schliessfach remoteExec ['TON_fnc_insert_schliessfach',2];
life_schliessfach setVariable["schliessfach_alive",1,true];
[(format ["Du hast dir ein Schliessfach für <t color='#ff0000'>%1$</t> gekauft!",[_sfkaufen] call life_fnc_numberText]),"Hinweis","Green"] call MSG_fnc_handle;
((findDisplay 4500) displayCtrl 4010) ctrlShow true;
((findDisplay 4500) displayCtrl 4011) ctrlShow true;
((findDisplay 4500) displayCtrl 4013) ctrlShow true;
((findDisplay 4500) displayCtrl 4014) ctrlShow true;
((findDisplay 4500) displayCtrl 1600) ctrlShow true;
((findDisplay 4500) displayCtrl 4200) ctrlShow true;
((findDisplay 4500) displayCtrl 4201) ctrlShow true;
((findDisplay 4500) displayCtrl 4502) ctrlShow true;
((findDisplay 4500) displayCtrl 4503) ctrlShow true;
((findDisplay 4500) displayCtrl 4505) ctrlShow true;
((findDisplay 4500) displayCtrl 4506) ctrlShow true;
((findDisplay 4500) displayCtrl 4100) ctrlShow true;
((findDisplay 4500) displayCtrl 4202) ctrlShow false;
((findDisplay 4500) displayCtrl 1601) ctrlShow false;

if (life_cash < _sfnextpreis) then {
	((findDisplay 4500) displayCtrl 1600) ctrlEnable false;
};