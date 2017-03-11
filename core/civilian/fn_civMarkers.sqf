#include "..\..\script_macros.hpp"
/*
    File: fn_civMarkers.sqf
    Author:

    Description:
    Add markers for civilians in groups.
*/
private ["_markers","_members"];
if (isDedicated) exitWith{};
if (!hasInterface && !isDedicated) exitWith{};

_markers = [];
_members = [];
_data  = SKILLSYSTEM_VALUE("Rohstoffabbau","civ");
_data2  = SKILLSYSTEM_VALUE("Ernten","civ");
for "_i" from 0 to 1 step 0 do {
    if (visibleMap) then
    {
		if (true) then {
			["mining",life_marker_mine,_data] call life_fnc_del_markers;
			["miningtext",life_marker_mine,_data] call life_fnc_del_markers;
			["shop",life_marker_process,_data] call life_fnc_del_markers;
			["shop",life_marker_trader,_data] call life_fnc_del_markers;
			["mining",life_marker_gather,_data2] call life_fnc_del_markers;
			["miningtext",life_marker_gather,_data2] call life_fnc_del_markers;
			["mining",life_marker_farming,_data2] call life_fnc_del_markers;
			["miningtext",life_marker_farming,_data2] call life_fnc_del_markers;
			sleep 0.2;
			["mining",life_marker_mine,"ELLIPSE","ColorRed",_data] call life_fnc_get_markers;
			["miningtext",life_marker_mine,"mil_box","ColorOrange",_data] call life_fnc_get_markers;
			["shop",life_marker_process,"mil_triangle","ColorWhite",_data] call life_fnc_get_markers;
			["shop",life_marker_trader,"b_unknown","ColorGreen",_data] call life_fnc_get_markers;
			["mining",life_marker_gather,"ELLIPSE","ColorRed",_data2] call life_fnc_get_markers;
			["miningtext",life_marker_gather,"mil_triangle","ColorCivilian",_data2] call life_fnc_get_markers;
			["mining",life_marker_farming,"ELLIPSE","ColorRed",_data2] call life_fnc_get_markers;
			["miningtext",life_marker_farming,"mil_triangle","Coloryellow",_data2] call life_fnc_get_markers;
		};
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
    };
	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
	_members = [];
	 sleep 0.5;
};
