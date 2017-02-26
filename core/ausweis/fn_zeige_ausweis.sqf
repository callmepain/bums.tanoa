#include "..\..\script_macros.hpp"
disableSerialization;
_sender = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(!(isNull (uiNameSpace getVariable "playerAusweis"))) exitWith {hint format["%1 moechte dir seinen Personal- / Dienstausweis zeigen, jedoch schaust du dir gerade einen an.",_sender getVariable["realname",name _sender]]}; // Aktuell wird schon ein Personalausweis angesehen
if(_sender distance player > 5) exitWith {titleText ["Der Spieler ist zu weit weg","PLAIN"];};
if(isNull _sender) exitWith {};
_rangtext = "";
_senderVar = _sender getVariable ["datum",""];
_uid = getPlayerUID player;
_ui = "";
if ((side _sender) isEqualTo west) then {
	("ausweis" call BIS_fnc_rscLayer) cutRsc ["Life_cop_Ausweis","PLAIN"];
	_ui = uiNameSpace getVariable "playerAusweis";
};
if ((side _sender) isEqualTo civilian) then {
	("ausweis" call BIS_fnc_rscLayer) cutRsc ["Life_civ_Ausweis","PLAIN"];
	_ui = uiNameSpace getVariable "playerAusweis";
};
if ((side _sender) isEqualTo east) then {
	("ausweis" call BIS_fnc_rscLayer) cutRsc ["Life_ems_Ausweis","PLAIN"];
	_ui = uiNameSpace getVariable "playerAusweis";
};
if ((side _sender) isEqualTo independent) then {
	("ausweis" call BIS_fnc_rscLayer) cutRsc ["Life_ems_Ausweis","PLAIN"];
	_ui = uiNameSpace getVariable "playerAusweis";
};

_dname = _ui displayCtrl 30000;
_deingew = _ui displayCtrl 30001;
_drang = _ui displayCtrl 30002;


_dname ctrlSetStructuredText parseText format["<a color='#000000'>%1</a>",(name _sender)];

_datum = format["%1.%2.%3",(_senderVar select 0),(_senderVar select 1),(_senderVar select 2)];
_deingew ctrlSetStructuredText parseText format["<a color='#000000'>%1</a>",_datum];

_rang = _sender getVariable ["rank","ficken"];
if ((side _sender) isEqualTo west) then {
	_rangtext = switch(_rang) do {
		case 1: {"Police Officer I"};
		case 2: {"Police Officer II"};
		case 3: {"Sergeant"};
		case 4: {"Lieutenant"};
		case 5: {"Captain"};
		case 6: {"Sheriff"};
		case 7: {"SWAT"};
		case 8: {"Deputy Chief"};
		case 9: {"Chief of Police"};
	};
	_drang ctrlSetStructuredText parseText format["<a color='#000000'>%1</a>",_rangtext];
};
if ((side _sender) isEqualTo east) then {
	_rangtext = switch(_rang) do {
		case 1: {"Chief of Department"};
		case 2: {"Assistent Chief"};
		case 3: {"Deputy Chief"};
		case 4: {"Battalion Chief"};
		case 5: {"Captain"};
		case 6: {"Lieutenant"};
		case 7: {"Firefighter"};
	};
	_drang ctrlSetStructuredText parseText format["<a color='#000000'>%1</a>",_rangtext];
};
if ((side _sender) isEqualTo independent) then {
	_rangtext = switch(_rang) do {
		case 1: {"Chief of Department"};
		case 2: {"Assistent Chief"};
		case 3: {"Deputy Chief"};
		case 4: {"Battalion Chief"};
		case 5: {"Captain"};
		case 6: {"Lieutenant"};
		case 7: {"Firefighter"};
	};
	_drang ctrlSetStructuredText parseText format["<a color='#000000'>%1</a>",_rangtext];
};
