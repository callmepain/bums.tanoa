#include "..\..\script_macros.hpp"
/*
    File: fn_keyGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a copy of the key for the selected vehicle to the selected player.
    Player must be within range.
*/
private ["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
if ((_list lbData _sel) isEqualTo "") exitWith {[(format [localize "STR_NOTF_didNotSelectVehicle"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

if ((lbCurSel 2702) isEqualTo -1) exitWith {[(format [localize "STR_NOTF_didNotSelectPlayer"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format ["%1", _unit];
if (isNull _unit || isNil "_unit") exitWith {};
if (_unit == player) exitWith {};
_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")
_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if (_index isEqualTo -1) then  {
    _owners pushBack [_uid,_unit getVariable ["realname",name _unit]];
    _vehicle setVariable ["vehicle_info_owners",_owners,true];
};

[(format [localize "STR_NOTF_givenKeysTo",_unit getVariable ["realname",name _unit],_name]),"Hinweis","Green"] call MSG_fnc_handle;
[_vehicle,_unit,profileName] remoteExecCAll ["TON_fnc_clientGetKey",_unit];


