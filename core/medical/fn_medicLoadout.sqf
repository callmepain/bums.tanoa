#include "..\..\script_macros.hpp"
/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the medic out with the default gear.
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
player addItemToBackpack "ACE_elasticBandage";
player addItemToBackpack "ACE_elasticBandage";
player addItemToBackpack "ACE_elasticBandage";
player addItemToBackpack "ACE_packingBandage";
player addItemToBackpack "ACE_packingBandage";
player addItemToBackpack "ACE_packingBandage";
player addItemToBackpack "ACE_bloodIV_500";
player addItemToBackpack "ACE_fieldDressing";
player addItemToBackpack "ACE_fieldDressing";
player addItemToBackpack "ACE_fieldDressing";
player addItemToBackpack "ACE_morphine";
player addItemToBackpack "ACE_morphine";
player addItemToBackpack "ACE_morphine";
player addItemToBackpack "ACE_epinephrine";
player addItemToBackpack "ACE_epinephrine";
player addItemToBackpack "ACE_epinephrine";
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_surgicalKit";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
