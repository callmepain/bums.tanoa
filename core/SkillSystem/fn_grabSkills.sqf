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
lbClear _lvl;
lbClear _exp;
lbClear _expLeft;
_profName = lbData[7731,(lbCurSel 7731)];
_profName = call compile format["%1", _profName];
_side = "";
SIDEOFPLAYER(_side);
_data = SKILLSYSTEM_VALUE(_profName,_side);
_profLevel = _data select 0;
_profExp = _data select 1;
_level = (_data select 0);
_nextLevel = 0;
NextLevel(_level,_nextLevel);
//if(_nextLevel < 1) then {_nextLevel = 500;};
_expLeft lbAdd format["%1",[_nextLevel]call life_fnc_numberText];
_expLeft lbSetData [(lbSize _expLeft)-1,str(_nextLevel)];
_exp lbAdd format["%1",[_profExp]call life_fnc_numberText];
_exp lbSetData [(lbSize _exp)-1,str(_profExp)];
_lvl lbAdd format["%1",_profLevel];
_lvl lbSetData [(lbSize _lvl)-1,str(_profLevel)];