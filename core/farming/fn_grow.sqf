#include "..\..\script_macros.hpp"
/*
	File: fn_gather.sqf
	Author: Arma 3 Life [www.arma3-life.com/]
	
	Description:
	Main functionality for gathering.
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_seeds","_maxGather","_resource","_amount","_maxGather","_requiredItem"];

life_action_inUse = true;
_zone = "";
_zonename = "";
_requiredItem = "";
_exit = false;
_prof = "Ernten";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Farming";

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
    [localize "STR_NOTF_InvFull","Hinweis","red"] call MSG_fnc_handle;

    life_action_inUse = false;
};
//gather check??
if(vehicle player != player) exitWith {[localize "STR_NOTF_GatherVeh","Hinweis","red"] call MSG_fnc_handle;};

_plantnearby = false;

_plantclsnamearr = [
"A3L_Wheat",
"A3L_Corn",
"A3L_Beans",
"A3L_Cannabis",
"A3L_Cotton",
"Ficus_Bush_1",
"A3L_Pumpkin",
"A3L_Sunflower",
"Oleander2"
];

{
_objectarr = nearestObjects [player, [_x], 1];
 if (count _objectarr == 0) then {} else {_plantnearby = true;};
} foreach _plantclsnamearr;

if (_plantnearby) then {
	["Zu dicht an anderer Pflanze","Hinweis","red"] call MSG_fnc_handle;
	life_action_inUse = false;
} else {
	if(!([false,_requiredItem,1] call life_fnc_handleInv)) exitWith {
		["Du brauchst Samen vom Farmmarkt","Hinweis","red"] call MSG_fnc_handle;
		life_action_inUse = false;
	};
	_plantedtext = format["Du hast %1 angebaut",_resource];
	[_plantedtext,"Hinweis","green"] call MSG_fnc_handle;
	[player,_resource] remoteExec ["TON_fnc_plantseed",0];
	life_action_inUse = false;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
};
/////////SkillSystem/////////
if( _prof != "" ) then { 
	_exp = _diff * M_CONFIG(getNumber,"profession",_prof,"baseEXPgain");
	[_prof,_exp] call life_fnc_addExp;
};
/*

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

*/

