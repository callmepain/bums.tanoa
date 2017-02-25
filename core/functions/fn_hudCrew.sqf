#include "..\..\script_macros.hpp"
/*
    File: fn_hudCrew.sqf
    Author: H4uklotz / CallmePain
	
    Description:
	Zeigt die Fahrzeuginsassen an, setzt den Spritverbrauch und zeigt diesen an.
*/
   
   
Private ["_name","_vehicle","_vehname","_weapname","_exp","_weap","_target","_picture","_vehtarget","_azimuth","_wepdir","_hudnames","_ui"];   
	   
if (isDedicated) exitWith{};
[] spawn 
{
	for "_i" from 0 to 1 step 0 do 
	{
		if (isEngineOn vehicle player  && ((driver vehicle player ) isEqualTo player) && ((typeOf vehicle player) in life_FahrenPKW) && (vehicle player  != player) && (speed vehicle player > 10)) then
		{
			_exp = M_CONFIG(getNumber,"profession","PKW","baseEXPgain");
			if (floor (random 20) == 3) then {
				["PKW",_exp,floor(speed vehicle player)] call life_fnc_addExp;
			};
		};  
		sleep 1;
	};  
};  
[] spawn 
{
	for "_i" from 0 to 1 step 0 do 
	{
		if (isEngineOn vehicle player  && ((driver vehicle player ) isEqualTo player) && ((typeOf vehicle player) in life_FahrenLKW) && (vehicle player  != player) && (speed vehicle player > 10)) then
		{
			_exp = M_CONFIG(getNumber,"profession","LKW","baseEXPgain");
			if (floor (random 20) == 3) then {
				["LKW",_exp,floor(speed vehicle player)] call life_fnc_addExp;
			};
		};  
		sleep 1;
	};  
};  
[] spawn 
{
	for "_i" from 0 to 1 step 0 do 
	{
		if (isEngineOn vehicle player  && ((driver vehicle player ) isEqualTo player) && ((typeOf vehicle player) in life_Fahrenair) && (vehicle player  != player) && (speed vehicle player > 10)) then
		{
			_exp = M_CONFIG(getNumber,"profession","Fliegen","baseEXPgain");
			if (floor (random 20) == 3) then {
				["Fliegen",_exp,floor(speed vehicle player)] call life_fnc_addExp;
			};
		};  
		sleep 1;
	};  
};  
[] spawn 
{
	disableSerialization;
	for "_i" from 0 to 1 step 0 do  {

		 1000 cutRsc ["HudNames","PLAIN"];
		 _ui = uiNameSpace getVariable "HudNames";
		 _HudNames = _ui displayCtrl 99999;

		
		if(vehicle player != player) then
		{
			_name = "";
			_vehicle = assignedVehicle player;
			_vehname= getText (configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "DisplayName");
			_name = format ["<t color='#00ff00'>Fahrzeug: %1</t><br/>", _vehname];
			_exp = 0;
			_crewlist = "";
		
			{
				_crewlist = _crewlist + name _x + ",";
			}
			foreach crew cursorTarget;
						
			{
				if((driver _vehicle isEqualTo _x) || (gunner _vehicle isEqualTo _x)) then
				{
						
					if(driver _vehicle isEqualTo _x) then
					{
						_veh = (typeOf _vehicle);
						
						switch(true) do
						{
							case (isEngineOn _vehicle && ((driver _vehicle) isEqualTo player) && (_vehicle isKindOf "Landvehicle") && (_vehicle != player) && (_veh in life_FahrenLKW)):
							{
								_fuelConsumption = [_vehicle,"LKW"] call life_fnc_spritverbrauch;
								_name = format ["%1<t size='0.85' color='#ffff00'>Dieselverbrauch: <t/><t color='#ff0000'>%3 Liter</t><br/><t size='1' color='#00ff00'>Insassen:</t><br/><img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x), (_fuelConsumption)]; 
							};
							case (isEngineOn _vehicle && ((driver _vehicle) isEqualTo player) && (_vehicle isKindOf "Landvehicle") && (_vehicle != player) && (_veh in life_FahrenPKW)):
							{
								_fuelConsumption = [_vehicle,"PKW"] call life_fnc_spritverbrauch;
								_name = format ["%1<t size='0.85' color='#ffff00'>Benzinverbrauch: <t/><t color='#ff0000'>%3 Liter</t><br/><t size='1' color='#00ff00'>Insassen:</t><br/><img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x), (_fuelConsumption)]; 
							};
							case (isEngineOn _vehicle && ((driver _vehicle) isEqualTo player) && (_vehicle isKindOf "Air") && (_vehicle != player)):
							{
								_fuelConsumption = [_vehicle,"AIR"] call life_fnc_spritverbrauch;
								_name = format ["%1<t size='0.85' color='#ffff00'>Kerosinverbrauch: <t/><t color='#ff0000'>%3 Liter</t><br/><t size='1' color='#00ff00'>Insassen:</t><br/><img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x), (_fuelConsumption)]; 
							};
							
							default
							{
								_name = format ["%1<img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x)];
							};
						};
					}
					else
					{
						_target = cursorTarget;
						_picture = getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayname");
						_vehtarget =  format ["%1",_picture];
						_name = format ["%1<img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/><t size='0.85' color='#ffff00'> Ziel: </t><t size='0.85' color='#ff0000'>%3 %4</t><br/>", _name, (name _x), _vehtarget,_crewlist];
						
					};
				   
				}
				else
				{
					_name = format ["%1<img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x)];
				};  
				
				
				  
			} forEach crew _vehicle;

			_HudNames ctrlSetStructuredText parseText _name;
			_HudNames ctrlCommit 0;  
			sleep 1;
		};  
	};
};