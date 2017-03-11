#include "..\..\script_macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/


private["_type","_index","_price","_var","_amount","_name","_marketprice"];
if((lbCurSel 2402) == -1) exitWith {[(format [localize "Du hast nichts ausgewählt!"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (life_sell_inUse+(2) >= time) exitWith {[(format [localize "Du kannst nur alle %1 Sekunden Items verkaufen!!! Warte noch...",2]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_state = [_this,0,false] call bis_fnc_param;
_type = lbData[2402,(lbCurSel 2402)];

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");

// if(_index == -1) exitWith {hint "Du hast nichts ausgewählt!"};

_drugs = ["marijuana","cocaine_processed","lsd_processed","pilze","heroin_processed"];

_drogen = life_shop_npc getVariable[_type,0]; 

diag_log format["_drogen %1",_drogen];

////Marktsystem Anfang////
_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////


_amount_all = ITEM_VALUE(_type);

_amount = ctrlText 2405;
if (!([_amount] call TON_fnc_isnumber)) exitWith {[(format [localize "STR_Shop_Virt_NoNum"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_amount = parseNumber (_amount);
if (_amount > (ITEM_VALUE(_type))) exitWith {[(format [localize "STR_Shop_Virt_NotEnough"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

	
if(_state) then 
{
	_price = floor(_price * _amount_all);
	// _name = [_var] call life_fnc_vartostr;
	if(_drogen + _test > 200) exitwith {[(format [localize "Da die Nachfrage nach dieser Droge gesunken ist,\n nimmt der Dealer auf unbestimmte Zeit keine mehr an.\nBitte versuch es später erneut."]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	if(([false,_type,_amount_all] call life_fnc_handleInv)) then
	{
		[(format [localize "STR_Shop_Virt_SellItem",_amount_all,localize _name,[_price] call life_fnc_numberText]),"Hinweis","Green"] call MSG_fnc_handle;

		CASH = CASH + _price;
		playSound "caching"; // Sound here
		////Marktsystem Anfang////
		if(_marketprice != -1) then
		{
			[_type, _amount_all] spawn
			{
			// sleep 120;
				[_this select 0,_this select 1] call life_fnc_marketSell;
			};
		};
		////Marktsystem Ende////
		[] call life_fnc_virt_update;
		
		_text = format ["<<<<virt_sell>>>>|%1||%2|>>hat |%3X %4 für %5€ verkauft ",getPlayerUID player,name player,_amount_all,_type,_price];
		// [[0,_text],"TON_fnc_log",false,false] spawn life_fnc_MP;
		
		if(_type in _drugs) then
		{
			life_shop_npc setVariable[_type,_drogen + _amount_all ,true];
		};
		life_sell_inUse = time;
	};
}
else
{
	_price = floor(_price * _amount);
	// _name = [_var] call life_fnc_vartostr;
	if(_drogen + _test > 200) exitwith {[(format [localize "Da die Nachfrage nach dieser Droge gesunken ist,\n nimmt der Dealer auf unbestimmte Zeit keine mehr an.\nBitte versuch es später erneut."]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	if(([false,_type,_amount] call life_fnc_handleInv)) then
	{
		[(format [localize "STR_Shop_Virt_SellItem",_amount,localize _name,[_price] call life_fnc_numberText]),"Hinweis","Green"] call MSG_fnc_handle;
		CASH = CASH + _price;
		playSound "caching"; // Sound here
		if(_marketprice != -1) then
		{
			[_type, _amount] spawn
			{
			sleep 120;
				[_this select 0,_this select 1] call life_fnc_marketSell;
			};
		};	
		////Marktsystem Ende////
		[] call life_fnc_virt_update;

		
		_text = format ["<<<<virt_sell>>>>|%1||%2|>>hat |%3X %4 für %5€ verkauft ",getPlayerUID player,name player,_amount,_type,_price];
		// [[0,_text],"TON_fnc_log",false,false] spawn life_fnc_MP;
		
		if(_type in _drugs) then
		{
			life_shop_npc setVariable[_type,_drogen + _test ,true];
		};
		life_sell_inUse = time;
	};
};

if (life_shop_type isEqualTo "drugdealer") then {
    private ["_array","_ind","_val"];
    _array = life_shop_npc getVariable ["sellers",[]];
    _ind = [getPlayerUID player,_array] call TON_fnc_index;
    if (!(_ind isEqualTo -1)) then {
        _val = ((_array select _ind) select 2);
        _val = _val + _price;
        _array set[_ind,[getPlayerUID player,profileName,_val]];
        life_shop_npc setVariable ["sellers",_array,true];
    } else {
        _array pushBack [getPlayerUID player,profileName,_price];
        life_shop_npc setVariable ["sellers",_array,true];
    };
};

[10] call SOCK_fnc_updatePartial;