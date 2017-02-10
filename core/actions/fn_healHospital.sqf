#include "..\..\script_macros.hpp"
/*
    File: fn_healHospital.sqf
    Author: Bryan "Tonic" Boardwine
    Reworked: Jesse "TKCJesse" Schultz
	Edit by H4uklotz
	
	
    Description:
    Prompts user with a confirmation dialog to heal themselves.
    Used at the hospitals to restore health to full.
    Note: Dialog helps stop a few issues regarding money loss.
*/
private ["_healCost","_action"];
if (life_action_inUse) exitWith {};
_healCost = LIFE_SETTINGS(getNumber,"hospital_heal_fee");
if (CASH < _healCost) exitWith {[(format [localize "STR_NOTF_HS_NoCash",[_healCost] call life_fnc_numberText]),"Hinweis","Yellow"] call MSG_fnc_handle;};

life_action_inUse = true;
_action = [
    format [localize "STR_NOTF_HS_PopUp",[_healCost] call life_fnc_numberText],
    localize "STR_NOTF_HS_TITLE",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [(format [localize "STR_NOTF_HS_Healing"]),"Hinweis","Yellow"] call MSG_fnc_handle;
    closeDialog 0;
    uiSleep 8;
	
    if (player distance (_this select 0) > 5) exitWith {life_action_inUse = false; [(format [localize "STR_NOTF_HS_ToFar"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	
	[player] remoteExecCall ["TON_fnc_healplayer",RSERV];
	
	waitUntil {!life_action_inUse};
	[(format [localize "STR_NOTF_HS_Healed"]),"Hinweis","Green"] call MSG_fnc_handle;
	CASH = CASH - _healCost;
	life_action_inUse = false;
	[14] call SOCK_fnc_updatePartial;
} 
else 
{
    [(format [localize "STR_NOTF_ActionCancel"]),"Hinweis","Yellow"] call MSG_fnc_handle;
    closeDialog 0;
    life_action_inUse = false;
};
