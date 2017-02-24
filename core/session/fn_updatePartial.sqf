#include "..\..\script_macros.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends specific information to the server to update on the player,
    meant to keep the network traffic down with large sums of data flowing
    through remoteExec
*/
private ["_mode","_packet","_array","_flag","_stats"];
_mode = param [0,0,[0]];
_packet = [getPlayerUID player,player,playerSide,_mode];
_array = [];
_stats = [];

_flag = switch (playerSide) do 
{
	case west: {"cop"}; 
	case civilian: {"civ"}; 
	case independent: {"med"}; 
	case east: {"adac"};
};

switch (_mode) do {
	////////cash
    case 0: 
	{
        _packet pushback CASH;
    };
	////////bank
    case 1: 
	{
        _packet pushback BANK;
    };
	//////// lizenzen
    case 2: 
	{
        {
            _varName = LICENSE_VARNAME(configName _x,_flag);
            _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

        _packet pushback _array;
    };
	////////gear
    case 3: 
	{
        [] call life_fnc_saveGear;
        _packet pushback life_gear;
    };
	////////pos & alive
    case 4: 
	{
        _packet pushback getPosATL player;
		_packet pushback life_is_alive;
    };
	////////arrest
    case 5: 
	{
        _packet pushback life_is_arrested;
    };
	////////cash & bank
    case 6: 
	{
        _packet pushback CASH;
        _packet pushback BANK;
    };
	//////// blocked by tonic´s keychain
    case 7: 
	{
       
    };	
	////////pos & alive
	case 8: 
	{
		_packet pushback getPosATL player;
		_packet pushback life_is_alive;
	};
	 // platzhalter
	case 9: 
	{
		// platzhalter
	};
	////////gear & cash & pos & alive
	case 10: 
	{
		[] call life_fnc_saveGear;
		_packet pushback life_gear;
		_packet pushback CASH;
		_packet pushback getPosATL player;
		_packet pushback life_is_alive;
	};
	////////level
	case 11: {
		_profs = [];
		_SkillConfigs = "_flag in getArray(_x >> 'side')" configClasses (missionConfigFile >> "profession");
		{
				_data = SKILLSYSTEM_VALUE(configName _x,_flag);
				_profs pushBack [configName _x,_data select 0,_data select 1,_flag];
		} foreach _SkillConfigs;
		
		_packet pushback _profs;
	}; 
	// platzhalter
	case 12: 
	{
		
	};
	// platzhalter
	case 13: 
	{
		 
	};
	////////kohle & pos & alive
	case 14: 
	{
		_packet pushback CASH;
		_packet pushback getPosATL player;
		_packet pushback life_is_alive;
	};
	////////bank & pos & alive
	case 15: 
	{
		_packet pushback BANK;
		_packet pushback getPosATL player;
		_packet pushback life_is_alive;
	};
	////////cash & bank & pos & alive
	case 16: 
	{
		_packet pushback CASH;
		_packet pushback BANK;
		_packet pushback getPosATL player;
		_packet pushback life_is_alive;
	};
};

_packet remoteExecCall ["DB_fnc_updatePartial",RSERV];

