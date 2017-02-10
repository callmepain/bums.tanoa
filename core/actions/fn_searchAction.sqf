/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
[(format [localize "STR_NOTF_Searching"]),"Hinweis","Green"] call MSG_fnc_handle;
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {[(format [localize "STR_NOTF_CannotSearchPerson"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;

