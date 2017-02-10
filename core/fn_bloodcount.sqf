private ["_target","_blood"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_blood = _target getVariable["ACE_medical_bloodVolume",0];
_liter = (_blood * 0.0714285714);
_liter = _liter * 100;
_liter = floor _liter;
_liter = _liter / 100;
_liter;