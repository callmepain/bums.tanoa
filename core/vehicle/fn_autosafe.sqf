#include "..\..\script_macros.hpp"
/*
    File: fn_autosafe.sqf
    Author: H4uklotz

    Description:
    Speichert Fahrzeugwerte.
*/
private ["_veh"];
if(isDedicated) exitWith {};
_veh = (driver vehicle player);


waitUntil{life_autosafe};

If (_veh isEqualto player) exitWith {life_autosafe = false;};
if !(alive _veh) exitWith {};

[_veh]remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];
systemChat "fahrzeug gespeichert";
life_autosafe = false;