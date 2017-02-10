#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something
*/

private _shopTitle = M_CONFIG(getText,"WeaponShops",(_this select 3),"name");
private _shopSide = M_CONFIG(getText,"WeaponShops",(_this select 3),"side");
private _conditions = M_CONFIG(getText,"WeaponShops",(_this select 3),"conditions");

private _exit = false;
if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call life_fnc_levelCheck;
if !(_exit) exitWith {hint localize "STR_Shop_Veh_NotAllowed";};

uiNamespace setVariable ["Weapon_Shop",(_this select 3)];
uiNamespace setVariable ["Weapon_Magazine",0];
uiNamespace setVariable ["Weapon_Accessories",0];
uiNamespace setVariable ["Magazine_Array",[]];
uiNamespace setVariable ["Accessories_Array",[]];

if !(createDialog "life_weapon_shop") exitWith {};
if (!isClass(missionConfigFile >> "WeaponShops" >> (_this select 3))) exitWith {}; //Bad config entry.

disableSerialization;


_display = findDisplay 38400;
_Titel = _display displayCtrl 1100;
_itemTitel = _display displayCtrl 1101;
_MagsTitel = _display displayCtrl 1102;
_AccsTitel = _display displayCtrl 1103;
_BuyButton= _display displayCtrl 38406;

_Titel ctrlSetStructuredText parseText format["<t align='center'>Ausrüstungshändler</t>"];
_itemTitel ctrlSetStructuredText parseText format["<t align='center'>Ausrüstung</t>"];
_MagsTitel ctrlSetStructuredText parseText format["<t align='center'>Magazine</t>"];
_AccsTitel ctrlSetStructuredText parseText format["<t align='center'>Zubehör</t>"];
_BuyButton ctrlSetStructuredText parseText format["<t align='center'>Ausrüstung kaufen</t>"];


private _filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

((findDisplay 38400) displayCtrl 1102) ctrlShow false;
((findDisplay 38400) displayCtrl 1103) ctrlShow false;

((findDisplay 38400) displayCtrl 38404) ctrlShow false;
((findDisplay 38400) displayCtrl 38405) ctrlShow false;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;
// ((findDisplay 38400) displayCtrl 38403) lbSetCurSel -1;
