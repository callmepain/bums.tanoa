/*
    File: fn_copMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private ["_markers","_cops"];
_markers = [];
_adac = [];
_members = [];

sleep 0.5;
if (visibleMap) then {
	if !(life_markers) then {
		["mining",life_marker_mine,[100,""]] call life_fnc_del_markers;
		["miningtext",life_marker_mine,[100,""]] call life_fnc_del_markers;
		["shop",life_marker_process,[100,""]] call life_fnc_del_markers;
		["shop",life_marker_trader,[100,""]] call life_fnc_del_markers;
		["mining",life_marker_gather,[100,""]] call life_fnc_del_markers;
		["miningtext",life_marker_gather,[100,""]] call life_fnc_del_markers;
		sleep 0.5;
		["mining",life_marker_mine,"ELLIPSE","ColorRed",[100,""]] call life_fnc_get_markers;
		["miningtext",life_marker_mine,"mil_box","ColorOrange",[100,""]] call life_fnc_get_markers;
		["shop",life_marker_process,"mil_triangle","ColorWhite",[100,""]] call life_fnc_get_markers;
		["shop",life_marker_trader,"b_unknown","ColorGreen",[100,""]] call life_fnc_get_markers;
		["mining",life_marker_gather,"ELLIPSE","ColorRed",[100,""]] call life_fnc_get_markers;
		["miningtext",life_marker_gather,"mil_triangle","ColorCivilian",[100,""]] call life_fnc_get_markers;
		life_markers = true;
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
    {if (side _x isEqualTo east) then {_adac pushBack _x;}} forEach playableUnits; //Fetch list of cops / blufor
	
    //Create markers
    {
        if !(_x isEqualTo player) then {
            _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
            _marker setMarkerColorLocal "ColorBLUFOR";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];

            _markers pushBack [_marker,_x];
        };
    } forEach _adac;

    while {visibleMap} do {
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
    _markers = [];
    _adac = [];
};
