#include "..\..\script_macros.hpp"
    /*
        File: fn_mine.sqf
        Author: Devilfloh
        Editor: Dardo

        Description:
        Same as fn_gather,but it allows use of probabilities for mining.
    */
private ["_maxGather", "_resource", "_amount", "_requiredItem", "_mined"];
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {
    [(format [localize "STR_NOTF_isrestrained"]),"Hinweis","Yellow"] call MSG_fnc_handle;
};
_exit = false;
if (player getVariable "playerSurrender") exitWith {
    [(format [localize "STR_NOTF_surrender"]),"Hinweis","Yellow"] call MSG_fnc_handle;
};
life_action_inUse = true;
_zone = "";
_zonename = "";
_requiredItem = "";
_prof = "Rohstoffabbau";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_percent = (floor random 100) + 1; //Make sure it's not 0

for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = _resourceCfg select _i;
    _resources = getArray(_curConfig >> "mined");
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
	_level = getNumber(_curConfig >> "level");
    _mined = "";

    if (_resources isEqualTo []) exitWith {}; //Smart guy :O
    for "_i" from 0 to count (_resources) do {
        if (count _resources isEqualTo 1) exitWith {
            if (!((_resources select 0) isEqualType [])) then {
                _mined = _resources select 0;
            } else {
                _mined = (_resources select 0) select 0;
            };
        };
        _resource = (_resources select _i) select 0;
        _prob = (_resources select _i) select 1;
        _probdiff = (_resources select _i) select 2;
        if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith {
            _mined = _resource;
        };
    };

    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
			_zonename = _mined;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {
    life_action_inUse = false;
};

if (_requiredItem != "") then {
    _valItem = missionNamespace getVariable "life_inv_" + _requiredItem;

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
            case "pickaxe": {
				[(format [localize "STR_NOTF_Pickaxe"]),"Hinweis","Yellow"] call MSG_fnc_handle;
            };
			case "shovel": {
				[(format [localize "STR_NOTF_Shovel"]),"Hinweis","Yellow"] call MSG_fnc_handle;
            };
        };
        life_action_inUse = false;
        _exit = true;
  };
};

_time = 0.5;
_mining = 1;
_data  = SKILLSYSTEM_VALUE(_prof,"civ");
if( _prof != "" ) then {
	MININGMULTI(_mining,(_data select 0));
	MININGTIME(_time,(_data select 0));
}; 
_levelreg = missionConfigFile >> "CfgGather" >> "Minerals" >> _zonename;
_levelneed = getNumber(_levelreg >> "level");
if(_levelneed > _data select 0) then {
	[(format ["Du hast nicht das benötigte Level um hier Abzubauen!<br/> Du benötigst Rohstoffabbau Level:%1",_levelneed]),"Fehler","red"] call MSG_fnc_handle;
	_exit = true;
};

if (_exit) exitWith {
    life_action_inUse = false;
};

_amount = floor((random(_maxGather)+1)*_mining);
_diff = [_mined, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
	[localize "STR_NOTF_InvFull","Hinweis","Yellow"] call MSG_fnc_handle;
    life_action_inUse = false;
};
player say3D "mining";

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    };
    sleep _time;
};

if (([true, _mined, _diff] call life_fnc_handleInv)) then {
    _itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
    [(format [localize "STR_NOTF_Mine_Success", (localize _itemName), _diff]),"Hinweis","Green"] call MSG_fnc_handle;
	
};
/////////SkillSystem/////////
if( _prof != "" ) then { 
	_exp = _diff * M_CONFIG(getNumber,"profession","Rohstoffabbau","baseEXPgain");
	[_prof,_exp] call life_fnc_addExp;
};
sleep 1;
life_action_inUse = false;
