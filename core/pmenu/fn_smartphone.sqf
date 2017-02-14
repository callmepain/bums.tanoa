#include "..\..\script_macros.hpp"
/* 
	file: fn_smartphone.sqf 
	Author: Silex 
	Edit by H4uklotz
	
	Beschreibung:
	Init für das Smartphone System
*/

private["_display","_units","_type","_data","_rowData","_msg"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;

_Titel = _display displayCtrl 1100;
_Liste = _display displayCtrl 88889;
_Schreiben = _display displayCtrl 887892;
_Notruf = _display displayCtrl 887893;


_Titel ctrlSetStructuredText parseText format["<t align='center'>iMessage</t>"];
_cMessageHeader ctrlSetStructuredText parseText format["Erhaltene Nachrichten:"];
_Liste ctrlSetStructuredText parseText format["<t align='center'>Einwohner</t>"];
_Schreiben ctrlSetStructuredText parseText format["iMessage schreiben"];
_Notruf ctrlSetStructuredText parseText format["Notruf absetzen"];


ctrlEnable[887892,false];
switch(_type) do
{ 
	case 0: 
	{ 
		lbClear _cPlayerList;
		{
			if(alive _x ) then //&& _x != player
			{				
				switch(side _x) do 
				{ 
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "Med"};
				case east: {_type = "Adac"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		
		lbSort _cPlayerList;			
		[getPlayerUID player, player] remoteExec ["TON_fnc_msgRequest",2];			
		ctrlEnable[887892,false];
	};
	
	case 1: 
	{ 	
		_cMessageList lnbSort [0, false];
		_msg = [_data select 2,20] call KRON_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];	
		_cMessageList lnbAddRow[_data select 3,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		
	};
	
	case 2: 
	{ 
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		life_smartphoneTarget = call compile format["%1",_target];
	};
	
	case 3: 
	{
		createDialog "Life_smartphone_schreiben";
		ctrlSetText[88886, format["Message: %1",name life_smartphoneTarget]];
	};
	
	case 4: 
	{
		createDialog "Life_smartphone_notruf";
	};
};