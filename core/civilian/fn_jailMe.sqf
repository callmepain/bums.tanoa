#include "..\..\script_macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time","_kaution_time","_countDown_kaution_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; 
_kaution_time = [_this,3,0,[0]] call BIS_fnc_param;
life_bail_amount = [_this,4,0,[0]] call BIS_fnc_param;




if(_bad) then
{
	_time = _time * 1.5;
	
	if(_kaution_time > 0) then 
	{
		_kaution_time = _kaution_time * 1.5;
	};
};

if(_kaution_time > 0) then 
{
	player setVariable ["kaution",life_bail_amount,true];
	
	[_kaution_time] spawn
	{
		life_canpay_bail = false;
		_kaution_time = (_this select 0) * 60;
		sleep _kaution_time;			
		life_canpay_bail = nil;
		player setVariable ["canpay_bail ",true,true];
	};
}
else
{
	life_canpay_bail = false
};

_time = time + (_time * 60); //x Minutes
if(_kaution_time > 0) then {_kaution_time = time + (_kaution_time * 60)};

_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte Admin melden: JAIL_FALLBACK_15, time is zero!"; };

for "_i" from 0 to 1 step 0 do {

	if((round(_time - time)) > 0) then
	{
		if(_kaution_time > 0) then 
		{
			_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
			_countDown_kaution_time = [(_kaution_time - time),"MM:SS"] call BIS_fnc_secondsToString;
			player setVariable ["arrestZeit",_countDown,true];
			player setVariable ["kautionZeit",_countDown_kaution_time,true];

			hintSilent parseText format
			[
				"<t size='1.25' font='PuristaBold' align='center'>Restzeit:<br/><br/><t color='#FF0000'>%1</t>",
				_countDown
			];	
		}
		else
		{
			_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
			player setVariable ["arrestZeit",_countDown,true];
			
			hintSilent parseText format
			[
				"<t size='1.25' font='PuristaBold' align='center'>Restzeit:<br/><br/><t color='#FF0000'>%1</t>",
				_countDown
			];	
		};
	};
		
	 if (LIFE_SETTINGS(getNumber,"jail_forceWalk") isEqualTo 1) then {
        player forceWalk true;
    };

    private _escDist = [[["Altis", 60], ["Tanoa", 145]]] call TON_fnc_terrainSort;
    
    if (player distance (getMarkerPos "jail_marker") > _escDist) exitWith {
        _esc = true;
    };

    if !(player getVariable ["arrested",false]) exitWith {
        _bail = true;
    };

    if ((round(_time - time)) < 1) exitWith {hint ""};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    sleep 0.1;
	
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		player setVariable ["kaution",0,true];
		hintSilent "";
		[(format ["Deine Kaution wurde bezahlt und du bist nun wieder frei."]),"Hinweis","Green"] call MSG_fnc_handle;
		
		player setPos (getMarkerPos "jail_release");
		
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		
		[1] call SOCK_fnc_updatePartial;
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		player setVariable ["arrested",false,true];
		player setVariable ["canpay_bail ",false,true];
		player setVariable ["kaution",0,true];
		hintSilent "";
		[(format ["Du bist auf dem Gefängnis geflohen! Du wirst nun zusätlich auch wegen dem Gefängnisausbruch gesucht."]),"Hinweis","Yellow"] call MSG_fnc_handle;
        [0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		player setVariable ["arrested",false,true];
		player setVariable ["canpay_bail ",false,true];
		player setVariable ["kaution",0,true];
		hintSilent "";
		[(format ["Du hast deine Zeit abgessen und bist nun wieder Frei."]),"Hinweis","Green"] call MSG_fnc_handle;
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
};

player forceWalk false; // Enable running & jumping