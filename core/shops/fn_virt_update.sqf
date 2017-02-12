#include "..\..\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Update and fill the virtual shop menu.
*/
private ["_item_list","_gear_list","_shopItems","_name","_price"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_Titel = _display displayCtrl 1100;
_Shop = _display displayCtrl 1101;
_Player = _display displayCtrl 1102;

_Btn1 = _display displayCtrl 2406;
_Btn2 = _display displayCtrl 2407;
_Btn3 = _display displayCtrl 2408;

_item_list = CONTROL(2400,2401);
_gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hint localize "STR_NOTF_ConfigDoesNotExist";}; //Make sure the entry exists..

_shopItems = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");

_Titel ctrlSetStructuredText parseText format["<t align='center'>%1</t><t align='right'>Bargeld: $%2</t>",localize (M_CONFIG(getText,"VirtualShops",life_shop_type,"name")),[CASH] call life_fnc_numberText];
_Shop ctrlSetStructuredText parseText "<t align='center'>Shopangebot</t>";
_Player ctrlSetStructuredText parseText "<t align='center'>Spielerinventar</t>";


_Btn1 ctrlSetStructuredText parseText "Kaufen";
_Btn2 ctrlSetStructuredText parseText "ausgewählte Verkaufen";
_Btn3 ctrlSetStructuredText parseText "alles ausgewählte Verkaufen";



{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    _price = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
    if (!(_price isEqualTo -1)) then {
        _item_list lbAdd format ["%1  ($%2)",(localize _displayName),[_price] call life_fnc_numberText];
        _item_list lbSetData [(lbSize _item_list)-1,_x];
        _item_list lbSetValue [(lbSize _item_list)-1,_price];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _item_list lbSetPicture [(lbSize _item_list)-1,_icon];
        };
    };
} forEach _shopItems;

{
    _name = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    _val = ITEM_VALUE(_x);

    if (_val > 0) then {
        _gear_list lbAdd format ["%1x - %2 ",_val,(localize _name)];
        _gear_list lbSetData [(lbSize _gear_list)-1,_x];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
        };
    };
} forEach _shopItems;
