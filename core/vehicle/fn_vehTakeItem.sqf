#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {[(format [localize "STR_MISC_VehDoesntExist"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {[(format [localize "STR_Global_NoSelection"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_state = [_this,0,false] call bis_fnc_param;
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;

if(!([_num] call TON_TON_fnc_isnumber)) exitWith {[(format [localize "STR_MISC_WrongNumFormat"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_MISC_Under1";};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;



if(_state) then
{
	_num = [_ctrl,_value,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_num == 0) exitWith {[(format [localize "STR_NOTF_InvFull"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
	
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	}
		else
	{
		[(format [localize "STR_NOTF_InvFull"]),"Hinweis","Yellow"] call MSG_fnc_handle;
	};
}

else
{
	if(_num > _value) exitWith {[(format [localize "STR_MISC_NotEnough"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_num == 0) exitWith {[(format [localize "STR_NOTF_InvFull"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	_weight = ([_ctrl] call life_fnc_itemWeight) * _num;

	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	}
		else
	{
		[(format [localize "STR_NOTF_InvFull"]),"Hinweis","Yellow"] call MSG_fnc_handle;
	};
};