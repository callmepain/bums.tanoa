#include "..\..\script_macros.hpp"
_shop = [_this,0,"",[""]] call BIS_fnc_param;
_level = [_this,1,0,[0]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_vehicles = [];
_vehlvl = 0;
_side = "";
_toShow = false;
SIDEOFPLAYER(_side);
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");
private _control = CONTROL(7730,1500);
private _controlnext = CONTROL(7730,1501);
{
	_vehicles pushback (_x select 0); 
}forEach _vehicleList;
if (_type isEqualTo "now") then {
	{
		_vehlvl = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _x >> "level");
		
		if (_level isEqualTo _vehlvl) then {
			_toShow = true;
		} else {_toShow = false;};
		if (_toShow) then {
			_vehicleInfo = [_x] call life_fnc_fetchVehInfo;
			_msg = [_vehicleInfo select 3,30] call KRON_StrLeft;
			_control lbAdd (_msg);
			//_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		};
	} forEach _vehicles;
} else {
	_level = _level +1;
	{
		_vehlvl = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _x >> "level");
		
		if (_level isEqualTo _vehlvl) then {
			_toShow = true;
		} else {_toShow = false;};
		if (_toShow) then {
			_vehicleInfo = [_x] call life_fnc_fetchVehInfo;
			_msg = [_vehicleInfo select 3,30] call KRON_StrLeft;
			_controlnext lbAdd (_msg);
			//_controlnext lbSetPicture [(lbSize _controlnext)-1,(_vehicleInfo select 2)];
		};
	} forEach _vehicles;
};