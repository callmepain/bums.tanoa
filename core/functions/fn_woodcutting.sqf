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
_wood = ["t_ficus_medium_f.p3d","t_cocosnucifera3s_tall_f.p3d","t_ficus_small_f.p3d","t_cyathea_f.p3d","t_inocarpus_f.p3d","t_palaquium_f.p3d",
"t_leucaena_f.p3d","t_albizia_f.p3d","t_agathis_wide_f.p3d","t_cocosnucifera2s_small_f.p3d"];
if (life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
 if (life_inv_axe < 1) exitWith { [(format [localize "STR_NOTF_Axe"]),"Hinweis","Red"] call MSG_fnc_handle; };
_amount = floor((random(_maxGather)+1)*_mining);
_diff = [_mined,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
	[localize "STR_NOTF_InvFull","Hinweis","Red"] call MSG_fnc_handle;
    life_action_inUse = false;
};
if (((getModelInfo _curObject) select 0) in _wood) then {
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
		hideObjectGlobal _curObject;
		/////////SkillSystem/////////
		if( _prof != "" ) then { 
			_exp = _diff * M_CONFIG(getNumber,"profession","Rohstoffabbau","baseEXPgain");
			[_prof,_exp] call life_fnc_addExp;
		};
	};	
};