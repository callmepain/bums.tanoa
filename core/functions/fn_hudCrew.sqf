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
						_vehicleInfo = [typeOf _vehicle] call life_fnc_fetchVehInfo; 
						_vehicleTankMax = _vehicleInfo select 12;					
						_fuel_old = fuel _vehicle;									
						_vehicleToFuel = (vehicle player);
						_veh = (typeOf _vehicleToFuel);
						
						switch(true) do
						{
							case (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) isEqualTo player) && (_vehicleToFuel isKindOf "Landvehicle") && (_vehicleToFuel != player) && (_veh in life_truck)):
							{
								_fuelConsumption = 0;
								_mass = getMass _vehicleToFuel;
								_vehiclespeed = speed _vehicleToFuel;
								_fuel_old = fuel _vehicle;
								_exp = (_mass / 10000) + exp(_vehiclespeed/80)+(cos((_vehiclespeed*(180/300))/5));
								if (_vehiclespeed < 10) then {
									_fuelConsumption = ((_exp * 2) / 17000);
								}else {
									_fuelConsumption = ((_exp * 3.5) / 17000);
								};
								_vehicleToFuel setFuel (_fuel_old - _fuelConsumption);
								_fuelConsumption = round(_fuelConsumption * 1000000)/100;
								_name = format ["%1<t size='0.85' color='#ffff00'>Dieselverbrauch: <t/><t color='#ff0000'>%3 Liter</t><br/><t size='1' color='#00ff00'>Insassen:</t><br/><img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x), (_fuelConsumption)]; 
							};
							case (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) isEqualTo player) && (_vehicleToFuel isKindOf "Landvehicle") && (_vehicleToFuel != player)):
							{
								_fuelConsumption = 0;
								_mass = getMass _vehicleToFuel;
								_vehiclespeed = speed _vehicleToFuel;
								_fuel_old = fuel _vehicle;
								_exp = (_mass / 10000) + (exp(_vehiclespeed/200))+((cos((_vehiclespeed*(180/1500)-1.571))/5));
								if (_vehiclespeed < 10) then {
									_fuelConsumption = ((_exp * 2) / 17000);
								}else {
									_fuelConsumption = ((_exp * 3.5) / 17000);
								};
								_vehicleToFuel setFuel (_fuel_old - _fuelConsumption);
								_fuelConsumption = round(_fuelConsumption * 1000000 * 2.5)/100;

								_name = format ["%1<t size='0.85' color='#ffff00'>Benzinverbrauch: <t/><t color='#ff0000'>%3 Liter</t><br/><t size='1' color='#00ff00'>Insassen:</t><br/><img size='0.7' color='#ff0000' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><t size='0.85' color='#ffff00'>   %2</t><br/>", _name, (name _x), (_fuelConsumption)]; 
							};
							case (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) isEqualTo player) && (_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player)):
							{
								_fuelConsumption = 0;
								_mass = getMass _vehicleToFuel;
								_vehiclespeed = speed _vehicleToFuel;
								_fuel_old = fuel _vehicle;
								_exp = (_mass / 3000) + (exp(_vehiclespeed/180))+(0.5*(cos((_vehiclespeed*(180/3.141))/8)));
								if (_vehiclespeed < 10) then {
									_fuelConsumption = ((_exp * 0.6) / 10000);
								}else {
									_fuelConsumption = ((_exp * 2) / 10000);
								};
								_vehicleToFuel setFuel (_fuel_old - _fuelConsumption);
								_fuelConsumption = round(_fuelConsumption * 1000000)/100;
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