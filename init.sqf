/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
#include "\task_force_radio\functions\common.sqf";
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";

[] execvm "core\functions\fn_effects.sqf";

_handle = [] spawn life_fnc_mapmarker;
waitUntil {scriptDone _handle};
if ((isServer) or (isDedicated)) then {
 //TFAR ==============================
    TF_terrain_interception_coefficient = 1; //Interferenzen durch Gelände.
    publicVariable "TF_terrain_interception_coefficient";
 
    TF_give_microdagr_to_soldier = false; //MicroDagr an Schützen austeilen? - ja ^ nein
    publicVariable "TF_give_microdagr_to_soldier";
 
    tf_give_personal_radio_to_regular_soldier = false; //Personal Radio an normalen Schützen austeilen? - ja ^ nein
    publicVariable "tf_give_personal_radio_to_regular_soldier";
 
    tf_no_auto_long_range_radio = true; //Long Range Radio an GrpFhr austeilen? - ja ^ nein
    publicVariable "tf_no_auto_long_range_radio";
 
    tf_same_sw_frequencies_for_side = true; //Selbe Freuquenzen für Fraktion? - ja ^ nein
    publicVariable "tf_same_sw_frequencies_for_side";
	
	tf_same_lr_frequencies_for_side = true;
	publicVariable "tf_same_lr_frequencies_for_side";
	
	TF_defaultGuerBackpack = "tf_anprc155";
	TF_defaultGuerPersonalRadio = "tf_anprc148jem";
	TF_defaultWestBackpack = "tf_anprc155";
	TF_defaultWestPersonalRadio = "tf_anprc148jem";
	TF_defaultEastBackpack = "tf_anprc155";
	TF_defaultEastPersonalRadio = "tf_anprc148jem";
	publicVariable "TF_defaultGuerBackpack";
	publicVariable "TF_defaultGuerPersonalRadio";
	publicVariable "TF_defaultWestBackpack";
	publicVariable "TF_defaultWestPersonalRadio";
	publicVariable "TF_defaultEastBackpack";
	publicVariable "TF_defaultEastPersonalRadio";
	
    _settingsSwWest = false call TFAR_fnc_generateSwSettings; //SW Freuquenzen voreinstellen.
    _settingsSwWest set [2, ["317.6","312.3","313.2","314.4","315.7","316.3","317.5","318.1"]];
    tf_freq_west = _settingsSwWest;
    publicVariable "tf_freq_west";
 
    _settingsLRWest = false call TFAR_fnc_generateLRSettings; //LR Freuquenzen voreinstellen.
    _settingsLRWest set [2, ["50.9","51.5","52.3","53.9","54.7","55.4","56.8","57.2"]];
    tf_freq_west_lr = _settingsLRWest;
    publicVariable "tf_freq_west_lr";
	
	_settingsSweast = false call TFAR_fnc_generateSwSettings; //SW Freuquenzen voreinstellen.
    _settingsSweast set [2, ["214.2","225.3","238.6","242.9","257.7","266.4","274.9","281.2"]];
    tf_freq_east = _settingsSweast;
    publicVariable "tf_freq_east";
 
    _settingsLReast = false call TFAR_fnc_generateLRSettings; //LR Freuquenzen voreinstellen.
    _settingsLReast set [2, ["60.4","61.8","62.3","63.9","64.5","65.7","66.3","67.2"]];
    tf_freq_east_lr = _settingsLReast;
    publicVariable "tf_freq_east_lr";
	
	_settingsSwguer = false call TFAR_fnc_generateSwSettings; //SW Freuquenzen voreinstellen.
    _settingsSwguer set [2, ["411.7","412.2","413.3","414.9","415.7","416.3","417.9","418.4"]];
    tf_freq_guer = _settingsSwguer;
    publicVariable "tf_freq_guer";
 
    _settingsLRguer = false call TFAR_fnc_generateLRSettings; //LR Freuquenzen voreinstellen.
    _settingsLRguer set [2, ["40.3","41.7","42.4","43.1","44.8","45.5","46.4","47.8"]];
    tf_freq_guer_lr = _settingsLRguer;
    publicVariable "tf_freq_guer_lr";
 
 };
 
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