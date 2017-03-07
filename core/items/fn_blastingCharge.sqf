#include "..\..\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private ["_vault","_handle","_bankindex"];
_vault = param [0,ObjNull,[ObjNull]];
_door = 0;
_banks = [];
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
//private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;
private _pos = _banks select _bankindex;
//if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (typeOf _vault != "Land_CommonwealthBank") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (_vault getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if (_vault getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
     hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
};
_selPos = _vault selectionPosition "Vault_Interact";
_worldSpace = _vault modelToWorld _selPos;
if (player distance _worldSpace < 2) then {_door = 1;};
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if ((_vault getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

[[1,2],format["Jemand bricht in die Bank von %1 ein!",_bankname],false,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];


//private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
//private _tanoaArray = [11074.2,11501.5,0.00137329];

//if ((nearestObject [_pos,_vaultHouse]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Blast_Exploit"};
if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
//_vault setVariable ["chargeplaced",true,true];
if (_bankindex isEqualTo 1) then {
	fed_bank_1 setVariable ["chargeplaced",true,true];
};
if (_bankindex isEqualTo 2) then {
	fed_bank_2 setVariable ["chargeplaced",true,true];
};
if (_bankindex isEqualTo 3) then {
	fed_bank_3 setVariable ["chargeplaced",true,true];
};
[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];
//hint localize "STR_ISTR_Blast_KeepOff";
[_worldSpace] remoteExec ["life_fnc_demoChargeTimer",[west,player]];
[_worldSpace] remoteExec ["TON_fnc_handleBlastingCharge",2];
