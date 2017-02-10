/*
	File: fn_economy_sell.sqf
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];

disableSerialization;
if(!createDialog "Life_Market") exitWith {diag_log "!dialog";};

_display = findDisplay 2300;
_text = _display displayCtrl 2304;
_display displayCtrl 2301 ctrlSetStructuredText parseText "<t align='center'>Borderline-Life Itempreisliste</t>";
_display displayCtrl 2302 ctrlSetStructuredText parseText "Itemübersicht";
_display displayCtrl 2303 ctrlSetStructuredText parseText "<t align='right'>Kaufreis</t>";

_list = "";
_mylist = [];
{
	_item = _x select 0;
	_preis = _x select 1;
	
	if(!(_item in _mylist)) then
	{
		_mylist pushback _item;
				
		_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		_preis = [_preis] call life_fnc_numberText;
	
		_list = _list + format["%1<t align='right'>%2€</t><br/>",_itemName,_preis];

	};
} foreach __GETC__(buy_array);

_text ctrlSetStructuredText parseText format["%1",_list];