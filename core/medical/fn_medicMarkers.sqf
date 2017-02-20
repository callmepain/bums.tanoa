/*
    File: fn_medicMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks downed players on the map when it's open.
*/
private ["_markers","_units","_medics"];
_markers = [];
_markersMedecin = [];
_units = [];
_medics = [];
_members = [];

sleep 0.25;
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
    {if (side _x isEqualTo independent) then {_medics pushBack _x;}} forEach playableUnits; //Fetch list of cops / blufor
    {
     /*   _name = _x getVariable "name"; */
		
        _down = _x getVariable "ACE_isUnconscious";
		_uncon = _x getVariable "Unconscious";
        if (_down && _uncon) then {
            _units pushBack _x;
        };
    } forEach playableUnits;
    {
        if !(_x isEqualTo player) then {
            _markerss = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
            _markerss setMarkerColorLocal "ColorIndependent";
            _markerss setMarkerTypeLocal "Mil_dot";
            _markerss setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];

            _markersMedecin pushBack [_markerss,_x];
        };
    } forEach _medics;

    //Loop through and create markers.
    {
        _marker = createMarkerLocal [format ["%1_dead_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorRed";
        _marker setMarkerTypeLocal "loc_Hospital";
        _marker setMarkerTextLocal format ["%1 bewustlos seit: %2min",(_x getVariable ["realname",name _x]),(floor ((time -(_x getVariable ["Unconscious_time",true]))/60))];
        _markers pushBack _marker;
    } forEach _units;

    while {visibleMap} do {
        {
            private ["_unit"];
            _unit = _x select 1;
            if (!isNil "_unit" && !isNull _unit) then {
                (_x select 0) setMarkerPosLocal (visiblePosition _unit);
            };
        } forEach _markersMedecin;
        if (!visibleMap) exitWith {};
        sleep 0.02;
    };
    {deleteMarkerLocal (_x select 0);} forEach _markersMedecin;
    _markersMedecin = [];
    _medics = [];
    waitUntil {!visibleMap};
    {deleteMarkerLocal _x;} forEach _markers;
};
