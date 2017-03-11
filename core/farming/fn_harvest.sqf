#include "..\..\script_macros.hpp"
_growprcnt = cursorobject getVariable "growprcnt";
_prof = "Ernten";
_zone = "";
_zonename = "";
_requiredItem = "";
_extra = 0;
_plantmaxgather = 0;
_harvestitem = "";
_hiname = "";
if (_growprcnt == 100) Then {
	life_action_inUse = true;
	_resourceCfg = missionConfigFile >> "CfgGather" >> "Farming";

	for "_i" from 0 to count(_resourceCfg)-1 do {

		_curConfig = _resourceCfg select _i;
		_resource = configName _curConfig;
		_maxGather = getNumber(_curConfig >> "amount");
		_zoneSize = getNumber(_curConfig >> "zoneSize");
		_resourceZones = getArray(_curConfig >> "zones");
		_conditions = getText(_curConfig >> "conditions");
		_requiredItem = getText(_curConfig >> "item");
		_gotItem = getArray(_curConfig >> "mined");
		_resextra = getNumber(_curConfig >> "extra");
		{
			if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
				_zone = _x;
				_zonename = _resource;
				_extra = _resextra;
				_plantmaxgather = _maxGather;
				_harvestitem = (_gotItem select 0);
				_hiname = _resource;
			};
		} forEach _resourceZones;

		if (_zone != "") exitWith {};
	};

	if (_zone isEqualTo "") exitWith {life_action_inUse = false;};
	_plant = cursorobject;
	_extracalculator = random _extra;  
	_roundextra = round _extracalculator;
	_totalharvest = 1 + _roundextra * _plantmaxgather;
	if(([true,_harvestitem,_totalharvest] call life_fnc_handleInv)) then
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		deleteVehicle _plant;
		[format ["Du hast %1 %2 abgebaut",_totalharvest,_hiname],"Hinweis","green"] call MSG_fnc_handle;
		life_action_inUse = false;
		if( _prof != "" ) then { 
			_exp = _totalharvest * M_CONFIG(getNumber,"profession",_prof,"baseEXPgain");
			[_prof,_exp] call life_fnc_addExp;
		};
	} else {
		["Dein Inventar ist voll","Hinweis","red"] call MSG_fnc_handle;
		life_action_inUse = false;
	};
} else {
	if (_growprcnt < 10) Then {
		["Diese Pflanze ist gerade erst gesetzt worden.Bleib doch mal locker...","Hinweis","blue"] call MSG_fnc_handle;
	} else {
		/*if (_growprcnt < 40) Then {
			["Diese Pflanze ist fast halb fertig gewachsen","Hinweis","blue"] call MSG_fnc_handle;
		} else {
			if (_growprcnt < 80) Then {
				["Diese Pflanze ist mehr als halb fertig gewachsen","Hinweis","blue"] call MSG_fnc_handle;
			} else {
				if (_growprcnt < 100) Then {
					["Diese Pflanze ist fast fertig zum abbauen","Hinweis","blue"] call MSG_fnc_handle;
				};
			};*/
			[format["Diese Pflanze ist zu %1%2 gewachsen",_growprcnt,"%"],"Hinweis","blue"] call MSG_fnc_handle;
		};
	};