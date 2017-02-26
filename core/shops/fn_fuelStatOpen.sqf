#include "..\..\script_macros.hpp"
/*
    File: fn_fuelStatOpen.sqf
    Author : NiiRoZz
	Edit by H4uklotz
	
    Description:
    Open dialog Pump.
*/
private ["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_fuelCost"];

disableSerialization;
//Long boring series of checks
if (life_tanken) exitWith 
{
	["Du tankst schon ein Fahrzeug.","Hinweis","yellow"] call MSG_fnc_handle;
};
if (dialog) exitWith {};

life_tanken = true;
_fuelstation = (_this select 0);
_fuelstations = nearestObjects [player, ["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"],10];

if (_fuelstations isEqualTo []) exitWith {life_tanken = false;};

_vehicleList = nearestObjects [player, ["landvehicle","air"], 10];

if (count _vehicleList < 1) exitWith 
{
	[(format[localize "STR_NOTF_VehicleNear"]),"Hinweis","yellow"] call MSG_fnc_handle;
	life_tanken = false;
};

if (!createDialog "Life_FuelStat") exitWith {};

[] spawn {waitUntil {!dialog}; life_tanken = false;};

_display = findDisplay 20300;
_titel = _display displayCtrl 1100;
_listeTitel = _display displayCtrl 20301;
_infoTitel = _display displayCtrl 20302;
_preis = _display displayCtrl 20303;
_liter = _display displayCtrl 20304;
_total = _display displayCtrl 20305;
_liste = _display displayCtrl 20306;
_tanken = _display displayCtrl 20309;


_Titel ctrlSetStructuredText parseText format["<t align='center'>Tankstelle</t>"];
_listeTitel ctrlSetStructuredText parseText format["<t align='center'>Fahrzeuge in der Nähe</t>"];
_infoTitel ctrlSetStructuredText parseText format["<t align='center'>Fahrzeuginformationen</t>"];
_liter ctrlSetStructuredText parseText format["<t align='left'>Tankmenge: <t align='right'>0L</t>"];
_total ctrlSetStructuredText parseText format["<t align='left'>Gesamtkosten: <t align='right'>$0</t>"];



 ctrlShow[20302,false];
 ctrlShow[20303,false];
 ctrlShow[20304,false];
 ctrlShow[20305,false];
 ctrlShow[20307,false];
 ctrlShow[20308,false];
 ctrlShow[20309,false];



//Fetch the shop config.
vehicleFuelList =[];

lbClear _liste; //Flush the list.

{
	if((alive _x) && (_x in life_vehicles)) then 
	{
		vehicleFuelList pushBack _x;
	};
} foreach _vehicleList;

{
	if(alive _x) then 
	{
		_className = (typeOf _x);
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
				
		if(_x getVariable ["betankung",false]) then
		{
			_liste lbAdd format["%1 - [Entfernung: %2m] - [wird aufgetankt]",_displayName,round(_fuelstation distance _x)];
			_liste lbSetData [(lbSize _liste)-1,_className];
			_liste lbSetPicture [(lbSize _liste)-1,_picture];
			_liste lbSetValue [(lbSize _liste)-1,_ForEachIndex];
		}
		else
		{
			_liste lbAdd format["%1 - [Entfernung: %2m]",_displayName,round(_fuelstation distance _x)];
			_liste lbSetData [(lbSize _liste)-1,_className];
			_liste lbSetPicture [(lbSize _liste)-1,_picture];
			_liste lbSetValue [(lbSize _liste)-1,_ForEachIndex];
		};
	};
} foreach vehicleFuelList;