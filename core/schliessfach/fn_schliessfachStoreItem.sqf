#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	EDIT by H4uklotz
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_anzahlItemFrei"];
disableSerialization;
_state = [_this,0,false] call bis_fnc_param;
_ctrl = ctrlSelData(4503);

_weight = life_schliessfach getVariable["schliessfach_groesse",0];
_sfnow = format["Stufe%1",_weight];
_sfCfg = missionConfigFile >> "schliessfach" >> _sfnow;
_sfnext = getText(_sfCfg >> "next");
_sfgroesse = getNumber(_sfCfg >> "groesse");
_mWeight = _sfgroesse;

_totalWeight = [_mWeight,(life_schliessfach getVariable["schliessfach",[[],0]]) select 1];
_veh_data = life_schliessfach getVariable ["schliessfach",[[],0]];
_inv = _veh_data select 0;

if(_state) then
{
   _val = ITEM_VALUE(_ctrl);
	_anzahlItemFrei = 0;
	_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _val;
	
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) then 
	{
			_gewichtfrei = (_totalWeight select 0) - (_totalWeight select 1);
		_anzahlItemFrei = floor (_gewichtfrei / ([_ctrl] call life_fnc_itemWeight));
	}
	else
	{
		_anzahlItemFrei = _val;
	};
		
	if(!([false,_ctrl,_anzahlItemFrei] call life_fnc_handleInv)) exitWith {["Es ist ein Fehler aufgetreten, du kannst den Gegenstand nicht aus deinem Inventar entfernen.","Fehler","red"] call MSG_fnc_handle};
	_index = [_ctrl,_inv] call TON_fnc_index;

	
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_anzahlItemFrei];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _anzahlItemFrei]];
	};
	
	life_schliessfach setVariable["schliessfach",[_inv,1],true];
	[life_schliessfach] call life_fnc_schliessfachUpdateWeight;
	[life_schliessfach] call life_fnc_schliessfachInventory;
}
else
{
	_num = ctrlText 4506;
	if(!([_num] call fnc_isnumber)) exitWith {["Du musst eine Zahl eingeben.","Hinweis","yellow"] call MSG_fnc_handle};
	_num = parseNumber(_num);
	if(_num < 1) exitWith {["Der Wert kann nicht 0 sein!","Hinweis","yellow"] call MSG_fnc_handle};
	
	_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {["Nicht genug Platz vorhanden!","Hinweis","yellow"] call MSG_fnc_handle};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {["Es ist ein Fehler aufgetreten, du kannst den Gegenstand nicht aus deinem Inventar entfernen.","Fehler","red"] call MSG_fnc_handle};
	_index = [_ctrl,_inv] call TON_fnc_index;

	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	life_schliessfach setVariable["schliessfach",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_schliessfach] call life_fnc_schliessfachInventory;
};
