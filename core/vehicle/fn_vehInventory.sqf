#include "..\..\script_macros.hpp"
/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh","_tInv","_pInv","_veh_data"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh OR !alive _veh) exitWith {closeDialog 0;diag_log "veh is dead"}; //If null / dead exit menu
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;
_display = findDisplay 3500;
_Titel = _display displayCtrl 1100;
lbClear _tInv;
lbClear _pInv;

switch(true)do
{
	case (typeOf _vehicle in life_Container):
	{
		_veh_data = [_veh] call life_fnc_vehicleWeight;
	};
	case (_veh isKindOf "House_F"):
	{
		private["_mWeight"];
		_mWeight = 0;
		{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh getVariable["containers",[]]);
		_veh_data = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
	};
	default
	{
		_veh_data = [_veh] call life_fnc_vehicleWeight;
	};
};

if ((_veh_data select 0) isEqualTo -1) exitWith {closeDialog 0};

ctrlSetText[3504,format ["Platz: %1/%2",(_veh_data select 1),(_veh_data select 0)]];
_Titel ctrlSetStructuredText parseText format["<t align='center'>Kofferraum</t><t align='right'>%1: %2/%3</t>",(localize "STR_MISC_Weight"),_veh_data select 1,_veh_data select 0];
_data = _veh getVariable ["Trunk",[]];
if (count _data isEqualTo 0) then {_veh setVariable ["Trunk",[[],0],true]; _data = [];} else {_data = (_data select 0);};
//Player Inventory Items
{
    _val = ITEM_VALUE(configName _x);

    if (_val > 0) then {
        _pInv lbAdd format ["%1x - %2",_val,localize (getText(_x >> "displayName"))];
        _pInv lbSetData [(lbSize _pInv)-1,configName _x];
        _icon = (getText(_x >> "icon"));
        if (!(_icon isEqualTo "")) then {
            _pInv lbSetPicture [(lbSize _pInv)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

//Trunk Inventory Items
{
    _name = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
    _val = (_x select 1);

    if (_val > 0) then {
        _tInv lbAdd format ["%1x - %2",_val,localize _name];
        _tInv lbSetData [(lbSize _tInv)-1,(_x select 0)];
        _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
        if (!(_icon isEqualTo "")) then {
            _tInv lbSetPicture [(lbSize _tInv)-1,_icon];
        };
    };
} forEach _data;