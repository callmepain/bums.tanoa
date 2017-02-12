#include "..\..\script_macros.hpp"
/*
    File: fn_updateRequest.sqf
    Author: Tonic
	Edit by H4uklotz
	
    Description:
    Passes ALL player information to the server to save player data to the database.
*/
private ["_packet","_array","_flag","_alive","_position","_profs"];
_packet = [getPlayerUID player,player,(profileName),playerSide,CASH,BANK];
_array = [];
_profs = [];
_flag = switch (playerSide) do 
{
	case west: {"cop"}; 
	case civilian: {"civ"}; 
	case independent: {"med"};
	case east: {"adac"};
};


{
    _varName = LICENSE_VARNAME(configName _x,_flag);
    _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_packet pushBack life_is_arrested;
_packet pushBack life_is_alive;
_packet pushBack (getPosATL player);
_SkillConfigs = "_flag in getArray(_x >> 'side') "configClasses (missionConfigFile >> "profession");
{
		_data = SKILLSYSTEM_VALUE(configName _x,_flag);
		_profs pushBack [configName _x,_data select 0,_data select 1,_flag];
} forEach _SkillConfigs;

_packet pushback _profs;

if (life_HC_isActive) then {
    _packet remoteExecCall ["HC_fnc_updateRequest",HC_Life];
} else {
    _packet remoteExecCall ["DB_fnc_updateRequest",RSERV];
};