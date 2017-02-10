#include "..\..\script_macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time","_kaution","_countDown_kaution"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80
_kaution = [_this,3,0,[0]] call BIS_fnc_param;
life_bail_amount = [_this,4,0,[0]] call BIS_fnc_param;

if(_bad) then
{
	_time = _time * 1.5;
	
	if(_kaution > 0) then 
	{
		_kaution = _kaution * 1.5;
	};
};


if(_kaution > 0) then 
{
	[_kaution] spawn
	{
		life_canpay_bail = false;
		_kaution = (_this select 0) * 60;
		// diag_log ["_kaution time",_kaution];
		sleep _kaution;			
		life_canpay_bail = nil;
	};
}
else
{
	life_canpay_bail = false
};



_time = time + (_time * 60); //x Minutes
if(_kaution > 0) then {_kaution = time + (_kaution * 60)};

_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte Admin melden: JAIL_FALLBACK_15, time is zero!"; };

for "_i" from 0 to 1 step 0 do {

	if((round(_time - time)) > 0) then
	{
		if(_kaution > 0) then 
		{
			_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
			_countDown_kaution = [(_kaution - time),"MM:SS"] call BIS_fnc_secondsToString;
			
			hintSilent parseText format[
				"
				<t size='1.25'>
				<t font='PuristaBold'>Restzeit:
				<br/>
				<br/>
				<t color='#FF0000'>%1</t>
				<br/>
				<br/>
				Kaution bezahlbar in:
				<br/>
				<br/>
				<t color='#FF0000'>%3</t>
				<br/>
				<br/>
				Kaution:
				<br/>
				<br/>
				<t color='#FF0000'>$%2</t>
				</t>
				</t>
				",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"<t color='#00FF00'>Zeit abgelaufen</t>"} else {_countDown_kaution} 
			];
		}
		else
		{
			_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
			hintSilent parseText format[
				"
				<t size='1.25'>
				<t font='PuristaBold'>Restzeit:
				<br/>
				<br/>
				<t color='#FF0000'>%1</t>
				<br/>
				<br/>
				Kaution bezahlbar:
				<br/>
				<br/>
				<t color='#FF0000'>NEIN</t>
				<br/>
				<br/>
				</t>
				</t>
				",
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

    if (life_bail_paid) exitWith {
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
		life_bail_paid = false;
		[(format ["Du hast die Kaution bezahlt und bist nun Frei."]),"Hinweis","Green"] call MSG_fnc_handle;
		
		player setPos (getMarkerPos "jail_release");
		
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		
		[1] call SOCK_fnc_updatePartial;
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		[(format ["Du bist auf dem Gefängnis geflohen! Du wirst nun zusätlich auch wegen dem Gefängnisausbruch gesucht."]),"Hinweis","Yellow"] call MSG_fnc_handle;
        [0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		[(format ["Du hast deine Zeit abgessen und bist nun wieder Frei."]),"Hinweis","Green"] call MSG_fnc_handle;
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};
};

player forceWalk false; // Enable running & jumping