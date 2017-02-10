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
_ctrl = ctrlSelData(3503);




//next lines added by preller. fuel storage vehicles only can store fluids
_isTanker = false;
{
	if (life_trunk_vehicle isKindOf _x) then {_isTanker = true;};
} forEach ["C_Van_01_fuel_F","I_Truck_02_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F"];

_isFluid = false;
{
	if (_ctrl == _x) then {_isFluid = true;};
} forEach ["oilu","oilp"];

//check
if (_isTanker && (!_isFluid)) exitWith {["In dem Tanklaster kannst du nur Gefahrstoffe lagern !!!","Hinweiß","yellow"] call MSG_fnc_handle};
if ((!_isTanker) && (_isFluid)) exitWith {["Du kannst Gefahrstoffe nur in einem Tanklaster lagern !!!","Hinweiß","yellow"] call MSG_fnc_handle};



if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};

_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];

_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR typeOf life_trunk_vehicle in life_Container)}) exitWith {["Du kannst das hier nicht einlagern!","Hinweiß","yellow"] call MSG_fnc_handle};

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
	
	life_trunk_vehicle setVariable["Trunk",[_inv,1],true];
	
	[life_trunk_vehicle] call life_fnc_vehicleUpdateTrunkWeight;
	[life_trunk_vehicle] call life_fnc_vehInventory;

}
else
{

	_num = ctrlText 3506;
	if(!([_num] call fnc_isnumber)) exitWith {["Du musst eine Zahl eingeben.","Hinweiß","yellow"] call MSG_fnc_handle};
	_num = parseNumber(_num);
	if(_num < 1) exitWith {["Der Wert kann nicht 0 sein!","Hinweiß","yellow"] call MSG_fnc_handle};
	
	_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {["Nicht genug Platz vorhanden!","Hinweiß","yellow"] call MSG_fnc_handle};

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
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	
	[life_trunk_vehicle] call life_fnc_vehInventory;

};
