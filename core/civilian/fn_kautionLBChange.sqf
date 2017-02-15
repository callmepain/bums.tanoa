#include "..\..\script_macros.hpp"
/*
	File: fn_KautionLBChange.sqf
	Author:H4uklotz
	
	Description:
	Zeigt die Daten der Person an.
*/
disableSerialization;
private["_nearVehicles","_control"];
_display = findDisplay 55550;
_control = _display displayCtrl 55553;
_unit = _control lbData (lbCurSel _control);
_unit = call compile format["%1", _unit];
_kaution = lbValue[55553,(lbCurSel 55553)];

_countDown =	_unit getVariable ["arrestZeit",0];
_countDown_kaution_time =_unit getVariable ["kautionZeit",0];
_canPayBail = _unit getVariable ["canpay_bail ",false];

_kautionPreis = _display displayCtrl 55551;
_zeit = _display displayCtrl 55552;



_kautionPreis ctrlSetStructuredText parseText format ["<t align='left'>Kaution: <t color='#8cff9b' align='right'>$%1</t></t>",[(_kaution)] call life_fnc_numberText];


if(_kaution isEqualto 0) then
{
	_zeit ctrlSetStructuredText parseText format ["<t align='left'>Restzeit: <t align='right'>%1 Minuten</t><br/><br/>Kaution kann nicht bezahlt werden",_countDown];
	((findDisplay 55550) displayCtrl 55554) ctrlEnable false;	
}
else
{
	if(_canPayBail) then
	{
		_zeit ctrlSetStructuredText parseText format ["<t align='left'>Restzeit: <t align='right'>%1 Minuten</t>",_countDown];
		((findDisplay 55550) displayCtrl 55554) ctrlEnable true;	
	}
	else
	{
		_zeit ctrlSetStructuredText parseText format ["<t align='left'>Restzeit: <t align='right'>%1 Minuten</t><br/><t align='left'>Kaution kann bezahlt werden in: <t align='right'>%2 Minuten</t>",_countDown,_countDown_kaution_time];
		((findDisplay 55550) displayCtrl 55554) ctrlEnable false;	
	};
};


