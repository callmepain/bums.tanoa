#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Impounds the vehicle
*/
private ["_vehicle","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_impoundMultiplier","_side"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship"];
if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (player distance cursorObject > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {[(format [localize "STR_NPC_Protected"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
_vInfo = _vehicle getVariable ["dbInfo",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
[0,"STR_NOTF_BeingImpounded",true,[((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;
_prof = "Beschlagnahmen";

diag_log format ["_vehicle %1",_vehicle];
diag_log format ["_vInfo %1",_vInfo];

if (count _vInfo > 0) then {
    _side = (_vInfo select 2);
};

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do 
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
	{
		player action ["SwitchWeapon", player, player, 100];   //EDIT
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	
    sleep 0.195;
    _cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};

};
	
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; [(format[localize "STR_NOTF_ImpoundingCancelled"]),"Hinweis","yellow"] call MSG_fnc_handle; life_action_inUse = false;};

if (player distance _vehicle > 10) exitWith {[(format[localize "STR_NOTF_ImpoundingCancelled"]),"Hinweis","yellow"] call MSG_fnc_handle; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};

if (count crew _vehicle isEqualTo 0) then {
    if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    life_impound_inuse = true;
	
	if (count _vInfo isEqualTo 0) then  
	{
		[_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];
	}
	else
	{	
		if (_side isEqualTo "civ") then 
		{
			[_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];
		}
		else
		{
			[_vehicle,false,player] remoteExec ["TON_fnc_vehicleStore",RSERV];
		};
	 };
	 
    waitUntil {!life_impound_inuse};
    
	_impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_impound_multiplier");
	_value = _price * _impoundMultiplier;
	[0,"STR_NOTF_HasImpounded",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	if (_vehicle in life_vehicles) then {
		[(format[localize "STR_NOTF_OwnImpounded",[_value] call life_fnc_numberText,_type]),"Hinweis","yellow"] call MSG_fnc_handle;
		BANK = BANK - _value;
	} else {
		[(format[localize "STR_NOTF_Impounded",_type,[_value] call life_fnc_numberText]),"Fahrzeug beschlagnahmt","green"] call MSG_fnc_handle;
		BANK = BANK + _value;
	};
	if (BANK < 0) then {BANK = 0;};
	[1] call SOCK_fnc_updatePartial;
} 
else 
{
    [(format[localize "STR_NOTF_ImpoundingCancelled"]),"Hinweis","yellow"] call MSG_fnc_handle;
};
if( _prof != "" ) then { 
	_exp = M_CONFIG(getNumber,"profession",_prof,"baseEXPgain");
	[_prof,_exp] call life_fnc_addExp;
};
life_action_inUse = false;
