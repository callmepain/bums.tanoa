#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/

(_this select 3) params [
    ["_shop","",[""]],
    ["_sideCheck",sideUnknown,[civilian]],
    ["_spawnPoints","",["",[]]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];

disableSerialization;

//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};
if (!(_sideCheck isEqualTo sideUnknown) && {!(playerSide isEqualTo _sideCheck)}) exitWith {[(format [localize "STR_Shop_Veh_NotAllowed"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

private _conditions = M_CONFIG(getText,"CarShops",_shop,"conditions");
private _shopTitle = M_CONFIG(getText,"CarShops",_shop,"shopTitle");
if !([_conditions] call life_fnc_levelCheck) exitWith {[(format [localize "STR_Shop_Veh_NotAllowed"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  createDialog "Life_Vehicle_Shop_v2_3D";
} else {
  createDialog "Life_Vehicle_Shop_v2";
};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.


_display = findDisplay 2300;
_titel = _display displayCtrl 1002;
_liste = _display displayCtrl 1003;
_info  = _display displayCtrl 1004;
_Btn1 = _display displayCtrl 1005;
_Btn2 = _display displayCtrl 1006;
_Btn3 = _display displayCtrl 1007;
_Btn4 = _display displayCtrl 1008;

// _titel ctrlSetStructuredText parseText format["%1",_shopTitle];


_titel ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_shopTitle];
_liste ctrlSetStructuredText parseText "<t align='center'>verfügbare Fahrzeuge</t>";
_info ctrlSetStructuredText parseText "<t align='center'>Fahrzeuginformationen</t>";
_Btn1 ctrlSetStructuredText parseText "Schließen";
_Btn2 ctrlSetStructuredText parseText "Mieten";
_Btn3 ctrlSetStructuredText parseText "Kaufen ohne Versicherung";
_Btn4 ctrlSetStructuredText parseText "Kaufen inkl. Versicherung";



if (_disableBuy) then {
    //Disable the buy button.
    ctrlEnable [1008,false];
	ctrlEnable [1007,false];
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

private _control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call life_fnc_levelCheck;

    if (_toShow) then {
        _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_forEachIndex];
    };
} forEach _vehicleList;

lbSort _control;

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  [] call life_fnc_vehicleShopInit3DPreview;
};

((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
((findDisplay 2300) displayCtrl 2304) lbSetCurSel 0;
