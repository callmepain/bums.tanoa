/*
	File: fn_jackhammerUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for jackhammer in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val","_dice"];
if(life_action_gather) exitWith {hint "Du führst schon eine Aktion aus."};
if(isNil "life_jackhammer_uses") then {life_jackhammer_uses = 0;};

_val = 0;
//_dice = round(random 5 max 1);
switch (true) do {
	case (player distance (getMarkerPos "lead_1") < 30): 			{_mine = "copperore";};
	case (player distance (getMarkerPos "lead_2") < 30): 			{_mine = "copperore";};
	case (player distance (getMarkerPos "iron_1") < 30): 			{_mine = "ironore";};
	case (player distance (getMarkerPos "iron_2") < 30): 			{_mine = "ironore";};
	case (player distance (getMarkerPos "salt_1") < 120) : 			{_mine = "salt";};
	case (player distance (getMarkerPos "sand_1") < 75) : 			{_mine = "sand";};
	case (player distance (getMarkerPos "diamond_1") < 30):			{_mine = "diamond";};
	case (player distance (getMarkerPos "oil_1") < 30) : 			{_mine = "oilu";};
	case (player distance (getMarkerPos "oil_2") < 30) : 			{_mine = "oilu";};
	case (player distance (getMarkerPos "rock_1") < 50): 			{_mine = "rock";};
	case (player distance (getMarkerPos "kohle") < 30) : 			{_mine = "kohleore";};
	case (player distance (getMarkerPos "gold") < 30) : 			{_mine = "goldore";};
	case (player distance (getMarkerPos "silber") < 30) : 			{_mine = "silberore";};
	default {_mine = "";};
};
if(_mine == "") exitWith {hint "Du bist nicht in der nähe einer Mine!"};
if(_mine == "sand") exitWith {hint "Du kannst den Presslufthammer hier nicht nutzen. Benutze bitte die Schaufel."};
if(_mine == "oilu") exitWith {hint "Du kannst den Presslufthammer hier nicht nutzen. Benutze bitte die Schaufel."};
if(vehicle player != player) exitWith {hint "Du kannst den Presslufthammer nicht im Auto benutzen!";};

_profName = [_mine] call life_fnc_profType;
_data = missionNamespace getVariable _profName;
if( _profName != "" ) then {
	_val = switch ( _data select 0 ) do {
		case 1: { round(random 5 max 1); };
		case 2: { round(random 5 max 1); };
		case 3: { round(random 6 max 2); };
		case 4: { round(random 6 max 2); };
		case 5: { round(random 6 max 2); };
		case 6: { round(random 7 max 3); };
		case 7: { round(random 7 max 3); };
		case 8: { round(random 7 max 3); };
		case 9: { round(random 8 max 4); };
		case 10: { round(random 8 max 5); };
	};
};
//Mine check

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll."};
life_action_gather = true;
player action ["SwitchWeapon", player, player, 100]; 
_time = 0;
_profName = [_mine] call life_fnc_profType;
if( _profName != "" ) then 
{
_data = missionNamespace getVariable (_profName);
_time = ( 3 - (0.25 * (_data select 0)));
diag_log format["(_data select 0) %1", (_data select 0)];
};
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";};
	player say3D "JackhammerSound";
	sleep _time;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %2 %1 abgebaut",_itemName,_diff],"PLAIN"];
	
	if( _profName != "" ) then 
	{
		[_profName,25] call life_fnc_addExp;
	};
};

life_jackhammer_uses = life_jackhammer_uses + 1;
life_action_gather = false;

if(life_jackhammer_uses == 40) then 
{
	hint "Dein Presslufthammer nutzt sich langsam ab. Du solltest dir bald eine neue besorgen.";
};
if(life_jackhammer_uses == 50) then 
{
	hint "Dein Presslufthammer ist schon sehr stark abgenutzt. Du brauchst einen neuen.";
};
if(life_jackhammer_uses >= 60) then 
{
	[false,"jackhammer",1] call life_fnc_handleInv;
	life_jackhammer_uses = 0;
	hint "Dein Presslufthammer ist so sehr abgenutzt, dass du ihn nicht mehr benutzen kannst.";
};

