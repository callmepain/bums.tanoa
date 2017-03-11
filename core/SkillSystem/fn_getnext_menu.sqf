#include "..\..\script_macros.hpp"
_level = [_this,0,0,[0]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

_side = "";
SIDEOFPLAYER(_side);
_professions = [];
_prof = [];
_minerals = [];
_ergebnis = []; 
_profession = missionConfigFile >> "profession";  
for "_i" from 0 to count(_profession)-1 do {  
	_curConfig = _profession select _i;  
	_professionname = getText(_curConfig >> "variable");  
	_professions pushback _professionname;  
};
_profconf = missionConfigFile >> "profession" >> _type;  
{ 
	if (_type == _x) then {
		//_prof =getText(_profconf >> "Resource");
		_prof =getArray(_profconf >> "Resource");
	};
} forEach _professions;
{
	_levelreg = missionConfigFile >> "CfgGather" >> _x;
	_resourcename ="";  
	for "_i" from 0 to count(_levelreg)-1 do {  
		_curConfig = _levelreg select _i;  
		_resourceZones = getArray(_curConfig >> "mined");  
		_resourceLevel = getNumber(_curConfig >> "level");  
		_resourcename = configName(missionConfigFile >> "VirtualItems" >> (_resourceZones select 0));  
		_minerals pushback [_resourcename,_resourceLevel];  
	};
}forEach _prof;
{  
	if ((_x select 1) == (_level+1)) then {  
		_ergebnis pushBack (_x select 0); 
	};  
} forEach _minerals; 
_ergebnis;