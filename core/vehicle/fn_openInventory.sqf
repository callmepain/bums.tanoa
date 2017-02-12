#include "..\..\script_macros.hpp"
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
sleep (random 1.00000);
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F" OR _vehicle isKindOf "Man" OR (typeOf _vehicle in life_Container))) exitWith {diag_log format["Vehicle is Null_1 %1",_vehicle]}; //Either a null or invalid vehicle type.



if((_vehicle getVariable ["trunk_in_use",false])) exitWith {[(format [localize "STR_MISC_VehInvUse"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if((_vehicle getVariable ["car_processing",false])) exitWith {[(format [localize "STR_MISC_car_processing"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {[(format [localize "STR_MISC_DialogError"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Couldn't create the menu?
disableSerialization;

_display = findDisplay 3500;
_Titel = _display displayCtrl 1100;
_Btn1 = _display displayCtrl 1010;
_Btn2 = _display displayCtrl 1011;
_Btn3 = _display displayCtrl 1013;
_Btn4 = _display displayCtrl 1014;


_Btn1 ctrlSetStructuredText parseText "Nehmen";
_Btn2 ctrlSetStructuredText parseText "Lagern";
_Btn3 ctrlSetStructuredText parseText "alles ausgewählte Nehmen";
_Btn4 ctrlSetStructuredText parseText "alles ausgewählte Lagern";

//log
_text = format ["<<<<openInventory>>>>|%1||%2|>>hat das inventar von %3 geöffnet",getPlayerUID player,name player,_vehicle];
// [[1,_text],"TON_fnc_log",false,false] call life_fnc_MP;
[_text] remoteExec ["TON_fnc_log",0];
//log
switch(true)do
{
	case (typeOf _vehicle in life_Container):
	{
		ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
	case (_vehicle isKindOf "House_F"):
	{
		ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
	default
	{
		ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
};

switch(true)do
{
	case (typeOf _vehicle in life_Container):
	{
		[_vehicle] call life_fnc_vehicleUpdateTrunkWeight; //To ensure everything is ok
		_veh_data = [_vehicle] call life_fnc_vehicleWeight;

	};
	case (_vehicle isKindOf "House_F"):
	{
		private["_mWeight"];
		_mWeight = 0;
		{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
		_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
	};
	default
	{
		////Update weight here
		[_vehicle] call life_fnc_vehicleUpdateTrunkWeight; //To ensure everything is ok
		_veh_data = [_vehicle] call life_fnc_vehicleWeight;
	};
};



if(_vehicle isKindOf "House_F" && !(typeOf _vehicle in life_Container) && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};


_Titel ctrlSetStructuredText parseText format["<t align='center'>Kofferraum</t><t align='right'>%1: %2/%3</t>",(localize "STR_MISC_Weight"),_veh_data select 1,_veh_data select 0];

[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then {
		// [[_this],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
		[_this] remoteExec ["TON_fnc_updateHouseTrunk",0];
	// }
	// else
	// {	
		// hintSilent "Hinweis: Illegale Sachen werden nicht gespeichert, wenn du dein Fahrzeug in die Garage einparkst.";
		// sleep 5;
		// [[_this],"TON_fnc_vehicleSaveInventory",false,false] spawn life_fnc_MP;
	};
};

