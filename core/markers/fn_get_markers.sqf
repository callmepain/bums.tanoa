#include "..\..\script_macros.hpp"


private ["_data","_markers","_shape","_color","_size","_level"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_data = [_this,1,[],[[]]] call BIS_fnc_param;
_shape = [_this,2,"",[""]] call BIS_fnc_param;
_color = [_this,3,"",[""]] call BIS_fnc_param;
_level = [_this,4,[],[[]]] call BIS_fnc_param;
_markers = [];

switch(_type) do {
	case "mining": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_mines = (_x select 0);
				for "_i" from 0 to ((count _mines) - 1) do {
					_marker = createMarkerLocal [format ["%1_%2",localize(_x select 1),_i], getMarkerPos (_x select 0 select _i)];
					_marker setMarkerShape _shape;
					_marker setMarkerSize [(_x select 3), (_x select 3)];
					_marker setMarkerColorLocal _color;
					_markers pushBack _marker;
				};
			};
		} forEach _data;
	};
	case "miningtext": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_mines = (_x select 0);
				for "_i" from 0 to ((count _mines) - 1) do {
					_marker = createMarkerLocal [format ["%1_type_%2",localize(_x select 1),_i], getMarkerPos (_x select 0 select _i)];
					_marker setMarkerTypeLocal _shape;
					_marker setMarkerColorLocal _color;
					_marker setMarkerTextLocal format [localize (_x select 1)];
					_markers pushBack _marker;
				};
			};
		} forEach _data;
	};
	case "shop": {
		{
			if ((_x select 2) <= (_level select 0)) then {
				_marker = createMarkerLocal [format ["%1_type",localize(_x select 1)], getMarkerPos (_x select 0)];
				_marker setMarkerTypeLocal _shape;
				_marker setMarkerColorLocal _color;
				_marker setMarkerTextLocal format [localize (_x select 1)];
				_markers pushBack _marker;
			};
		} forEach _data;
	};
};