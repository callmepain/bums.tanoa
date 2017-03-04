#include "..\..\script_macros.hpp"

if(!createDialog "admin_level") exitWith {[(format [localize "STR_MISC_DialogError"]),"Hinweis","Red"] call MSG_fnc_handle;}; //Couldn't create the menu?
disableSerialization;
_adac_lvl = ((findDisplay 4500) displayCtrl 2100);
_ems_lvl = ((findDisplay 4500) displayCtrl 2101);
_cop_lvl = ((findDisplay 4500) displayCtrl 2102);
_donator_lvl = ((findDisplay 4500) displayCtrl 2103);
_admin_lvl = ((findDisplay 4500) displayCtrl 2104);
_list = ((findDisplay 4500) displayCtrl 1500);
{
_side = "";
SIDEOFPLAYER(_side);
    _list lbAdd format ["%1 - %2", _x getVariable ["realname",name _x],_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} forEach playableUnits;
for "_i" from 1 to 5 do {
	_adac_lvl lbAdd format ["%1",_i];
	_adac_lvl lbSetData [(lbSize _adac_lvl)-1, str _i];
	_ems_lvl lbAdd format ["%1",_i];
	_ems_lvl lbSetData [(lbSize _ems_lvl)-1, str _i];
	_cop_lvl lbAdd format ["%1",_i];
	_cop_lvl lbSetData [(lbSize _cop_lvl)-1, str _i];
	_donator_lvl lbAdd format ["%1",_i];
	_donator_lvl lbSetData [(lbSize _donator_lvl)-1, str _i];
	_admin_lvl lbAdd format ["%1",_i];
	_admin_lvl lbSetData [(lbSize _admin_lvl)-1, str _i];
};
