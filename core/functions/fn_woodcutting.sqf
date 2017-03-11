#include "..\..\script_macros.hpp"
_curObject = cursorobject;
_maxGather = 2;
_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals" >> "wood";
_resources = getArray(_resourceCfg >> "mined");
_mined = (_resources select 0);
_prof = "Rohstoffabbau";
_time = 0.5;
_mining = 1;
_data  = SKILLSYSTEM_VALUE(_prof,"civ");
if( _prof != "" ) then {
	MININGMULTI(_mining,(_data select 0));
	MININGTIME(_time,(_data select 0));
}; 
if (life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
 if (life_inv_axe < 1) exitWith { [(format [localize "STR_NOTF_Axe"]),"Hinweis","Red"] call MSG_fnc_handle; };
_amount = floor((random(_maxGather)+1)*_mining);
_diff = [_mined,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
	[localize "STR_NOTF_InvFull","Hinweis","Red"] call MSG_fnc_handle;
    life_action_inUse = false;
};
if (((getModelInfo _curObject) select 0) in life_wood) then {
	life_action_inUse = true; 
	[] spawn {
		for "_i" from 0 to 1 do {
			player say3D "axe";
		};
	};
	for "_i" from 0 to 4 do {
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil {
			animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		};
		sleep _time;
	};
	_curObject setdamage 1;
	if ([true, _mined, _diff] call life_fnc_handleInv) exitWith {
		_itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
		[(format [localize "STR_NOTF_Mine_Success", (localize _itemName), _diff]),"Hinweis","Green"] call MSG_fnc_handle;
		for "_z" from 0 to 2 do {
			sleep 1;
		};
		[_curObject] remoteExec ["TON_fnc_remove_tree",2];
		/////////SkillSystem/////////
		if( _prof != "" ) then { 
			_exp = _diff * M_CONFIG(getNumber,"profession","Rohstoffabbau","baseEXPgain");
			[_prof,_exp] call life_fnc_addExp;
		};
	};	
};