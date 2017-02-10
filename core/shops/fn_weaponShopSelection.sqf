#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopSelection.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks the weapon & adds the price tag.
*/
private ["_control","_index","_shop","_priceTag","_price","_item","_itemArray","_bool"];
disableSerialization;
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];

if (isNull _control) exitWith {closeDialog 0;}; //Bad data
if (_index isEqualTo -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(38400,38401);
 _magsList = ((findDisplay 38400) displayCtrl 38404);
 _accsList = ((findDisplay 38400) displayCtrl 38405);
 _buysell = ((findDisplay 38400) displayCtrl 38406);
 
lbClear _accsList;
lbClear _magsList;
 
_weapon = lbData[38403,lbCurSel (38403)];
_slotArray = [];
_weaponArray = [];

if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then 
{
	_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","CowsSlot","compatibleItems");
	{
		_weaponArray pushBack _x;
	} forEach _slotArray;
};

if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) then 
{
	_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","MuzzleSlot","compatibleItems");
	{
		_weaponArray pushBack _x;
	} forEach _slotArray;
};
if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")) then 
{
	_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","PointerSlot","compatibleItems");
	{
		_weaponArray pushBack _x;
	} forEach _slotArray;
};
if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then 
{
	_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","UnderBarrelSlot","compatibleItems");
	{
		_weaponArray pushBack _x;
	} forEach _slotArray;
};

_weapon = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
uiNamespace setVariable ["Magazine_Array",_weapon];
uiNamespace setVariable ["Weapon_Magazine",1];
uiNamespace setVariable ["Accessories_Array",_weaponArray];
uiNamespace setVariable ["Weapon_Accessories",1];


if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then 
{
    _item = CONTROL_DATAI(_control,_index);
	_itemsArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
	_magsArray = M_CONFIG(getArray,"WeaponShops",_shop,"mags");
	_accsArray = M_CONFIG(getArray,"WeaponShops",_shop,"accs");
	
	_itemArray = [];
	
	
	{ 
		 if(_item == (_x select 0)) exitwith 
		 { 
				_itemArray = _itemsArray; 
		}; 
	 } forEach (_itemsArray); 
	
	{ 
		 if(_item == (_x select 0)) exitwith 
		 { 
				_itemArray = _magsArray; 
		}; 
	 } forEach (_magsArray); 	
	
	{ 
		 if(_item == (_x select 0)) exitwith 
		 { 
				_itemArray = _accsArray; 
		}; 
	 } forEach (_accsArray); 
	
	_item2 = [_item,_itemArray] call TON_fnc_index;		
    _price = ((_itemArray select _item2) select 3);
    _priceTag ctrlSetStructuredText parseText format ["Verkaufspreis:<br/><t color='#8cff9b'>$%1</t>",[(_price)] call life_fnc_numberText];
	life_shop_item = _item;
	life_shop_preis = _price;
    _buysell buttonSetAction "[life_shop_preis,life_shop_item,1] spawn life_fnc_weaponShopBuySell;";
} 
else 
{

	((findDisplay 38400) displayCtrl 1102) ctrlShow false;
	((findDisplay 38400) displayCtrl 1103) ctrlShow false;

	((findDisplay 38400) displayCtrl 38404) ctrlShow false;
	((findDisplay 38400) displayCtrl 38405) ctrlShow false;

	if ((uiNamespace getVariable ["Weapon_Accessories",0]) isEqualTo 1) then 
	{    
		_config = M_CONFIG(getArray,"WeaponShops",_shop,"mags");
		{
			_bool = [_x] call life_fnc_levelCheck;
			if (_bool) then {
				_x params ["_var"];
				_count = {_x == _var} count (uiNamespace getVariable ["Magazine_Array",[]]);
				if (_count > 0) then {
					_itemInfo = [(_x select 0)] call life_fnc_fetchCfgDetails;
					_magsList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {(_x select 1)} else {(_itemInfo select 1)}];
					_magsList lbSetData[(lbSize _magsList)-1,(_itemInfo select 0)];
					_magsList lbSetPicture[(lbSize _magsList)-1,(_itemInfo select 2)];
					_magsList lbSetValue[(lbSize _magsList)-1,(_x select 2)];
					((findDisplay 38400) displayCtrl 1102) ctrlShow true;
					((findDisplay 38400) displayCtrl 38404) ctrlShow true;
					((findDisplay 38400) displayCtrl 38406) ctrlShow false;					
				};
			};
			true
		} count _config;
	};

	if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 1) then 
	{  
		_config = M_CONFIG(getArray,"WeaponShops",_shop,"accs");
		{
			_bool = [_x] call life_fnc_levelCheck;
			if (_bool) then {
				_x params ["_var"];
				_count = {_x == _var} count (uiNamespace getVariable ["Accessories_Array",[]]);
				if (_count > 0) then 
				{
					_itemInfo = [(_x select 0)] call life_fnc_fetchCfgDetails;
					_accsList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {(_x select 1)} else {(_itemInfo select 1)}];
					_accsList lbSetData[(lbSize _accsList)-1,(_itemInfo select 0)];
					_accsList lbSetPicture[(lbSize _accsList)-1,(_itemInfo select 2)];
					_accsList lbSetValue[(lbSize _accsList)-1,(_x select 2)];
					((findDisplay 38400) displayCtrl 1103) ctrlShow true;
					((findDisplay 38400) displayCtrl 38405) ctrlShow true;
					((findDisplay 38400) displayCtrl 38406) ctrlShow false;
				};
			};
			true
		} count _config;
	};
	
    _price = _control lbValue _index;
    _item = CONTROL_DATAI(_control,_index);
	life_shop_item = _item;
	life_shop_preis = _price;
	
	((findDisplay 38400) displayCtrl 38406) ctrlShow true;
	_buysell buttonSetAction "[life_shop_preis,life_shop_item,1] spawn life_fnc_weaponShopBuySell;";
	
	if(_control isEqualTo ((findDisplay 38400) displayCtrl 38403)) then 
	{
		_buysell  ctrlSetStructuredText parseText format["<t align='center'>Ausrüstung kaufen</t>"];
	};
	
	if(_control isEqualTo ((findDisplay 38400) displayCtrl 38404)) then 
	{
		_buysell ctrlSetStructuredText parseText format["<t align='center'>Magazin kaufen</t>"];
	};
	
	if(_control isEqualTo ((findDisplay 38400) displayCtrl 38405)) then 
	{
		_buysell  ctrlSetStructuredText parseText format["<t align='center'>Zubehör kaufen</t>"];
	};	
	
    if (_price > CASH) then 
	{
        _priceTag ctrlSetStructuredText parseText format ["Kaufpreis: <t color='#ff0000'>$%1</t><br/>Dir fehlen: <t color='#8cff9b'>$%2</t></t>",[(_price)] call life_fnc_numberText,[(_price - CASH)] call life_fnc_numberText];
    } 
	else 
	{
        _priceTag ctrlSetStructuredText parseText format ["Kaufpreis: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
    };
	/*
    if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0 && (uiNamespace getVariable ["Weapon_Accessories",0]) isEqualTo 0) then 
	{
		if (isClass (configFile >> "CfgWeapons" >> _item)) then 
		{
			//Magazines menu
			if (isArray (configFile >> "CfgWeapons" >> _item >> "magazines")) then 
			{
				_itemArray = FETCH_CONFIG2(getArray,"CfgWeapons",_item,"magazines");
				_bool = false;
				{
					_var = _x select 0;
					_count = {_x == _var} count _itemArray;
					
					if (_count > 0) exitWith {_bool = true};
					
				} forEach M_CONFIG(getArray,"WeaponShops",_shop,"mags");
				
				if (_bool) then 
				{
					((findDisplay 38400) displayCtrl 1102) ctrlShow true;
					((findDisplay 38400) displayCtrl 38404) ctrlShow true;
					
				} 
				else 
				{
					((findDisplay 38400) displayCtrl 1102) ctrlShow false;
					((findDisplay 38400) displayCtrl 38404) ctrlShow false;
				};
			} 
			else 
			{
				((findDisplay 38400) displayCtrl 1102) ctrlShow false;
				((findDisplay 38400) displayCtrl 38404) ctrlShow false;
			};

			//Accessories Menu
			if (isClass (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo")) then 
			{
				private ["_slotArray"];
				_itemArray = [];
				
				 
				if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then 
				{
					_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","CowsSlot","compatibleItems");

					{
						_itemArray pushBack _x;
					} forEach _slotArray;
				};
				
				if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) then 
				{
					_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","MuzzleSlot","compatibleItems");

					{
						_itemArray pushBack _x;
					} forEach _slotArray;
				};
				
				if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")) then 
				{
					_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","PointerSlot","compatibleItems");
					{
						_itemArray pushBack _x;
					} forEach _slotArray;
				};
				
				if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then 
				{
					_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","UnderBarrelSlot","compatibleItems");
					{
						_itemArray pushBack _x;
					} forEach _slotArray;
				};
				

				_bool = false;
				{
					_var = _x select 0;
					_count = {_x == _var} count _itemArray;
					if (_count > 0) exitWith {_bool = true};
					
				} forEach M_CONFIG(getArray,"WeaponShops",_shop,"accs");
				
				if (_bool) then 
				{
					((findDisplay 38400) displayCtrl 1103) ctrlShow true;
					((findDisplay 38400) displayCtrl 38405) ctrlShow true;
				} 
				else 
				{
					((findDisplay 38400) displayCtrl 1103) ctrlShow false;
					((findDisplay 38400) displayCtrl 38405) ctrlShow false;
				};
			} 
			else 
			{
				((findDisplay 38400) displayCtrl 1103) ctrlShow false;
				((findDisplay 38400) displayCtrl 38405) ctrlShow false;
			};
		} 
		else 
		{
			((findDisplay 38400) displayCtrl 1102) ctrlShow false;
			((findDisplay 38400) displayCtrl 1103) ctrlShow false;

			((findDisplay 38400) displayCtrl 38404) ctrlShow false;
			((findDisplay 38400) displayCtrl 38405) ctrlShow false;
		};
	};*/
};
