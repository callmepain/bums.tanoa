#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine
	Edit by H4uklotz
	
    Description:
    Does something with vehicle purchasing.
*/

params[
	["_mode",true,[true]],
	["_insure",false,[false]]
];
_check = [];
{
	_check pushback _x;
}forEach life_Container;
_check pushback "car";
_check pushback "air";
_check pushback "Ship";
if ((lbCurSel 2302) isEqualTo -1) exitWith 
{
	[(format [localize "STR_Shop_Veh_DidntPick"]),"Hinweis","Yellow"] call MSG_fnc_handle;
	closeDialog 0;
};

private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
// private _vehicleList = M_CONFIG(getArray,"CarShops",(life_veh_shop select 0),"vehicles");
// private _shopSide = M_CONFIG(getText,"CarShops",(life_veh_shop select 0),"side");


private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

private "_buyMultiplier";
private "_rentMultiplier";

_buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier");
_rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier");
_insureMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier");


private "_purchasePrice";


if (_mode) then 
{
	_purchasePrice = round(_initalPrice * _buyMultiplier);
} 
else 
{
	_purchasePrice = round(_initalPrice * _rentMultiplier);
};

if (_insure) then 
{
	_purchasePrice = round(_purchasePrice + ( _purchasePrice * _insureMultiplier));
};

private _conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith 
{
	[(format [localize "STR_Shop_Veh_NoLicense"]),"Hinweis","Yellow"] call MSG_fnc_handle;
	closeDialog 0;
};

private _colorIndex = lbValue[2304,(lbCurSel 2304)];

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (CASH < _purchasePrice) exitWith 
{
	[(format [localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CASH] call life_fnc_numberText]),"Hinweis","Yellow"] call MSG_fnc_handle;
};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if ((life_veh_shop select 0) == "med_air_hs") then {
    if (nearestObjects[(getMarkerPos _spawnPoints),["Air"],35] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
    //Check if there is multiple spawn points and find a suitable spawnpoint.
    if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {
            if ((nearestObjects[(getMarkerPos _x),_check,5]) isEqualTo []) exitWith {_spawnPoint = _x};
            true
        } count _spawnPoints;
    } else {
        if (nearestObjects[(getMarkerPos _spawnPoints),_check,5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};


if (_spawnPoint isEqualTo "") exitWith 
{
	[(format [localize "STR_Shop_Veh_Block"]),"Hinweis","Yellow"] call MSG_fnc_handle;
};

CASH = CASH - _purchasePrice;
[14] call SOCK_fnc_updatePartial;
life_fed_bank_money = life_fed_bank_money + (_purchasePrice);
publicVariableServer "life_fed_bank_money";

closeDialog 0; //Exit the menu.

if (_mode) then 
{
    if (_insure) then 
	{
		[(format["Du hast ein<br/><t color='#FFFF00'>%1</t><br/>für<br/><t color='#FFFF00'>$%2</t><br/>inkl. Versicherung gekauft.<br/><br/>Bitte warten.<br/>Der zuständige Mitarbeiter such noch den Schlüssel.<t>",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]),"Fahrzeug kauf","green"] call MSG_fnc_handle;
	}
	else
	{
		[(format["Du hast ein<br/><t color='#FFFF00'>%1</t><br/>für<br/><t color='#FFFF00'>$%2</t><br/>gekauft.<br/><br/>Bitte warten.<br/><br/>Der zuständige Mitarbeiter such noch den Schlüssel.<t>",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]),"Fahrzeug kauf","green"] call MSG_fnc_handle;
	};
} 
else
{
	[(format["Du hast ein<br/><t color='#FFFF00'>%1</t><br/>für<br/><t color='#FFFF00'>$%2</t><br/>gemietet.<br/><br/>Bitte warten.<br/><br/>Der zuständige Mitarbeiter such noch den Schlüssel.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]),"Fahrzeug kauf","green"] call MSG_fnc_handle;
};

uiSleep 1;
//Spawn the vehicle and prep it.

private "_vehicle";

_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
_vehicle setVariable ["BIS_enableRandomization", false];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle setPos (getMarkerPos _spawnPoint);
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);

_vehicle lock 2;

[_vehicle,_colorIndex] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"beladbar",true,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"betankung",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];

_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch (playerSide) do {
    case west: {
        [_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
    };
    case civilian: {
        if ((life_veh_shop select 2) isEqualTo "civ" && {_className == "B_Heli_Light_01_F"}) then {
            [_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
        };
    };
    case independent: {
        [_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
    };
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;

//Always handle key management by the server
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

if (_mode) then {
    if !(_className in LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly")) then 
	{
		if (_insure) then 
		{
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex,true] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
		}
		else
		{
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex,false] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
		};
    };
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_boughtVehicle_BEF",_className,[_purchasePrice] call life_fnc_numberText,[CASH] call life_fnc_numberText,[BANK] call life_fnc_numberText];
    } else {
        advanced_log = format [localize "STR_DL_AL_boughtVehicle",profileName,(getPlayerUID player),_className,[_purchasePrice] call life_fnc_numberText,[CASH] call life_fnc_numberText,[BANK] call life_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};


true;
