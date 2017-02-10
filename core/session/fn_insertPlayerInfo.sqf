#include "..\..\script_macros.hpp"
/*
    File: fn_insertPlayerInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Upon first join inital player data is sent to the server and added to the database.
    Setup data gets sent to life_server\Functions\MySQL\fn_insertRequest.sqf
*/
if (life_session_completed) exitWith {diag_log "life_session_completed!";}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;
private ["_bank"];

_bank_cop = LIFE_SETTINGS(getNumber,"bank_cop");
_bank_civ = LIFE_SETTINGS(getNumber,"bank_civ");
_bank_med = LIFE_SETTINGS(getNumber,"bank_med");
_bank_adac = LIFE_SETTINGS(getNumber,"bank_adac");


if (life_HC_isActive) then {
    [getPlayerUID player,profileName,CASH,_bank_cop,_bank_civ,_bank_med,_bank_adac,player] remoteExecCall ["HC_fnc_insertRequest",HC_Life];
} else {
    [getPlayerUID player,profileName,CASH,_bank_cop,_bank_civ,_bank_med,_bank_adac,player] remoteExecCall ["DB_fnc_insertRequest",RSERV];
};