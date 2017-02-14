#include "..\..\script_macros.hpp"
/*
    File: fn_adacLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the adac out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_Rangemaster";
player addBackpack "tf_anprc155";
player linkItem "ItemMap";
player linkItem "tf_anprc148jem";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
