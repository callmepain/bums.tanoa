#include "..\..\script_macros.hpp"
/*
    File: fn_arrestAction.sqf
    Author:
	Edit by H4uklotz
	
    Description:
    Arrests the targeted person.
*/
private["_unit","_id","_time","_kaution"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param; 
_kaution = [_this,2,0] call BIS_fnc_param;

if(isNull _unit) exitWith {diag_log "unit is NULL 1"}; //Not valid
if(isNil "_unit") exitwith {diag_log "unit is NIL"}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {diag_log "unit is not a Man"}; //Not a unit
if(!isPlayer _unit) exitWith {diag_log "unit is not Player"}; //Not a human
// if(!(_unit getVariable "verhaftet")) exitWith {diag_log "unit is restrained"}; //He's not restrained.
// if(side _unit == west) exitWith {diag_log "unit is not civ"}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {diag_log "Zeit ist 0"}; //Not Valid


// [[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

 [_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",RSERV];

if(isNull _unit) exitWith {diag_log "unit is NULL 3"}; 
detach _unit;

// [[_unit,false,_time,_kaution],"life_fnc_jail",_unit,false] spawn life_fnc_MP; 
// [[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

[_unit,false,_time,_kaution] remoteExecCall ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

