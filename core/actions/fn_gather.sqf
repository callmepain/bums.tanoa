#include "..\..\script_macros.hpp"
/*
    File: fn_gather.sqf
    Author: Devilfloh

    Description:
    Main functionality for gathering.
*/
private ["_maxGather","_resource","_amount","_maxGather","_requiredItem"];
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {[(format [localize "STR_NOTF_isrestrained"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (player getVariable "playerSurrender") exitWith {[(format [localize "STR_NOTF_surrender"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

life_action_inUse = true;
_zone = "";
_zonename = "";
_requiredItem = "";
_exit = false;
_prof = "Ernten";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";

for "_i" from 0 to count(_resourceCfg)-1 do {

    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
	_conditions = getText(_curConfig >> "conditions");
    _requiredItem = getText(_curConfig >> "item");
    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
			_zone = _x;
			_zonename = _resource;
		};
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {life_action_inUse = false;};

_time = 0.5;
_mining = 1;
_data  = SKILLSYSTEM_VALUE(_prof,"civ");
if( _prof != "" ) then {
	MININGMULTI(_mining,(_data select 0));
	MININGTIME(_time,(_data select 0));
}; 
_levelreg = missionConfigFile >> "CfgGather" >> "Resources" >> _zonename;
_levelneed = getNumber(_levelreg >> "level");
if(_levelneed > (_data select 0)) then {
	[(format ["Du hast nicht das benötigte Level um hier Abzubauen!<br/> Du benötigst Ernten Level:%1",_levelneed]),"Fehler","red"] call MSG_fnc_handle;
	_exit = true;
};

if (_exit) exitWith {life_action_inUse = false;};

_amount = floor((random(_maxGather)+1)*_mining);
_diff = [_resource,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if (_diff isEqualTo 0) exitWith {
    [localize "STR_NOTF_InvFull","Hinweis","Yellow"] call MSG_fnc_handle;

    life_action_inUse = false;
};

switch (_requiredItem) do {
    case "pickaxe": {player say3D "mining";};
    default {player say3D "harvest";};
};

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    sleep _time;
};

if ([true,_resource,_diff] call life_fnc_handleInv) then {
    _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
    [(format [localize "STR_NOTF_Gather_Success",(localize _itemName),_diff]),"Hinweis","Green"] call MSG_fnc_handle;
};
/////////SkillSystem/////////
if( _prof != "" ) then { 
	_exp = _diff * M_CONFIG(getNumber,"profession",_prof,"baseEXPgain");
	[_prof,_exp] call life_fnc_addExp;
};
sleep 1;
life_action_inUse = false;