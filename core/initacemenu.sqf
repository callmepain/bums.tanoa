#include "..\script_macros.hpp"
private ["_handle","_timeStamp"];
_timeStamp = diag_tickTime;

///////// delete self medic /////////////
[typeOf player, 1,["ACE_SelfActions","Medical"]] call ace_interact_menu_fnc_removeActionFromClass;
[typeOf player, 1,["ACE_SelfActions","Medical_Menu"]] call ace_interact_menu_fnc_removeActionFromClass;
[typeOf player, 0,["ACE_MainActions","Medical_Menu"]] call ace_interact_menu_fnc_removeActionFromClass;


[typeOf player, 0,["ACE_MainActions","ACE_GetDown"]] call ace_interact_menu_fnc_removeActionFromClass;
[typeOf player, 0,["ACE_MainActions","ACE_SendAway"]] call ace_interact_menu_fnc_removeActionFromClass;

/*         CIV ACE MENU         */
_action = ["Vehicle Repair","Repair Vehicle","icons\acemenu\ico_repair.paa",{_target spawn life_fnc_repairTruck},{life_inv_toolkit >= 1 && _target call life_fnc_isDamaged}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Vehicle Flip","Flip Car","icons\acemenu\ico_repair.paa",{_target setPos [(getPos _target select 0)+0.2, (getPos _target select 1)+0.2, (getPos _target select 2)+0.5];},{true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*_action = ["PushBoot","Boot Schieben","",{[] spawn life_fnc_pushObject},{(alive cursorTarget && {crew cursorTarget isEqualTo []} && {canMove cursorTarget})}] call ace_interact_menu_fnc_createAction;
["Ship", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;*/

/*         COP ACE MENU         */
_action1 = ["Cop menu", "Cop Menu", "icons\acemenu\ico_abzeichen.paa", {true}, {playerSide == west && isPlayer _target}] call ace_interact_menu_fnc_createAction; // add another custom node
[typeOf player, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToClass;
_action2 = ["CheckLicense","Lizenen Überprüfen","icons\acemenu\ico_license.paa",{[_player] remoteExecCall ["life_fnc_licenseCheck",_target]},{playerSide == west && _target isKindOf "Man"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 0, ["ACE_MainActions","Cop menu"], _action2] call ace_interact_menu_fnc_addActionToClass;
_action3 = ["Checkplayer","Spieler durchsuchen","icons\acemenu\ico_search.paa",{_target spawn life_fnc_searchAction},{playerSide == west && _target isKindOf "Man"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 0, ["ACE_MainActions","Cop menu"], _action3] call ace_interact_menu_fnc_addActionToClass;
_action4 = ["giveticket","Ticket ausstellen","icons\acemenu\ico_ticket.paa",{_target call life_fnc_ticketAction},{playerSide == west && _target isKindOf "Man"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 0, ["ACE_MainActions","Cop menu"], _action4] call ace_interact_menu_fnc_addActionToClass;
_action5 = ["arrest","Einsperren","icons\acemenu\ico_jail.paa",{_target call life_fnc_arrestAction},{playerSide == west && _target isKindOf "Man"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 0, ["ACE_MainActions","Cop menu"], _action5] call ace_interact_menu_fnc_addActionToClass;

/*         COP ACE MENU   car      */

_action = ["Cop car menu", "Cop Menu", "icons\acemenu\ico_abzeichen.paa", {true}, {playerSide == west &&  _target isKindOf "landVehicle"}] call ace_interact_menu_fnc_createAction; // add another custom node
["landVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Durchsuchen","Durchsuchen","icons\acemenu\ico_search.paa",{[_target] spawn life_fnc_vehInvSearch},{true}] call ace_interact_menu_fnc_createAction;
["landVehicle", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Zulassung","Zulassung Prüfen","icons\acemenu\ico_license.paa",{[_target] spawn life_fnc_searchVehAction},{true}] call ace_interact_menu_fnc_createAction;
["landVehicle", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["beschlagnahmen","beschlagnahmen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_impoundAction},{true}] call ace_interact_menu_fnc_createAction;
["landVehicle", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["rausziehn","Spieler Rausziehen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_pulloutAction},{true}] call ace_interact_menu_fnc_createAction;
["landVehicle", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*         COP ACE MENU   air      */

_action = ["Cop car menu", "Cop Menu", "icons\acemenu\ico_abzeichen.paa", {true}, {playerSide == west &&  _target isKindOf "Air"}] call ace_interact_menu_fnc_createAction; // add another custom node
["Air", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Durchsuchen","Durchsuchen","icons\acemenu\ico_search.paa",{[_target] spawn life_fnc_vehInvSearch},{true}] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Zulassung","Zulassung Prüfen","icons\acemenu\ico_license.paa",{[_target] spawn life_fnc_searchVehAction},{true}] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["beschlagnahmen","beschlagnahmen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_impoundAction},{true}] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["rausziehn","Spieler Rausziehen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_pulloutAction},{true}] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// /*         COP ACE MENU   ship      */

_action = ["Cop car menu", "Cop Menu", "icons\acemenu\ico_abzeichen.paa", {true}, {playerSide == west &&  _target isKindOf "Ship"}] call ace_interact_menu_fnc_createAction; // add another custom node
["Ship", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Durchsuchen","Durchsuchen","icons\acemenu\ico_search.paa",{[_target] spawn life_fnc_vehInvSearch},{true}] call ace_interact_menu_fnc_createAction;
["Ship", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Zulassung","Zulassung Prüfen","icons\acemenu\ico_license.paa",{[_target] spawn life_fnc_searchVehAction},{true}] call ace_interact_menu_fnc_createAction;
["Ship", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["beschlagnahmen","beschlagnahmen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_impoundAction},{true}] call ace_interact_menu_fnc_createAction;
["Ship", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["rausziehn","Spieler Rausziehen","icons\acemenu\ico_jail.paa",{[_target] spawn life_fnc_pulloutAction},{true}] call ace_interact_menu_fnc_createAction;
["Ship", 0, ["ACE_MainActions","Cop car menu"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*         Medic ACE MENU         */
_action = ["Bloodlevel","Blut berprüfen","icons\acemenu\ico_search.paa",{[(format ["Der Patient hat noch <br/> %1 Liter Blut!", [_target] call life_fnc_bloodcount]),"Hinweis","green"] call MSG_fnc_handle},{playerSide == independent/* && isPlayer _target*/}] call ace_interact_menu_fnc_createAction;
[typeOf player, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of ACE Menu Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";