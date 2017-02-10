#include "..\..\script_macros.hpp"
/*
 File: fn_craftCfg.sqf
 Author: EdgeKiller
 Description:
 Master configuration file for the crafting menu.
*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do {
 case "weapon": {
 _return = [
 //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
 ["hgun_P07_F", ["diamond_cut",2,"copper_refined",1]]
 ];
 if(FETCH_CONST(life_adminlevel) > 0) then {
 _return pushBack
 ["SMG_01_F", ["copper_refined",3,"iron_refined",3,"diamond_cut",1]];
 };
 };
 case "uniform": {
 _return = [
 //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
 ["U_IG_Guerilla1_1", ["copper_refined",1]]
 ];
 };
 case "backpack": {
 _return = [
 //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
 ["B_Carryall_oli", ["diamond_cut",1]]
 ];
 };
 case "item": {
 _return = [
 //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
 ["iron_refined", ["copper_refined",2]],
 ["diamond_cut", ["copper_refined",1,"iron_refined",1]]
 ];
 };
};
_return;