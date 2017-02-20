#include "..\..\script_macros.hpp"


private ["_data","_markers","_shape","_color","_size","_level"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_data = [_this,1,[],[[]]] call BIS_fnc_param;
_level = [_this,2,[],[[]]] call BIS_fnc_param;
_markers = [];

switch(_type) do {
	case "mining": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_mines = (_x select 0);
				for "_i" from 0 to ((count _mines) - 1) do {
					_marker = format ["%1_%2",localize(_x select 1),_i];
					_markers pushBack _marker;
				};
			};
		} forEach _data;
		{deleteMarkerLocal (_x );} forEach _markers;
	};
	case "miningtext": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_mines = (_x select 0);
				for "_i" from 0 to ((count _mines) - 1) do {
					_marker = format ["%1_type_%2",localize(_x select 1),_i];
					_markers pushBack _marker;
				};
			};
		} forEach _data;
		{deleteMarkerLocal (_x );} forEach _markers;
	};
	case "shop": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_marker = format ["%1_type",localize(_x select 1)];
				_markers pushBack _marker;
			};
		} forEach _data;
		{deleteMarkerLocal (_x );} forEach _markers;
	};
};