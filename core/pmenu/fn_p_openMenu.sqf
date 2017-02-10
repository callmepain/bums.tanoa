#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch (playerSide) do {
    case west: {
        ctrlShow[1209,false];
        ctrlShow[1207,false];
        ctrlShow[980022,false];
        ctrlShow[980021,false];
		
    };

    case civilian: {
        ctrlShow[2008,false];
    };

    case independent: {
        ctrlShow[2008,false];
        ctrlShow[1209,false];
        ctrlShow[1207,false];
    };
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;
