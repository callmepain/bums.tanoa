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
if !([_conditions] call life_fnc_levelCheck) exitWith {[(format [localize "STR_Shop_Veh_NotAllowed"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  createDialog "Life_Vehicle_Shop_v2_3D";
} else {
  createDialog "Life_Vehicle_Shop_v2";
};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];


_display = findDisplay 2300;
_Btn1 = _display displayCtrl 1005;
_Btn2 = _display displayCtrl 1006;
_Btn3 = _display displayCtrl 1007;
_Btn4 = _display displayCtrl 1008;

_Btn1 ctrlSetStructuredText parseText "<t align='center' size='0.85' font ='PuristaBold'>Schließen</t>";
_Btn2 ctrlSetStructuredText parseText "<t align='center' size='0.85' font ='PuristaBold'>Mieten</t>";
_Btn3 ctrlSetStructuredText parseText "<t align='center' size='0.85' font ='PuristaBold'>Kaufen ohne Versicherung</t>";
_Btn4 ctrlSetStructuredText parseText "<t align='center' size='0.85' font ='PuristaBold'>Kaufen inkl. Versicherung</t>";



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

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  [] call life_fnc_vehicleShopInit3DPreview;
};

((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
