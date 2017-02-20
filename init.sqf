/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";

[] execvm "core\functions\fn_effects.sqf";
[] execVM "core\mapmarker.sqf"; 
_igiload = execVM "core\functions\IgiLoad\IgiLoadInit.sqf";
StartProgress = true;

life_fnc_setHitIndex = {
    private ["_veh","_fuel"];
    _veh = _this select 0;
    _fuel = _this select 1;
    if (local _veh) then {
      //  _veh setFuel _fuel;
		_cardmgbefore = [];
		_cardmgafter = [];
		_carmotordmg = 0;
		_carrep = 0.85;
		_carrep = _fuel;

		for "_i" from 0 to 22 do { 
			if(!isnil {_veh GetHitIndex _i} ) then {
				_cardmgbefore pushback [_veh GetHitIndex _i]; 
			};
		};

		{  
			if ((_x select 0) > _carrep) then {  
				_cardmgafter pushback [_carrep]; 
			} else { 
				_cardmgafter pushback _x 
			};  
		}foreach _cardmgbefore;
		_carmotordmg = _veh getHitPointDamage "hitEngine";
		_indexcount = count _cardmgafter;
		for "_i" from 0 to _indexcount-1 do {  
			_veh SetHitIndex [_i,(_cardmgafter select _i select 0)];  
		};
		if ((east countSide playableUnits) > 0) then {
			_veh setHitPointDamage ["hitEngine",_carmotordmg];
		};
    } else {
        PVsetFuel = _this;
        publicVariable "PVsetFuel";
    };
};
"PVsetFuel" addPublicVariableEventHandler {
    _veh = _this select 1 select 0;
    _fuel = _this select 1 select 1;
    if (local _veh) then {
        //_veh setFuel _fuel;
		_cardmgbefore = [];
		_cardmgafter = [];
		_carmotordmg = 0;
		_carrep = 0.85;
		_carrep = _fuel;

		for "_i" from 0 to 22 do { 
			if(!isnil {_veh GetHitIndex _i} ) then {
				_cardmgbefore pushback [_veh GetHitIndex _i]; 
			};
		};

		{  
			if ((_x select 0) > _carrep) then {  
				_cardmgafter pushback [_carrep]; 
			} else { 
				_cardmgafter pushback _x 
			};  
		}foreach _cardmgbefore;
		_carmotordmg = _veh getHitPointDamage "hitEngine";
		_indexcount = count _cardmgafter;
		for "_i" from 0 to _indexcount-1 do {  
			_veh SetHitIndex [_i,(_cardmgafter select _i select 0)];  
		};
		if ((east countSide playableUnits) > 0) then {
			_veh setHitPointDamage ["hitEngine",_carmotordmg];
		};
    };
};