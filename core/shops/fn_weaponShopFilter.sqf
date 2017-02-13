#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopFilter.sqf
    Author: Bryan "Tonic" Boardwine
    Edit: Added level checks - BoGuu
	Edit by H4uklotz
	
    Description:
    Applies the filter selected and changes the list.
*/
private ["_index","_shop","_config","_itemList","_magsList","_accsList","_itemInfo","_listedItems","_listedMags","_listedAccs","_items","_mags","_accs","_itemCount"];
disableSerialization;
 _index = (lbCurSel 38402);
 _shop = uiNamespace getVariable ["Weapon_Shop",""];

if (_index isEqualTo -1 || {_shop isEqualTo ""}) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

uiNamespace setVariable ["Weapon_Shop_Filter",_index];

 _itemList = ((findDisplay 38400) displayCtrl 38403);
 _magsList = ((findDisplay 38400) displayCtrl 38404);
_accsList = ((findDisplay 38400) displayCtrl 38405); 
  
((findDisplay 38400) displayCtrl 1102) ctrlShow false;
((findDisplay 38400) displayCtrl 1103) ctrlShow false;

((findDisplay 38400) displayCtrl 38401) ctrlShow false;
((findDisplay 38400) displayCtrl 38404) ctrlShow false;
((findDisplay 38400) displayCtrl 38405) ctrlShow false;
((findDisplay 38400) displayCtrl 38406) ctrlShow false;
((findDisplay 38400) displayCtrl 38407) ctrlShow false;	  
  
  
lbClear _itemList;
lbClear _magsList;
lbClear _accsList;
uiSleep 0.2;
switch (_index) do 
{

	case 0: 
	{
		_config = M_CONFIG(getArray,"WeaponShops",_shop,"items");
		{
			_bool = [_x] call life_fnc_levelCheck;
			if (_bool) then 
			{
				_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
				_itemList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {_x select 1} else {_itemInfo select 1}];
				_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
				_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
			};
			true
		} count _config;						
	};
	
	case 1: 
	{	
		((findDisplay 38400) displayCtrl 38406)  ctrlSetStructuredText parseText format["<t align='center'>Ausrüstung verkaufen</t>"];
		((findDisplay 38400) displayCtrl 38407) ctrlShow true;	  	
		
		_items = [];
		_mags = [];
		_accs = [];
		_listedItems = [];
		_listedMags = [];
		_listedAccs = [];
		_itemCount = 0;
		
		//Go through weapons
		if (primaryWeapon player != "") then {_items pushBack primaryWeapon player;};
		if (secondaryWeapon player != "") then {_items pushBack secondaryWeapon player;};
		if (handgunWeapon player != "") then {_items pushBack handgunWeapon player;};

		//Go through items
		
		if (!(uniform player isEqualTo "")) then 
		{
			{
				if (_x in (magazines player)) then 
				{
					_mags pushBack _x;
				} 
				else 
				{
					_items pushBack _x;
				};
			} forEach (uniformItems player);
		};

		if (!(backpack player isEqualTo "")) then 
		{
			{
				if (_x in (magazines player)) then 
				{
					_mags pushBack _x;
				} 
				else 
				{
					_items pushBack _x;
				};
			} forEach (backpackItems player);
		};

		if (!(vest player isEqualTo "")) then 
		{
			{
				if (_x in (magazines player)) then 
				{
					_mags pushBack _x;
				} 
				else 
				{
					_items pushBack _x;
				};
			} forEach (vestItems player);
		};
				
		if(count (primaryWeaponItems player) >0) then 
		{
			{
				if (_x != "") then 
				 {
					_accs pushBack _x;
				};			
			}forEach (primaryWeaponItems player);
		};
		
		
		if(count (handgunItems player) >0) then 
		{
			{
				 if (_x != "") then 
				 {
					_accs pushBack _x;
				};
			}forEach (handgunItems player);
		};
		
		
		if(count (assignedItems player) >0) then 
		{
			{
			_items pushBack _x;
			
			}forEach (assignedItems player);
		};
		
		if(count _mags > 0) then
		{		
			((findDisplay 38400) displayCtrl 1102) ctrlShow true;
			((findDisplay 38400) displayCtrl 38404) ctrlShow true;
		};
		
		if(count _accs > 0) then
		{		
			((findDisplay 38400) displayCtrl 1103) ctrlShow true;		
			((findDisplay 38400) displayCtrl 38405) ctrlShow true;
		};

		{
			 if (!(_x in _listedMags) && _x != "") then 
			 {
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedMags pushBack _x;

				_itemCount = {_x == (_itemInfo select 0)} count _mags;
				if (_itemCount > 1) then 
				{
					_magsList lbAdd format ["%2x - %1",_itemInfo select 1,_itemCount];
				} 
				else 
				{
					_magsList lbAdd format ["%1",_itemInfo select 1];
				};
				_magsList lbSetData[(lbSize _magsList)-1,_itemInfo select 0];
				_magsList lbSetPicture[(lbSize _magsList)-1,_itemInfo select 2];
				_magsList lbSetValue[(lbSize _magsList)-1,_itemCount];
			};
			true
		} count _mags;
		
		{
			 if (!(_x in _listedAccs) && _x != "") then 
			 {
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedAccs pushBack _x;

				_itemCount = {_x == (_itemInfo select 0)} count _accs;
				
				if (_itemCount > 1) then 
				{
					_accsList lbAdd format ["%2x - %1",_itemInfo select 1,_itemCount];
				} 
				else 
				{
					_accsList lbAdd format ["%1",_itemInfo select 1];
				};
				_accsList lbSetData[(lbSize _accsList)-1,_itemInfo select 0];
				_accsList lbSetPicture[(lbSize _accsList)-1,_itemInfo select 2];	
				_accsList lbSetValue[(lbSize _accsList)-1,_itemCount];				
			};
			true
		} count _accs;
		
		{			
			 if (!(_x in _listedItems) && _x != "" && _x != "Binocular") then 
			 {
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedItems pushBack _x;

				_itemCount = {_x  == (_itemInfo select 0)} count _items;
				if (_itemCount > 1) then 
				{
					_itemList lbAdd format ["%2x - %1",_itemInfo select 1,_itemCount];
				} 
				else 
				{
					_itemList lbAdd format ["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
				_itemList lbSetValue[(lbSize _itemList)-1,_itemCount];	
			};
			true
		} count _items;
	};
};

((findDisplay 38400) displayCtrl 38403) lbSetCurSel -1;
((findDisplay 38400) displayCtrl 38404) lbSetCurSel -1;
((findDisplay 38400) displayCtrl 38405) lbSetCurSel -1;