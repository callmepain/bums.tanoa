#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Cop Initialization file.
*/

waitUntil {!(isNull (findDisplay 46))};

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if ((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};


if (life_is_alive) then {
    /* Spawn at our last position */
    player setVehiclePosition [life_position, [], 0, "CAN_COLLIDE"];
} 
else 
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done. 
};


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
life_is_alive = true;
player addRating 9999999;