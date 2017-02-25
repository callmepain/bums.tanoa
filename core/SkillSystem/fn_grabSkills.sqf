#include "..\..\script_macros.hpp"
/*
    File: fn_grabSkills.sqf
    Author: [midgetgrimm]
	Edit by H4uklotz
    diag_log format["%1",];
*/
private["_display","_lvl","_exp","_profText","_expLeft","_profName","_data","_profLevel","_nextLevel"];
disableSerialization;
_display = findDisplay 7730;
_lvl = _display displayCtrl 7732;
_exp = _display displayCtrl 7733;
_expLeft = _display displayCtrl 7734;
_expnow = _display displayCtrl 1500;
_expnext = _display displayCtrl 1501;
_datanow = _display displayCtrl 1502;
_datanext = _display displayCtrl 1503;

lbClear _lvl;
lbClear _exp;
lbClear _expLeft;
lbClear _expnow;
lbClear _expnext;
lbClear _datanow;
lbClear _datanext;

_side = "";
_timemax = 0.5;
_timenow = 0.5;
_timenext = 0.5;
_miningnow = 1;
_miningnext = 1;
_repnext = 1;
_repnow = 1;

_profName = lbData[7731,(lbCurSel 7731)];
_profName = call compile format["%1", _profName];

SIDEOFPLAYER(_side);
_data = SKILLSYSTEM_VALUE(_profName,_side);
_profLevel = _data select 0;
_profExp = _data select 1;
_level = (_data select 0);
_levelnext = (_data select 0)+1;
_nextLevel = 0;

NextLevel(_level,_nextLevel);
//if(_nextLevel < 1) then {_nextLevel = 500;};
_expLeft lbAdd format["%1",[_nextLevel]call life_fnc_numberText];
_expLeft lbSetData [(lbSize _expLeft)-1,str(_nextLevel)];
_exp lbAdd format["%1",[_profExp]call life_fnc_numberText];
_exp lbSetData [(lbSize _exp)-1,str(_profExp)];
_lvl lbAdd format["%1",_profLevel];
_lvl lbSetData [(lbSize _lvl)-1,str(_profLevel)];

if (_profName isEqualTo "Ernten") then {
	_nowernten = [_profLevel,"ernten"]call life_fnc_getnow_menu;
	_nexternten = [_profLevel,"ernten"] call life_fnc_getnext_menu;	
	MININGMULTI(_miningnow,_level);
	MININGTIME(_timenow,_level);
	MININGMULTI(_miningnext,_levelnext);
	MININGTIME(_timenext,_levelnext);
	_timenow = (_timemax - _timenow) * 100;
	_timenext = (_timemax - _timenext) * 100;
	{
		_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		_expnow lbAdd format["%1",(localize _displayName)];
		_expnow lbSetData [(lbSize _expnow)-1,_x];
		_expnow lbSetPicture [(lbSize _expnow)-1,_icon];
	}forEach _nowernten;
	{
		_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		_expnext lbAdd format["%1",(localize _displayName)];
		_expnext lbSetData [(lbSize _expnext)-1,_x];
		_expnext lbSetPicture [(lbSize _expnext)-1,_icon];
	}forEach _nexternten;
	_datanow lbAdd format["Dauer: -%1%2",_timenow,"%"];
	_datanow lbAdd format["Abbau: +%1%2",_miningnow,"%"];
	_datanext lbAdd format["Dauer: -%1%2",_timenext,"%"];
	_datanext lbAdd format["Abbau: +%1%2",_miningnext,"%"];
};
if (_profName isEqualTo "Rohstoffabbau") then {
	_nowRa = [_profLevel,"Rohstoffabbau"]call life_fnc_getnow_menu;
	_nextRa = [_profLevel,"Rohstoffabbau"] call life_fnc_getnext_menu;	
	MININGMULTI(_miningnow,_level);
	MININGTIME(_timenow,_level);
	MININGMULTI(_miningnext,_levelnext);
	MININGTIME(_timenext,_levelnext);
	_timenow = (_timemax - _timenow) * 100;
	_timenext = (_timemax - _timenext) * 100;
	{
		_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		_expnow lbAdd format["%1",(localize _displayName)];
		_expnow lbSetData [(lbSize _expnow)-1,_x];
		_expnow lbSetPicture [(lbSize _expnow)-1,_icon];
	}forEach _nowRa;
	{
		_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		_expnext lbAdd format["%1",(localize _displayName)];
		_expnext lbSetData [(lbSize _expnext)-1,_x];
		_expnext lbSetPicture [(lbSize _expnext)-1,_icon];
	}forEach _nextRa;
	_datanow lbAdd format["Dauer: -%1%2",_timenow,"%"];
	_datanow lbAdd format["Abbau: +%1%2",_miningnow,"%"];
	_datanext lbAdd format["Dauer: -%1%2",_timenext,"%"];
	_datanext lbAdd format["Abbau: +%1%2",_miningnext,"%"];
};
if (_profName isEqualTo "PKW") then {
	_lf = M_CONFIG(getNumber,"Spritverbrauch","PKW","levelfaktor");
	_verbrauchnow = (floor((_level/_lf)*100))/100;
	_verbrauchnext = (floor(((_level+1)/_lf)*100))/100;
	lbClear _expnow; //Flush the list.
	["civ_car_oldtimer",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_car_gebrauchtwagen",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_car_sportwagen",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_car_neuwagen",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_car_supersport",_profLevel,"now"] call life_fnc_get_next_car;
	
	["civ_car_oldtimer",_profLevel,"next"] call life_fnc_get_next_car;
	["civ_car_gebrauchtwagen",_profLevel,"next"] call life_fnc_get_next_car;
	["civ_car_sportwagen",_profLevel,"next"] call life_fnc_get_next_car;
	["civ_car_neuwagen",_profLevel,"next"] call life_fnc_get_next_car;
	["civ_car_supersport",_profLevel,"next"] call life_fnc_get_next_car;
	_datanow lbAdd format["Verbrauch: -%1%2",_verbrauchnow,"%"];
	_datanext lbAdd format["Verbrauch: -%1%2",_verbrauchnext,"%"];
};
if (_profName isEqualTo "LKW") then {
	_lf = M_CONFIG(getNumber,"Spritverbrauch","LKW","levelfaktor");
	_verbrauchnow = (floor((_level/_lf)*100))/100;
	_verbrauchnext = (floor(((_level+1)/_lf)*100))/100;
	lbClear _expnow; //Flush the list.
	["civ_truck",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_truck",_profLevel,"next"] call life_fnc_get_next_car;
	_datanow lbAdd format["Verbrauch: -%1%2",_verbrauchnow,"%"];
	_datanext lbAdd format["Verbrauch: -%1%2",_verbrauchnext,"%"];
};
if (_profName isEqualTo "Fliegen") then {
	_lf = M_CONFIG(getNumber,"Spritverbrauch","Fliegen","levelfaktor");
	_verbrauchnow = (floor((_level/_lf)*100))/100;
	_verbrauchnext = (floor(((_level+1)/_lf)*100))/100;
	lbClear _expnow; //Flush the list.
	["civ_air",_profLevel,"now"] call life_fnc_get_next_car;
	["civ_air",_profLevel,"next"] call life_fnc_get_next_car;
	_datanow lbAdd format["Verbrauch: -%1%2",_verbrauchnow,"%"];
	_datanext lbAdd format["Verbrauch: -%1%2",_verbrauchnext,"%"];
};
if (_profName isEqualTo "Reparieren") then {
	MININGTIME(_timenow,_level);
	MININGTIME(_timenext,_levelnext);
	CARREP(_repnow,_level);
	CARREP(_repnext,_levelnext);
	_repnow = (1 - _repnow) *100;
	_repnext = (1 - _repnext) *100;
	_timenow = (_timemax - _timenow) * 100;
	_timenext = (_timemax - _timenext) * 100;
	lbClear _expnow; //Flush the list.
	_datanow lbAdd format["Dauer:-%1%2",_timenow,"%"];
	_datanow lbAdd format["Max. Reparieren: +%1%2",_repnow,"%"];
	_datanext lbAdd format["Dauer:-%1%2",_timenext,"%"];
	_datanext lbAdd format["Max. Reparieren: +%1%2",_repnext,"%"];
};