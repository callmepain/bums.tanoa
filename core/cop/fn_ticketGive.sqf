#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
if (isNil "life_ticket_unit") exitWith {hint localize "STR_Cop_TicketNil"};
if (isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};

private _val = ctrlText 2652;
disableSerialization;
// _dialog = findDisplay 2650;
// _Titel = _dialog displayCtrl 1100;
// _Titel ctrlSetStructuredText parseText "<t align='center'>Strafzettel geben</t>";
CONTROL(2650,1100) ctrlSetStructuredText parseText "<t align='center'>Strafzettel geben</t>";

if (!([_val] call TON_fnc_isnumber)) exitWith {[(format [localize "STR_Cop_TicketNum"]),"Hinweis","Yellow"] call MSG_fnc_handle;	};
if ((parseNumber _val) > 200000) exitWith {[(format [localize "STR_Cop_TicketOver100"]),"Hinweis","Yellow"] call MSG_fnc_handle;};

[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;


