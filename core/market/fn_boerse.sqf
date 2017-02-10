#include "..\..\script_macros.hpp"
/*
    File: fn_boerse.sqf
    Author: Hauklotz
	
    Description:
    Listet alle virtuellen Items auf
*/
private["_display", "_selectedindex", "_index", "_shortname","_Btn1"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";};
params [
    "_clear"
];
_display = findDisplay 39500;
_Titel = _display displayCtrl 1100;
_EntwicklungTitel = _display displayCtrl 1101;
_NahrungTitel = _display displayCtrl 1102;
_RohstoffeTitel = _display displayCtrl 1103;
_DrogenTitel = _display displayCtrl 1104;
_MultiTitel = _display displayCtrl 1105;

_Nahrung = _display displayCtrl 1500;
_Rohstoffe = _display displayCtrl 1501;
_Drogen = _display displayCtrl 1502;
_Multi = _display displayCtrl 1503;

if(isNull _display) exitWith {hint "Dialog not open!"; };

if(_clear) then 
{

ctrlShow [1000,false];
ctrlShow [1001,false];
ctrlShow [1101,false];
ctrlShow [1200,false];
ctrlShow [1201,false];
ctrlShow [1002,false];
ctrlShow [1003,false];
ctrlShow [1004,false];
ctrlShow [1005,false];
};


_Titel ctrlSetStructuredText parseText format["<t align='center'>Börsenübersicht</t>"];
_EntwicklungTitel ctrlSetStructuredText parseText format["<t align='center'>Preisentwicklung</t>"];
_NahrungTitel ctrlSetStructuredText parseText format["<t align='center'>Nahrungsmittel</t>"];
_RohstoffeTitel ctrlSetStructuredText parseText format["<t align='center'>Rohstoffe</t>"];
_DrogenTitel ctrlSetStructuredText parseText format["<t align='center'>Drogen</t>"];
_MultiTitel ctrlSetStructuredText parseText format["<t align='center'>Hochwertig</t>"];


lbClear 1500;
lbClear 1501;
lbClear 1502;
lbClear 1503;

_Nahrung lbSetCurSel -1;
_Rohstoffe lbSetCurSel -1;
_Drogen lbSetCurSel -1;
_Multi lbSetCurSel -1;


// _selectedindex = lbCurSel 1500;
// lbClear 1500;
// _items lbSetCurSel 0;

{
    _displayName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
	
	_Nahrung lbAdd format ["%1",(localize _displayName)];
	_Nahrung lbSetData [(lbSize _Nahrung)-1,(_x select 0)];
	_icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
	if (!(_icon isEqualTo "")) then {
		_Nahrung lbSetPicture [(lbSize _Nahrung)-1,_icon];
    };
} forEach life_market_resources;

{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
	
	_Rohstoffe lbAdd format ["%1",(localize _displayName)];
	_Rohstoffe lbSetData [(lbSize _Rohstoffe)-1,_x];
	_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
	if (!(_icon isEqualTo "")) then {
		_Rohstoffe lbSetPicture [(lbSize _Rohstoffe)-1,_icon];
    };
} forEach life_market_resources_rohstoffe;

{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
	
	_Drogen lbAdd format ["%1",(localize _displayName)];
	_Drogen lbSetData [(lbSize _Drogen)-1,_x];
	_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
	if (!(_icon isEqualTo "")) then {
		_Drogen lbSetPicture [(lbSize _Drogen)-1,_icon];
    };
} forEach life_market_resources_drogen;

{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
	
	_Multi lbAdd format ["%1",(localize _displayName)];
	_Multi lbSetData [(lbSize _Multi)-1,_x];
	_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
	if (!(_icon isEqualTo "")) then {
		_Multi lbSetPicture [(lbSize _Multi)-1,_icon];
    };
} forEach life_market_resources_multi;



