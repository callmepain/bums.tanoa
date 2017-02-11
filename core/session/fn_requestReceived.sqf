#include "..\..\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
private _count = count _this;
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if (isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (count _this isEqualTo 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (!(getPlayerUID player isEqualTo (_this select 0))) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if (!isServer && (!isNil "life_adminlevel" || !isNil "life_coplevel" || !isNil "life_donorlevel" || !isNil "life_medlevel"|| !isNil "life_adaclevel")) exitWith {
    [profileName,getPlayerUID player,"VariablesAlreadySet"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
    [profileName,format ["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donorlevel: %3",life_adminlevel,life_coplevel,life_donorlevel,life_medlevel,life_adaclevel]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
    sleep 0.9;
    failMission "SpyGlass";
};

//Parse basic player information.
CASH = parseNumber (_this select 2);
BANK = parseNumber (_this select 3);

//Loop through licenses
if (count (_this select 4) > 0) then 
	{
		{missionNamespace setVariable [(_x select 0),(_x select 1)];
	} forEach (_this select 4);
};

//Lvl gedöns
CONST(life_coplevel,(_this select 5));
CONST(life_adminlevel,(_this select 6));
CONST(life_donorlevel,(_this select 7));
CONST(life_medlevel,(_this select 8));
CONST(life_adaclevel,(_this select 9));

//gear gedöns
life_gear = _this select 10;
[true] call life_fnc_loadGear;

//Parse side specific information.

if(playerSide == west) then
{
	life_blacklisted = _this select 11;
}
else
{
	life_is_arrested = _this select 11;
};

//positions gedöns
life_is_alive = _this select 12;
life_position = _this select 13;

//proof gedöns
if(count (_this select 14) > 0) then 
{
	{
		missionNamespace setVariable [SKILLSYSTEM_VARNAME(_x select 0,_x select 3),[parseNumber (_x select 1), parseNumber (_x select 2)]];
	} foreach (_this select 14);
	CONSTPROF(life_civpkw_level ,(SKILLSYSTEM_VALUE("PKW","civ") select 0));
	CONSTPROF(life_civlkw_level ,(SKILLSYSTEM_VALUE("LKW","civ") select 0));
	CONSTPROF(life_civair_level ,(SKILLSYSTEM_VALUE("Fliegen","civ") select 0));
	CONSTPROF(life_civabbau_level ,(SKILLSYSTEM_VALUE("Rohstoffabbau","civ") select 0));
};

//gang gedöns
life_gangData = _this select (_count - 2);
if(count life_gangData != 0) then 
{
	[] spawn life_fnc_initGang;
};


// housing gedöns
life_houses = [];
// life_houses = _this select (_count - 2);
// {
	// _house = nearestBuilding (call compile format["%1", _x select 0]);
	// life_vehicles pushBack _house;
// } foreach life_houses;
// [] spawn life_fnc_initHouses;



if (count (_this select (_count - 1)) > 0) then {
    {life_vehicles pushBack _x;} forEach (_this select (_count - 1));
};

// [[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;
// [getPlayerUID player] remoteExec ["TON_fnc_loadBounties",2];


if(playerSide isEqualTo civilian) then
{
	[getPlayerUID player] remoteExecCall ["TON_fnc_loadBounties",RSERV];
 };
 switch(playerSide) do
{
	case(west):
	{
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
		
		switch(FETCH_CONST(life_donorlevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 500;};
			case 2: {life_paycheck = life_paycheck + 600;};
			case 3: {life_paycheck = life_paycheck + 700;};
			case 4: {life_paycheck = life_paycheck + 800;};
			case 5: {life_paycheck = life_paycheck + 900;};
		};
		
		switch(FETCH_CONST(life_coplevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 100;};
			case 2: {life_paycheck = life_paycheck + 200;};
			case 3: {life_paycheck = life_paycheck + 300;};
			case 4: {life_paycheck = life_paycheck + 400;};
			case 5: {life_paycheck = life_paycheck + 500;};
			case 6: {life_paycheck = life_paycheck + 600;};
			case 7: {life_paycheck = life_paycheck + 700;};
			case 8: {life_paycheck = life_paycheck + 800;};
			case 9: {life_paycheck = life_paycheck + 900;};
			case 10: {life_paycheck = life_paycheck + 1000;};
			case 11: {life_paycheck = life_paycheck + 1100;};
			case 12: {life_paycheck = life_paycheck + 1200;};
		};	
	};
	
	case(independent):
	{
		 life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
		switch(FETCH_CONST(life_donorlevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 500;};
			case 2: {life_paycheck = life_paycheck + 600;};
			case 3: {life_paycheck = life_paycheck + 700;};
			case 4: {life_paycheck = life_paycheck + 800;};
			case 5: {life_paycheck = life_paycheck + 900;};
		};
		
		switch(FETCH_CONST(life_coplevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 100;};
			case 2: {life_paycheck = life_paycheck + 200;};
			case 3: {life_paycheck = life_paycheck + 300;};
			case 4: {life_paycheck = life_paycheck + 400;};
			case 5: {life_paycheck = life_paycheck + 500;};
			case 6: {life_paycheck = life_paycheck + 600;};
			case 7: {life_paycheck = life_paycheck + 700;};
			case 8: {life_paycheck = life_paycheck + 800;};
			case 9: {life_paycheck = life_paycheck + 900;};
			case 10: {life_paycheck = life_paycheck + 1000;};
			case 11: {life_paycheck = life_paycheck + 1100;};
			case 12: {life_paycheck = life_paycheck + 1200;};
		};	
	};
	
	case(east):
	{
		 life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_adac");
		switch(FETCH_CONST(life_donorlevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 500;};
			case 2: {life_paycheck = life_paycheck + 600;};
			case 3: {life_paycheck = life_paycheck + 700;};
			case 4: {life_paycheck = life_paycheck + 800;};
			case 5: {life_paycheck = life_paycheck + 900;};
		};
		
		switch(FETCH_CONST(life_adaclevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 100;};
			case 2: {life_paycheck = life_paycheck + 200;};
			case 3: {life_paycheck = life_paycheck + 300;};
			case 4: {life_paycheck = life_paycheck + 400;};
			case 5: {life_paycheck = life_paycheck + 500;};
			case 6: {life_paycheck = life_paycheck + 600;};
			case 7: {life_paycheck = life_paycheck + 700;};
			case 8: {life_paycheck = life_paycheck + 800;};
			case 9: {life_paycheck = life_paycheck + 900;};
			case 10: {life_paycheck = life_paycheck + 1000;};
			case 11: {life_paycheck = life_paycheck + 1100;};
			case 12: {life_paycheck = life_paycheck + 1200;};
		};	
	};
	
	default
	{
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
		switch(FETCH_CONST(life_donorlevel)) do
		{
			case 1: {life_paycheck = life_paycheck + 500;};
			case 2: {life_paycheck = life_paycheck + 600;};
			case 3: {life_paycheck = life_paycheck + 700;};
			case 4: {life_paycheck = life_paycheck + 800;};
			case 5: {life_paycheck = life_paycheck + 900;};
		};
	};
};
CONSTVAR(life_paycheck); //Make the paycheck static.
life_session_completed = true;
