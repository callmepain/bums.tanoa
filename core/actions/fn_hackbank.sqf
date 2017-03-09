#include "..\..\script_macros.hpp"
_bankindex = Nil;
_cP = 0.01;
_cpUp = 0.01;
_banks = [];
_hacked = 0;
for "_i" from 1 to 3 do {
	_banks pushback (getmarkerpos format["fed_bank_nr_%1",_i]);
};
{
	if(((getpos player) distance _x) < 20) exitwith {_bankindex	= _forEachIndex +1;}; 
} foreach _banks;
if (isNil "_bankindex") exitwith {};
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%","Hacken..."];
_progress progressSetPosition 0;
for "_i" from 0 to 1 step 0 do {
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.5;
	_cP = _cP + _cpUp;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%","Hacken..."];
	if (_cP >= 1) exitWith {_hacked = floor(random 100)};
	if (!alive player) exitWith {};
	if !(isNull objectParent player) exitWith {};
	if (life_interrupted) exitWith {};
};
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (_bankindex isEqualTo 1) then {
	fed_bank_1 setVariable ["hacked",_hacked,true];
};
if (_bankindex isEqualTo 2) then {
	fed_bank_2 setVariable ["hacked",_hacked,true];
};
if (_bankindex isEqualTo 3) then {
	fed_bank_3 setVariable ["hacked",_hacked,true];
};