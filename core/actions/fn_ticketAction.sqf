/*
    File: fn_ticketAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the ticketing process.
*/
params [
    ["_unit",objNull,[objNull]]
];
disableSerialization;
if (!(createDialog "life_ticket_give")) exitWith {[(format [localize "STR_Cop_TicketFail"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
if (isNull _unit || !isPlayer _unit) exitWith {};
ctrlSetText[2651,format [localize "STR_Cop_Ticket",_unit getVariable ["realname",name _unit]]];
life_ticket_unit = _unit;

