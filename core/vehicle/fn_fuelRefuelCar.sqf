#include "..\..\script_macros.hpp"
/*
    File: fn_fuelRefuelCar.sqf
    Author: NiiRoZz
	Edit by H4uklotz
	
    Description:
    Adds fuel in car.
*/
disableSerialization;
private ["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];

_modus = [_this,3,"",[""]] call BIS_fnc_param;

_exit1 = false;
_exit2 = false;

_kosten = 0;
_rechnung = 0;
_marker = "";
_car = "";

switch (_modus) do 
{
	default
	{
		_classname = lbData[20306,(lbCurSel 20306)];
		_index =  lbValue[20306,(lbCurSel 20306)];

		if (isNil "_classname" || _classname isEqualTo "") exitWith 
		{
			[(format[localize "STR_Select_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;
			vehiclefuelList = [];
			life_tanken = false;
			closeDialog 0;
		};

		closeDialog 0;

		_car = (vehiclefuelList select _index);
		_vehicleInfo = [_className]call life_fnc_fetchVehInfo;
		_fuelNow = fuel _car;
		if(_fuelNow >= 0.9) exitWith {["Dein Tank hat nicht genug Platz, um die Mindestabnahmemenge an Sprit aufzunehmen!","Hinweis","yellow"] call MSG_fnc_handle;};
		_fueltank = (_vehicleInfo select 12);
		_fueltoput= ((SliderPosition 20307)-(floor(_fuelnow * _fueltank)));
		_totalcost = round(_fueltoput * life_fuelPrices);
		
		if (_car distance player > 10 && !(isNull objectParent player)) exitWith 
		{
			[(format[localize "STR_Distance_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;
			vehiclefuelList = [];
			life_tanken = false;
			closeDialog 0;
		};

		if(isEngineOn _car) exitWith 
		{
			["Bist du irre ?!<br/>Ich nehme zwar gerne dein Geld, aber mach bitte den Motor aus.<br/> Zum einen schont es die Umwelt und zum anderen deinen Geldbeutel.<br/> Welcher Depp tankt schon mit laufenden Motor ?!","Hinweis","yellow"] call MSG_fnc_handle;	
		};

		_car setVariable ["betankung",true,true];
		//Setup our progress bar.
		disableSerialization;
		"progressBar" cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format[""];
		_progress progressSetPosition 0.01;
		_vehtype = typeOf _car;
		_durchfluss = 45;
		
		if(_vehtype in life_FahrenLKW) then 
		{
		_durchfluss = 120;
		};
		
		_dauer = (_fueltoput /_durchfluss)*60;
		_cpup = 1/_dauer;
		_cP = 0;
		_fuelup = ((_fueltoput / _fueltank) / _dauer);
		_setFuel = 0;
		
		for "_i" from 0 to 1 step 0 do 
		{
			sleep  1;
			_cP = _cP + _cpup;
			_setFuel = _setFuel + _fuelup;
			_progress progressSetPosition _cP;

			if((speed _car) > 0.1) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];[_car,_fuelNow + _setFuel] remoteExecCall ["life_fnc_setFuel",_car];};
			if(_cP >= 1) exitWith {_pgText ctrlSetText format["Betankung abgeschlossen."];[_car,_fuelNow + _setFuel] remoteExecCall ["life_fnc_setFuel",_car];};
			if (player distance _car > 10) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];[_car,_fuelNow + _setFuel] remoteExecCall ["life_fnc_setFuel",_car];};
			if !(isNull objectParent player) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];[_car,_fuelNow + _setFuel] remoteExecCall ["life_fnc_setFuel",_car];};
			_kosten = _kosten + (_cpup * _totalcost);

			_pgText ctrlSetText format ["%3 %1 %2 Preis: $%4",round(_cp * _fueltoput*100)/100,"Liter","Betankung läuft:",round(_kosten*100)/100];
		};
	};
	
	case "kanisterbenzin":
	{
		_preis = LIFE_SETTINGS(getNumber,"fuel_price_benzin");
		If(life_tanken) exitWith {hint "Du tankst schon dein Kanister auf!"};
		_action = 
		[
			format["Bist du sicher das du deinen Kanister auffüllen möchtest?<br />Dein Preis pro Liter beträgt: <t color='#FFFF00'> $%1</t>",_preis],
			"Kanister auftanken",
			"Tanken",
			"Nein Danke"
		] call BIS_fnc_guiMessage;
				
		if(_action) then {
			life_tanken = true;
			_title = "Betankung läuft: ";
			"progressBar" cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format[""];
			_progress progressSetPosition 0.01;
			_cP = 0;
			_liter = 0.1;
			_cpTankWert = (1 / (5 / _liter));
			sleep 1;

			for "_i" from 0 to 1 step 0 do 
			{
				if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
				{
					player action ["SwitchWeapon", player, player, 100]; 
					player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; 
					player playActionNow "stop";
					player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
					player playActionNow "stop";
					player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				};
				sleep 0.195;
				if(!(alive player)) exitWith {life_tanken = false;"progressBar" cutText ["","PLAIN"];};
				_kosten = _kosten + (_preis * _liter);
				_cP = _cP + _cpTankWert;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 %1 %2 Preis: $%4",(round((_cP * 5) * 100))/100,"Liter",_title, (round(_kosten * 100))/100];
				if(_cP >= 1) exitWith {_pgText ctrlSetText format["Betankung abgeschlossen."];};
				if(!alive player) exitWith {life_tanken = false;};
				if(life_interrupted) exitWith {life_tanken = false;};
				if(life_istazed) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."]; life_tanken = false;};
			};
			if(!([false,"fuelFBE",1] call life_fnc_handleInv)) exitWith {_exit2 = true;};
			if(!([true,"fuelFB5L",1] call life_fnc_handleInv)) exitWith {_exit2 = true;};
		};	
	};
	
	case "kanisterdiesel":
	{
	
		_preis = LIFE_SETTINGS(getNumber,"fuel_price_diesel");
		If(life_tanken) exitWith {hint "Du tankst schon dein Kanister auf!"};
		_action = 
		[
			format["Bist du sicher das du deinen Kanister auffüllen möchtest?<br />Dein Preis pro Liter beträgt:<t color='#FFFF00'> $%1</t>",_preis],
			"Kanister auftanken",
			"Tanken",
			"Nein Danke"
		] call BIS_fnc_guiMessage;
		
		
		if ((life_carryWeight + (["fuelFD25L"] call life_fnc_itemWeight)) <= life_maxWeight) then 
		{
			if(_action) then 
			{
				life_tanken = true;
				_title = "Betankung läuft: ";
				"progressBar" cutRsc ["life_progress","PLAIN"];
				_ui = uiNameSpace getVariable "life_progress";
				_progress = _ui displayCtrl 38201;
				_pgText = _ui displayCtrl 38202;
				_pgText ctrlSetText format[""];
				_progress progressSetPosition 0.01;
				_cP = 0;
				_liter = 1;
				_cpTankWert = (1 / (25 / _liter));
				sleep 1;

				for "_i" from 0 to 1 step 0 do 
				{
					if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
					{
						player action ["SwitchWeapon", player, player, 100]; 
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; 
						player playActionNow "stop";
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
						player playActionNow "stop";
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
					};

					sleep 0.195;
					if(!(alive player)) exitWith {life_tanken = false;"progressBar" cutText ["","PLAIN"];};
					_kosten = _kosten + (_preis * _liter);
					_cP = _cP + _cpTankWert;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 %1 %2 Preis: $%4",(round((_cP * 25) * 100))/100,"Liter",_title, (round(_kosten * 100))/100];
					if(_cP >= 1) exitWith {_pgText ctrlSetText format["Betankung abgeschlossen."];};
					if(!alive player) exitWith {life_tanken = false;};
					if(life_interrupted) exitWith {life_tanken = false;};
					if(life_istazed) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."]; life_tanken = false;};
				};
				if(!([false,"fuelFDE",1] call life_fnc_handleInv)) exitWith {_exit2 = true;};
				if(!([true,"fuelFD25L",1] call life_fnc_handleInv)) exitWith {_exit2 = true;};
			};
		}
		else
		{
			_exit1 = true;
		};
	};	
};

if(_exit1) exitWith
{
	life_tanken = false;
	["Du hast nicht genug Platz, um einen gefüllten Kanister zu transportieren","Hinweis","yellow"] call MSG_fnc_handle;	
};

if(_exit2) exitWith
{
	life_tanken = false;
	["Bei der Betankung ist etwas schiefgelaufen!","Fehler","red"] call MSG_fnc_handle;	
};

for "_i" from 0 to 50 step 1 do 
{
		_marker = format ["tankstelle_%1",_i];
		if ((player distance (getMarkerPos _marker)) < 40) exitWith 
		{
			_rechnung = player getVariable[format["%1",_marker],0];
		};
};

vehiclefuelList = [];
life_tanken = false;

if !(_car isEqualTo "") then 
{
	_car setVariable ["betankung",false,true];
	[_car] remoteExec ["TON_fnc_vehicleUpdate",RSERV];
};


_rechnung = _rechnung + floor _kosten;

if(_rechnung == 0) exitWith {life_tanken = false;"progressBar" cutText ["","PLAIN"];};
player setVariable[format["%1",_marker],_rechnung,true];

uiSleep 4;
"progressBar" cutText ["","PLAIN"];
[(format["Geh nun zur Kasse und bezahle deine Rechnung in Höhe von<br/><t color='#FFFF00'> $%1</t>.",[_rechnung] call life_fnc_numberText]),"Tankrechnung","green"] call MSG_fnc_handle;	

waitUntil{((player distance (getMarkerPos _marker)) > 40)};
[(format["Du hast noch 5 Minuten Zeit um deine Rechnung in Höhe von<br/><t color='#FFFF00'> $%1.</t><br/>zu bezahlen. Danach wirst du wegen Zechprellerei gesucht!",[_rechnung] call life_fnc_numberText]),"Hinweis","yellow"] call MSG_fnc_handle;	
[getPlayerUID player,player getVariable ["realname",name player],player,_marker,_rechnung] remoteExec ["life_fnc_wantedTanke",RSERV];
