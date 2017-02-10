#include "..\..\script_macros.hpp"
/*
    File: fn_civMarkers.sqf
    Author:

    Description:
    Add markers for civilians in groups.
*/
private ["_markers","_markers2","_markers3","_markers4","_markers5","_markers6","_markers7","_members"];
_markers = [];
_markers2 = [];
_markers3 = [];
_markers4 = [];
_markers5 = [];
_markers6 = [];
_markers7 = [];
_members = [];
_mine = [];
_gather = [];
_process = [];
_trader = [];
_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_gatherCfg = missionConfigFile >> "CfgGather" >> "Resources";
_processorCfg = missionConfigFile >> "CfgGather" >> "Processing";
_traderCfg = missionConfigFile >> "CfgGather" >> "Shops";
for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = _resourceCfg select _i;
    _resourceZones = getArray(_curConfig >> "zones");
	_resourceName = getText(_curConfig >> "displayName");
	_resourceLevel = getNumber(_curConfig >> "level");
	_mine pushback [_resourceZones,_resourceName,_resourceLevel];
};
for "_i" from 0 to count(_processorCfg)-1 do {
    _curConfig2 = _processorCfg select _i;
	_processorname = getText(_curConfig2 >> "processorname");
	_processor = getText(_curConfig2 >> "processor");
	_processLevel = getNumber(_curConfig2 >> "level");
	_process pushback [_processLevel,_processorname,_processor];
};
for "_i" from 0 to count(_traderCfg)-1 do {
    _curConfig3 = _traderCfg select _i;
	_tradername = getText(_curConfig3 >> "Shopsname");
	_traders = getText(_curConfig3 >> "Shops");
	_traderLevel = getNumber(_curConfig3 >> "level");
	_trader pushback [_traderLevel,_tradername,_traders];
};
for "_i" from 0 to count(_gatherCfg)-1 do {
    _curConfig4 = _gatherCfg select _i;
    _gatherZones = getArray(_curConfig4 >> "zones");
	_gatherName = getText(_curConfig4 >> "displayName");
	_gatherLevel = getNumber(_curConfig4 >> "level");
	_gather pushback [_gatherLevel,_gatherZones,_gatherName];
};
_data  = SKILLSYSTEM_VALUE("Rohstoffabbau","civ");
for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (visibleMap) then
    {
		{
		if ((_x select 2) <= (_data select 0)) then {
			_test = (_x select 0);
				for "_f" from 0 to ((count _test) - 1) do {
					_marker2 = createMarkerLocal [format ["%1_mine%2",localize(_x select 1),_f], getMarkerPos (_x select 0 select _f)];
					_marker2 setMarkerShape "ELLIPSE";
					_marker2 setMarkerSize [30, 30];
					_marker2 setMarkerColorLocal "ColorRed";
					_markers2 pushBack _marker2;
					_marker3 = createMarkerLocal [format ["%1_name%2",localize(_x select 1),_f], getMarkerPos (_x select 0 select _f)];
					_marker3 setMarkerTypeLocal "mil_triangle";
					_marker3 setMarkerColorLocal "ColorBlack";
					_marker3 setMarkerTextLocal format [localize (_x select 1)];
					_markers3 pushBack _marker3;
				};
			};
		} forEach _mine;
		{
		if ((_x select 0) <= (_data select 0)) then {
			_marker4 = createMarkerLocal [format ["%1_prozessname",localize(_x select 1)], getMarkerPos (_x select 2)];
			_marker4 setMarkerTypeLocal "mil_triangle";
			_marker4 setMarkerColorLocal "ColorWhite";
			_marker4 setMarkerTextLocal format [localize (_x select 1)];
			_markers4 pushBack _marker4;
		};
		} forEach _process;
		{
		if ((_x select 0) <= (_data select 0)) then {
			_marker5 = createMarkerLocal [format ["%1_shopname",localize(_x select 1)], getMarkerPos (_x select 2)];
			_marker5 setMarkerTypeLocal "b_unknown";
			_marker5 setMarkerColorLocal "ColorGreen";
			_marker5 setMarkerTextLocal format [localize (_x select 1)];
			_markers5 pushBack _marker5;
		};
		} forEach _trader;
		{
		if ((_x select 0) <= (_data select 0)) then {
			_test2 = (_x select 1);
				for "_z" from 0 to ((count _test2) - 1) do {
					_marker6 = createMarkerLocal [format ["%1_gather%2",localize(_x select 2),_z], getMarkerPos (_x select 1 select _z)];
					_marker6 setMarkerShape "ELLIPSE";
					_marker6 setMarkerSize [30, 30];
					_marker6 setMarkerColorLocal "ColorRed";
					_markers6 pushBack _marker6;
					_marker7 = createMarkerLocal [format ["%1_gathername%2",localize(_x select 2),_z], getMarkerPos (_x select 1 select _z)];
					_marker7 setMarkerTypeLocal "mil_triangle";
					_marker7 setMarkerColorLocal "ColorGreen";
					_marker7 setMarkerTextLocal format [localize (_x select 2)];
					_markers7 pushBack _marker7;
				};
			};
		} forEach _gather;
		
        _members = units (group player);
        {
            if !(_x isEqualTo player) then {
                _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
                _marker setMarkerColorLocal "ColorCivilian";
                _marker setMarkerTypeLocal "Mil_dot";
                _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];
                _markers pushBack [_marker,_x];
            };
        } forEach _members;

        while {visibleMap} do
        {
            {
                private ["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                      (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
		{deleteMarkerLocal (_x);} forEach _markers2;
		{deleteMarkerLocal (_x);} forEach _markers3;
		{deleteMarkerLocal (_x);} forEach _markers4;
		{deleteMarkerLocal (_x);} forEach _markers5;
		{deleteMarkerLocal (_x);} forEach _markers6;
		{deleteMarkerLocal (_x);} forEach _markers7;
        _markers = [];
		_markers2 = [];
		_markers3 = [];
		_markers4 = [];
		_markers5 = [];
		_markers6 = [];
		_markers7 = [];
        _members = [];
    };
};
