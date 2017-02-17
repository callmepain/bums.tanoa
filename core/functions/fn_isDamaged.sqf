#include "..\..\script_macros.hpp"
/*
*        File: fn_isDamaged.sqf
*        Author: BoGuu
*
*        Description:
*        Returns true if the target is damaged, else returns false.
*/

private ["_damage","_return","_profLevel","_profExp","_data","_side"];
params [
    ["_target",objNull,[objNull]]
];
_carrep = 0.85;
_profName = "Reparieren";
SIDEOFPLAYER(_side);
if !(playerSide isEqualTo east)  then {
_data = SKILLSYSTEM_VALUE(_profName,_side);
_profLevel = _data select 0;
_profExp = _data select 1;
CARREP(_carrep,(_data select 0));

_damage = (getAllHitPointsDamage _target select 2) call BIS_fnc_greatestnum;
_return = ([false,true] select (_damage > _carrep));
} else {
_damage = (getAllHitPointsDamage _target select 2) call BIS_fnc_greatestnum;
_return = ([false,true] select (_damage > 0));
};
_return;