#include "..\..\script_macros.hpp"
_level = [_this,0,0,[0]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

_side = "";
SIDEOFPLAYER(_side);
_professions = [];
_prof = "";
_profession = missionConfigFile >> "profession";  
for "_i" from 0 to count(_profession)-1 do {  
	_curConfig = _profession select _i;  
	_professionname = getText(_curConfig >> "variable");  
	_professions pushback _professionname;  
};
_profconf = missionConfigFile >> "profession" >> _type;  
{ 
	if (_type == _x) then {
		_prof =getText(_profconf >> "Resource");
	};
} forEach _professions;

_levelreg = missionConfigFile >> "CfgGather" >> _prof;
_minerals = [];
_test2 = [];  
_ergebnis = "";  
_resourcename ="";  
for "_i" from 0 to count(_levelreg)-1 do {  
	_curConfig = _levelreg select _i;  
	_resourceZones = getArray(_curConfig >> "mined");  
	_resourceLevel = getNumber(_curConfig >> "level");  
	_resourcename = localize getText(missionConfigFile >> "VirtualItems" >> (_resourceZones select 0) >>"displayName");  
	_minerals pushback [_resourcename,_resourceLevel];  
};
{  
	if ((_x select 1) == (_level+2)) then {  
		_test2 pushBack (_x select 0); 
	};  
} forEach _minerals; 
_format = "";
_formatitem = [];
for "_f" from 0 to ((count _test2) - 1) do {  
	if (_f == 0) then {  
		_format = format["%1%2","%",_f+1];  
		_formatitem = (_test2 select _f);  
	}; 
	if (_f >= 1) then {  
		_format = _format+format["%1%2","%",_f+1];  
		_formatitem = _formatitem + format["%1",","] + (_test2 select _f);   
	};    
};  
_ergebnis = format[_format,_formatitem];
_ergebnis;