#include "..\..\script_macros.hpp"
/*
    File: fn_removeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes the selected item & amount to remove from the players
    virtual inventory.
*/
private ["_data","_value","_obj"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;

if (_data isEqualTo "") exitWith {[localize "STR_NOTF_didNotSelectToRemove","Hinweis","red"] call MSG_fnc_handle;};
if (!([_value] call TON_fnc_isnumber)) exitWith {[localize "STR_NOTF_notNumberFormat","Hinweis","red"] call MSG_fnc_handle;};
if (parseNumber(_value) <= 0) exitWith {[localize "STR_NOTF_enterAmountRemove","Hinweis","red"] call MSG_fnc_handle;};
if (ITEM_ILLEGAL(_data) isEqualTo 1 && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {[localize "STR_NOTF_illegalItemCannotDispose","Hinweis","red"] call MSG_fnc_handle;};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_cannotRemoveInVeh","Hinweis","red"] call MSG_fnc_handle;};
if (!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_couldNotRemoveThatMuch","Hinweis","red"] call MSG_fnc_handle;};

[format [localize "STR_NOTF_removedFromInventory",(parseNumber _value),(localize ITEM_NAME(_data))],"Hinweis","green"] call MSG_fnc_handle;

[] call life_fnc_p_updateMenu;
