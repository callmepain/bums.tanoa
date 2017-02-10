/*
	File: fn_pardon.sqf
	Author: H4uklotz
	
	Description:
	Sendet verbrechen zum server
*/


private["_unit","_amount"];

ctrlShow[1006,true];
if((lbCurSel 9902) == -1) exitWith {hint "Es wurde keiner Ausgewählt!"};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
_type = "";

// if((side _unit) == west) exitWith {hint "Du kannst keine Polizisten hinzufügen.!"};

switch(_amount) do 
{
	case "187": 		{_type = "Totschlag"};
	case "187V":		{_type = "fahrlässige Tötung"};
	case "207": 		{_type = "Entführung"};
	case "207A": 		{_type = "versuchte Entführung"};
	case "211": 		{_type = "Raub"};
	case "213": 		{_type = "Benutzung von Sprengstoff"};
	case "215": 		{_type = "versuchter Autodiebstahl"};
	case "216": 		{_type = "Autodiebstahl"};
	case "261": 		{_type = "Vergewaltigung"};
	case "261A": 		{_type = "versuchte Vergewaltigung"};
	case "390": 		{_type = "öffentliche Trunkenheit"};
	case "459": 		{_type = "Einbrecher"};
	case "480": 		{_type = "Zechprellerei"};
	case "481": 		{_type = "Drogenbesitz"};
	case "482": 		{_type = "Drogenhandel"};
	case "483": 		{_type = "Drogenschmuggel"};
	case "484": 		{_type = "Bankräuber"};	
	case "485": 		{_type = "mit beschädigtem Fahrzeug fahren"};
	case "486": 		{_type = "Fahren ohne Licht"};
	case "487": 		{_type = "Fahren auf der Falschen Spur"};
	case "488": 		{_type = "kleiner Diebstahl"};
	case "489": 		{_type = "Landen auf nicht dafür vorher gesehenen Flächen"};
	case "490": 		{_type = "fehlende Gefahrgutbeförderungslizenz"};
	case "491": 		{_type = "Widerstand gegen die Staatsgewalt"};
	case "492": 		{_type = "Besitz von illegalen Waffen"};
	case "500": 		{_type = "Fahren ohne Führerschein"};
	case "501": 		{_type = "überhöhte Geschwindigkeit bis 10 km/h"};	
	case "502": 		{_type = "überhöhte Geschwindigkeit 11-15 km/h"};	
	case "503": 		{_type = "überhöhte Geschwindigkeit 16-20 km/h"};	
	case "504": 		{_type = "überhöhte Geschwindigkeit 21-25 km/h"};	
	case "505": 		{_type = "überhöhte Geschwindigkeit 26-30 km/h"};	
	case "506": 		{_type = "überhöhte Geschwindigkeit 31-40 km/h"};	
	case "507": 		{_type = "überhöhte Geschwindigkeit 41-50 km/h"};	
	case "508": 		{_type = "überhöhte Geschwindigkeit 51-60 km/h"};	
	case "509": 		{_type = "überhöhte Geschwindigkeit 61-70 km/h"};	
	case "510": 		{_type = "überhöhte Geschwindigkeit über 70 km/h"};	
	case "901": 		{_type = "Gefängnisausbruch"};
	case "919": 		{_type = "Organhändler"};	
	default 				{_type = ""};
};

if(isNil "_unit") exitWith {ctrlShow[1006,true];};
//if(_unit == player) exitWith {ctrlShow[1006,true];};
if(isNull _unit) exitWith {ctrlShow[1006,true];};


[0,format["%1 hat %2 wegen %3 zur Fahndung ausgeschrieben.",name player,name _unit,_type]] remoteExec ["life_fnc_broadcast",west];

[(getPlayerUID _unit),(name _unit),_amount] remoteExecCall ["life_fnc_wantedAdd",2];