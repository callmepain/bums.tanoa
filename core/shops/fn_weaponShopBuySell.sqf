#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopBuySell.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private ["_price","_item","_itemInfo","_bad"];
params [
	"_price",
	"_item",
	"_anzahlIst"
];

_anzahl = ctrlText 38407;

if (!([_anzahl] call TON_fnc_isnumber)) exitWith 
{
	[(format [localize "STR_Shop_Virt_NoNum"]),"Hinweis","Yellow"] call MSG_fnc_handle;
};
_anzahl = parseNumber(_anzahl);

_itemInfo = [_item] call life_fnc_fetchCfgDetails;
if (isNil "_item") exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
if (isNil "_price") then {_price = 1;};
if (_anzahl isEqualTo 0) exitWith 
{
	[(format["Wie du möchtest nichts kaufen ?! <br/> Ich glaub du bist nich ganz dicht!"]),"Fehler","red"] call MSG_fnc_handle;
};
_canAdd = 0;
_canAddItemToUniform = 0;
_canAddItemToVest = 0;
_canAddItemToBackpack = 0;
_exit = false; 

if (((_itemInfo select 6) != "CfgVehicles") && (uiNamespace getVariable ["Weapon_Shop_Filter",0]) != 1) then 
{
    if (((_itemInfo select 4) in [4096,131072]) OR ((_itemInfo select 6) isEqualTo "CfgMagazines")) then 
	{
        if (!(player canAdd [_item,(_anzahl)])) then 
		{
			for "_i" from (_anzahl) to 0 step -1 do 
			{

				if !(player canAddItemToUniform [_item,_i]) then
				{
					_canAddItemToUniform = (_i -1);
				};
				if !(player canAddItemToVest [_item,_i]) then
				{
					_canAddItemToVest = (_i -1);
				};
				if !(player canAddItemToBackpack [_item,_i]) then
				{
					_canAddItemToBackpack = (_i -1);
				};
			};			
			_canAdd = (_canAddItemToBackpack + _canAddItemToVest + _canAddItemToUniform);
			_exit = true; 
		};
    };
};
if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then 
{
	if (_anzahl > _anzahlIst) exitWith
	{
		["Du hast nicht soviele Gegenstände, wie du verkaufen möchtest!","Fehler","red"] call MSG_fnc_handle;
	};
	
	for "_i" from 0 to (_anzahl)-1 do 
	{
		[_item,false] spawn life_fnc_handleItem;
	};
	
    CASH = CASH + (_price * _anzahl);
	
	[(format["Du hast<br/><t color='#8cff9b'>%1x  - %2</t><br/>für<br/><t color='#8cff9b'>$%3</t><br/>verkauft.",_anzahl,_itemInfo select 1,[(_price * _anzahl)] call life_fnc_numberText]),"Ausrüstung verkauft","green"] call MSG_fnc_handle;
	[nil,(uiNamespace getVariable ["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.	
} 
else 
{
	if (_exit) exitWith 
	{
		[format["Du kannst nicht soviel Kaufen!<br/>Du hast nur Platz für <t color='#ff0000'>%1</t> weitere!",_canAdd],"Hinweis","yellow"] call MSG_fnc_handle;
	};
	
     _altisArray = ["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"];
     _tanoaArray = ["Land_School_01_F","Land_Warehouse_03_F","Land_House_Small_02_F"];
     _hideoutObjs = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;
     _hideout = (nearestObjects[getPosATL player,_hideoutObjs,25]) select 0;
    if (!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then 
	{
        _action = [
            format [(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
                [(group player getVariable "gang_bank")] call life_fnc_numberText,
                [CASH] call life_fnc_numberText
            ],
            localize "STR_Shop_Virt_YourorGang",
            localize "STR_Shop_Virt_UI_GangFunds",
            localize "STR_Shop_Virt_UI_YourCash"
        ] call BIS_fnc_guiMessage;
        if (_action) then 
		{
            _funds = group player getVariable "gang_bank";
            _funds = _funds - _price;
            group player setVariable ["gang_bank",_funds,true];
			
			if ((((_itemInfo select 4) in [4096,131072]) OR ((_itemInfo select 6) isEqualTo "CfgMagazines")) AND (gettext(configfile >> "CfgWeapons" >> _item >> "tf_subtype") != "digital")) then 
			{
				[(format["Du hast<br/><t color='#8cff9b'>%1x  - %2</t><br/>für<br/><t color='#8cff9b'>$%3</t><br/>gekauft.",_anzahl,_itemInfo select 1,[(_price * _anzahl)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
							   
				for "_i" from 0 to (_anzahl)-1 do 
				{
					[_item,true,false,false,true] call life_fnc_handleItem;
				};
			}
			else
			{
				[(format["Du hast<br/><t color='#8cff9b'>1x  - %1</t><br/>für<br/><t color='#8cff9b'>$%2</t><br/>gekauft.",_itemInfo select 1,[(_price)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
				[_item,true] call life_fnc_handleItem;		
			};
			if (life_HC_isActive) then 
			{			
				[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
			} else {
				[1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};
		} 
		else 
		{	   
			if ((((_itemInfo select 4) in [4096,131072]) OR ((_itemInfo select 6) isEqualTo "CfgMagazines")) AND (gettext(configfile >> "CfgWeapons" >> _item >> "tf_subtype") != "digital")) then 
			{
				if ((_price * _anzahl) > CASH) exitWith 
				{
					[(format["Du hast nicht genug Geld dabei!<br/>Dir fehlen: <t color='#ff0000'>$%1</t></t>",[((_price* _anzahl) - CASH)] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;
				};
				[(format["Du hast<br/><t color='#8cff9b'>%1x  - %2</t><br/>für<br/><t color='#8cff9b'>$%3</t><br/>gekauft.",_anzahl,_itemInfo select 1,[(_price * _anzahl)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
				
				CASH = CASH - (_price * _anzahl);
			   
				for "_i" from 0 to (_anzahl)-1 do 
				{
					[_item,true,false,false,true] call life_fnc_handleItem;
				};
			}
			else
			{
				if ((_price ) > CASH) exitWith 
				{
					[(format["Du hast nicht genug Geld dabei!<br/>Dir fehlen: <t color='#ff0000'>$%1</t></t>",[((_price) - CASH)] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;
				};
				[(format["Du hast<br/><t color='#8cff9b'>1x  - %1</t><br/>für<br/><t color='#8cff9b'>$%2</t><br/>gekauft.",_itemInfo select 1,[(_price)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
				CASH = CASH - (_price);
				[_item,true] call life_fnc_handleItem;		
			};		   
		};
	} 
	else 
	{
		if ((((_itemInfo select 4) in [4096,131072]) OR ((_itemInfo select 6) isEqualTo "CfgMagazines")) AND (gettext(configfile >> "CfgWeapons" >> _item >> "tf_subtype") != "digital")) then 
		{
			if ((_price * _anzahl) > CASH) exitWith 
			{
				[(format["Du hast nicht genug Geld dabei!<br/>Dir fehlen: <t color='#ff0000'>$%1</t></t>",[((_price* _anzahl) - CASH)] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;
			};
			[(format["Du hast<br/><t color='#8cff9b'>%1x  - %2</t><br/>für<br/><t color='#8cff9b'>$%3</t><br/>gekauft.",_anzahl,_itemInfo select 1,[(_price * _anzahl)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
			
			CASH = CASH - (_price * _anzahl);
		   
			for "_i" from 0 to (_anzahl)-1 do 
			{
				[_item,true,false,false,true] call life_fnc_handleItem;
			};
		}
		else
		{
			if ((_price ) > CASH) exitWith 
			{
				[(format["Du hast nicht genug Geld dabei!<br/>Dir fehlen: <t color='#ff0000'>$%1</t></t>",[((_price) - CASH)] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;
			};
			[(format["Du hast<br/><t color='#8cff9b'>1x  - %1</t><br/>für<br/><t color='#8cff9b'>$%2</t><br/>gekauft.",_itemInfo select 1,[(_price)] call life_fnc_numberText]),"Ausrüstung gekauft","green"] call MSG_fnc_handle;
			CASH = CASH - (_price);
			[_item,true] call life_fnc_handleItem;		
		};
	};	
};			

[] call life_fnc_saveGear;
[10] call SOCK_fnc_updatePartial;