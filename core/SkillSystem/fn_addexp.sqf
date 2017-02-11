//#define NextLevel(var1,var2) var2 = (((4* (var1^5)) - (6*(var1^2))) + (20*var1) +1000)
#include "..\..\script_macros.hpp"
/*
File: fn_addExp.sqf
Author: Jacob "PapaBear" Tyler
 
Description:
Add exp to given prof
*/
//add exp
_type = [_this,0,"",[""]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;
//_zone = [_this,2,"",[""]] call BIS_fnc_param;
_speed = [_this,2,0,[0]] call BIS_fnc_param;
_side = "";
SIDEOFPLAYER(_side);
_profData = SKILLSYSTEM_VALUE(_type,_side);
//0 = level 
//1 = exp 
 disableSerialization;
_level = (_profData select 0);
_exp = (_profData select 1);
_nextLevel = 0;
NextLevel(_level,_nextLevel);
if(_speed == 0) then { 
	_amount = floor(_amount * (_level^1.2)/3.2);
} else {
	_amount =floor((_amount * (_level^1.2)) * (_speed^3/_speed^2.75));
};
_exp = _exp + _amount;
_prozent = _exp / _nextLevel;
if( _exp >= _nextLevel ) then {
	_exp = _exp - _nextLevel;
	"progressBarexp" cutRsc ["life_progress_exp","PLAIN"];
	_ui = uiNamespace getVariable "life_progress_exp";
	_progress = _ui displayCtrl 382010; 
	_pgText = _ui displayCtrl 382020; 
	_pgText2 = _ui displayCtrl 382021;
	_pgText ctrlSetText format ["LevelUP"];
	_pgText2 ctrlSetText format ["Erfarung in %1: +%2xp",_type,floor(_amount)];
	_progress progressSetPosition _prozent;

	_now = [_level,_type] call life_fnc_getnow;
	_next = [_level,_type] call life_fnc_getnext;
	missionNamespace setVariable [SKILLSYSTEM_VARNAME(_type,_side),[(_profData select 0) + 1,(_exp)]];
	CONSTPROF(life_civpkw_level ,(SKILLSYSTEM_VALUE("PKW","civ") select 0));
	CONSTPROF(life_civlkw_level ,(SKILLSYSTEM_VALUE("LKW","civ") select 0));
	CONSTPROF(life_civair_level ,(SKILLSYSTEM_VALUE("Fliegen","civ") select 0));
	CONSTPROF(life_civabbau_level ,(SKILLSYSTEM_VALUE("Rohstoffabbau","civ") select 0));
	
	if ((_next == "") && (_now == "")) then {
		if ((_type == "FahrenPKW") || (_type == "FahrenLKW") || (_type == "Fliegen")) then { 
			[(format ["%1 ist nun Level %2.<br />Du kannst nun neue Fahrzeuge kaufen.",_type,_level+1]),"LevelSystem","Green"] call MSG_fnc_handle;
		} else {
			[(format ["%1 ist nun Level %2.<br />Du bist jetzt noch effektiver.",_type,_level+1]),"LevelSystem","Green"] call MSG_fnc_handle;
		};
	}; 
	if ((_next == "") && (_now != "")) then {
		[(format ["%1 ist nun Level %2.<br />Du kannst nun %3 abbauen.",_type,_level+1,_now]),"LevelSystem","Green"] call MSG_fnc_handle;
	};
	if ((_next != "") && (_now != "")) then {
		[(format ["%1 ist nun Level %2.<br />Du kannst nun %3 abbauen.<br />als nächstes schaltest du %4 frei.",_type,_level+1,_now,_next]),"LevelSystem","Green"] call MSG_fnc_handle;
	};
	[11] call SOCK_fnc_updatePartial;
} else {
	"progressBarexp" cutRsc ["life_progress_exp","PLAIN"];
	_ui = uiNamespace getVariable "life_progress_exp";
	_progress = _ui displayCtrl 382010; 
	_pgText = _ui displayCtrl 382020; 
	_pgText2 = _ui displayCtrl 382021;
	_pgText ctrlSetText format ["%1/%2",[floor(_exp)] call life_fnc_numberText,[_nextLevel] call life_fnc_numberText];
	_pgText2 ctrlSetText format ["Erfarung in %1: +%2xp",_type,floor(_amount)];
	_progress progressSetPosition _prozent;
	
	missionNamespace setVariable [SKILLSYSTEM_VARNAME(_type,_side),[(_profData select 0),(_exp)]];
};