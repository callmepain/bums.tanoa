#include "..\..\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private ["_vault","_handle","_bankindex","_time"];
_vault = param [0,ObjNull,[ObjNull]];
_door = 0;
_banks = [];
_hacked = 0;
for "_i" from 1 to 3 do {
	_banks pushback (getmarkerpos format["fed_bank_nr_%1",_i]);
};
{
	if(((getpos player) distance _x) < 10) exitwith {_bankindex	= _forEachIndex +1;}; 
} foreach _banks;
if (isNil "_bankindex") exitwith {};
_bankname = switch (_bankindex) do {
	case 1: {"Georgetown";};
	case 2: {"La Rochelle";};
	case 3: {"Lijnhaven";};
};
if (isNull _vault) exitWith {}; //Bad object
private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_CommonwealthBank"]]] call TON_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [5702.71,10269.7];

private _pos = _banks select _bankindex;

if (typeOf _vault != "Land_CommonwealthBank") exitWith {[(localize "STR_ISTR_Blast_VaultOnly"),"Hinweis","Red"] call MSG_fnc_handle;};
if (_vault getVariable ["chargeplaced",false]) exitWith {[(localize "STR_ISTR_Blast_AlreadyPlaced"),"Hinweis","Red"] call MSG_fnc_handle;};
if (_vault getVariable ["safe_open",false]) exitWith {[(localize "STR_ISTR_Blast_AlreadyOpen"),"Hinweis","Red"] call MSG_fnc_handle;};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
     hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
};
_selPos = _vault selectionPosition "Vault_Interact";
_worldSpace = _vault modelToWorld _selPos;
if (player distance _worldSpace < 2) then {_door = 1;};
if (_door isEqualTo 0) exitWith {[(localize "STR_Cop_NotaDoor"),"Hinweis","Red"] call MSG_fnc_handle;}; //Not near a door to be broken into.
if ((_vault getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {[(localize "STR_House_Raid_DoorUnlocked"),"Hinweis","Red"] call MSG_fnc_handle;};

[[1,2],format["Jemand bricht in die Bank von %1 ein!",_bankname],false,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];


if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

if (_bankindex isEqualTo 1) then {
	fed_bank_1 setVariable ["chargeplaced",true,true];
	_hacked = fed_bank_1 getVariable ["hacked",0];
};
if (_bankindex isEqualTo 2) then {
	fed_bank_2 setVariable ["chargeplaced",true,true];
	_hacked = fed_bank_2 getVariable ["hacked",0];
};
if (_bankindex isEqualTo 3) then {
	fed_bank_3 setVariable ["chargeplaced",true,true];
	_hacked = fed_bank_3 getVariable ["hacked",0];
};
//hint localize "STR_ISTR_Blast_KeepOff";
[(localize "STR_ISTR_Blast_KeepOff"),"Überfall","Green"] call MSG_fnc_handle;
[_worldSpace] remoteExec ["life_fnc_demoChargeTimer",[west,player]];
[_worldSpace,_hacked] remoteExec ["TON_fnc_handleBlastingCharge",2];
if (_hacked isEqualTo 0) then {
	[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];
} else {
	if (_hacked < 10) exitWith {_time = time + ((1 * 60)*1.25);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 20) exitWith {_time = time + ((1 * 60)*1.5);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 30) exitWith {_time = time + ((1 * 60)*1.75);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 40) exitWith {_time = time + ((1 * 60)*2);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 50) exitWith {_time = time + ((1 * 60)*2.25);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 60) exitWith {_time = time + ((1 * 60)*2.5);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 70) exitWith {_time = time + ((1 * 60)*2.75);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 80) exitWith {_time = time + ((1 * 60)*3);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked < 90) exitWith {_time = time + ((1 * 60)*3.25);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
	if (_hacked > 90) exitWith {_time = time + ((1 * 60)*3.5);waitUntil{(round(_time - time) < 1)};[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];};
};