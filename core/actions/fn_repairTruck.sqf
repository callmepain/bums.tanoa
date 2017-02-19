#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private ["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];
_veh = cursorObject;
_prof = "reparieren";
_cardmgbefore = [];
_cardmgafter = [];
_carmotordmg = 0;
_carrep = 0.85;
life_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
    if (life_inv_toolkit > 0) then {
        life_action_inUse = true;
        _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        _upp = format [localize "STR_NOTF_Repairing",_displayName];
		for "_i" from 0 to 22 do { 
			if(!isnil {_veh GetHitIndex _i} ) then {
				_cardmgbefore pushback [_veh GetHitIndex _i]; 
			};
		};
		_carmotordmg = _veh getHitPointDamage "hitEngine";
        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;
		_cpUp = 0.01;
		_time = 0.3;
		_data  = SKILLSYSTEM_VALUE(_prof,"civ");
		if( _prof != "" ) then {
			MININGTIME(_time,(_data select 0));
			PROCESSCP(_cpUp,(_data select 0));
			CARREP(_carrep,(_data select 0));
		};
        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep _time;
            _cP = _cP + _cpUp;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if !(isNull objectParent player) exitWith {};
            if (life_interrupted) exitWith {};
        };
		{  
			if ((_x select 0) > _carrep) then {  
				_cardmgafter pushback [_carrep]; 
			} else { 
				_cardmgafter pushback _x 
			};  
		}foreach _cardmgbefore;
        life_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
        if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

        _sideRepairArray = LIFE_SETTINGS(getArray,"vehicle_infiniteRepair");
		_ran = floor(70/(_data select 0));
        //Check if playerSide has infinite repair enabled
        if (playerSide isEqualTo civilian && (_sideRepairArray select 0) isEqualTo 0) then {
			if (floor(random(_ran)) != 1) then {
				[false,"toolkit",1] call life_fnc_handleInv;
			};
        };
        if (playerSide isEqualTo west && (_sideRepairArray select 1) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide isEqualTo independent && (_sideRepairArray select 2) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide isEqualTo east && (_sideRepairArray select 3) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
		if !(playerSide isEqualTo east)  then {
		/*	_indexcount = count _cardmgafter;
			for "_i" from 0 to _indexcount-1 do {  
				_veh SetHitIndex [_i,(_cardmgafter select _i select 0)];  
			};
			if ((east countSide playableUnits) > 0) then {
				_veh setHitPointDamage ["hitEngine",_carmotordmg];
			};*/
			//[_veh,_carrep] remoteExec ["TON_fnc_repairCar",-2];
			[_veh, _carrep] call life_fnc_setHitIndex;
		} else {
			_veh setDamage 0;
		};
        titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		if( _prof != "" ) then 
		{ 
			[_prof,M_CONFIG(getNumber,"profession",_prof,"baseEXPgain")] call life_fnc_addExp;
		};
    };
};
