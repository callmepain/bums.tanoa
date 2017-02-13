#include "..\..\script_macros.hpp"
/*
	File: fn_boerseLBChange.sqf
	Author: Hauklotz
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vitem.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_list_1x","_list_2x"];
_control = _this select 0;
_index = _this select 1;
_display = findDisplay 39500;
_name1 = _display displayCtrl 1000;
_preis1 = _display displayCtrl 1001;
_preis2 = _display displayCtrl 1004;
_prozent2 = _display displayCtrl 1005;
if(isNull _display) exitWith {hint "Dialog not open!"; };
//Fetch some information.
_item = _control lbData _index;




if(_item != "") then
{
	ctrlShow [1000,true];
	ctrlShow [1001,true];
	ctrlShow [1101,true];
	ctrlShow [1200,true];
	ctrlShow [1201,true];
	ctrlShow [1002,true];
	ctrlShow [1003,true];
	ctrlShow [1004,true];
	ctrlShow [1005,true];
	
	if(_control isEqualTo ((findDisplay 39500) displayCtrl 1500)) then 
	{
		((findDisplay 39500) displayCtrl 1501) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1502) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1503) lbSetCurSel -1;
	};
	
	if(_control isEqualTo ((findDisplay 39500) displayCtrl 1501)) then 
	{
		((findDisplay 39500) displayCtrl 1500) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1502) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1503) lbSetCurSel -1;
	};
	
	if(_control isEqualTo ((findDisplay 39500) displayCtrl 1502)) then 
	{
		((findDisplay 39500) displayCtrl 1500) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1501) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1503) lbSetCurSel -1;
	};
	
	if(_control isEqualTo ((findDisplay 39500) displayCtrl 1503)) then 
	{
		((findDisplay 39500) displayCtrl 1500) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1501) lbSetCurSel -1;
		((findDisplay 39500) displayCtrl 1502) lbSetCurSel -1;
	};


	_index2 = [_item,life_market_prices] call TON_fnc_index;
	_name = (life_market_prices select _index2) select 0;
	_preis = (life_market_prices select _index2) select 1;
	_change = (life_market_prices select _index2) select 2;
	_prozent = (life_market_prices select _index2) select 3;
	_name = M_CONFIG(getText,"VirtualItems",(_name),"displayName");
	_preis = [_preis] call life_fnc_numberText;

	_name1 ctrlSetStructuredText parseText format["<t align='center' size='2'>%1</t>",localize _name];
	_preis1 ctrlSetStructuredText parseText format["<t align='center' size='2' color='#00FF00'>$%1</t>",_preis];
				
	// /*Trend Global*/
	
	switch (true) do
	{
		case (_change < 0):
		{
			ctrlSetText [1200, "icons\ico_trenddown.paa"];
			_preis2 ctrlSetStructuredText parseText format["<t align='center' color='#FF0000'>-$%1</t>",[_change] call life_fnc_numberText];
		};
		
		case(_change > 0):
		{
			ctrlSetText [1200, "icons\ico_trendup.paa"];
			_preis2 ctrlSetStructuredText parseText format["<t align='center' color='#00FF00'>+$%1</t>",[_change] call life_fnc_numberText];
		};
		
		default
		{
			ctrlSetText [1200, ""];
			_preis2 ctrlSetStructuredText parseText format["<t align='center'>keine Veränderung</t>"];
		};	
	};
	
	switch (true) do
	{
		case (_prozent < 0):
		{
			ctrlSetText [1201, "icons\ico_trenddown.paa"];
			_prozent2 ctrlSetStructuredText parseText format["<t align='center' color='#FF0000'>-$%1</t>",[_prozent] call life_fnc_numberText];
		};
		
		case(_prozent > 0):
		{
			ctrlSetText [1201, "icons\ico_trendup.paa"];
			_prozent2 ctrlSetStructuredText parseText format["<t align='center' color='#00FF00'>+$%1</t>",[_prozent] call life_fnc_numberText];
		};
		
		default
		{
			ctrlSetText [1201, ""];
			_prozent2 ctrlSetStructuredText parseText format["<t align='center'>keine Veränderung</t>"];
		};	
	};
};