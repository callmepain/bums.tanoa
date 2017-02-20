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
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbValue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname isEqualTo "") exitWith {
	[(format[localize "STR_Select_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;
    vehiclefuelList = [];
    life_tanken = false;
    closeDialog 0;
};

closeDialog 0;

_car = (vehiclefuelList select _index);
_vehicleInfo = [_className]call life_fnc_fetchVehInfo;
_fuelNow = fuel _car;
_fueltank = (_vehicleInfo select 12);
_fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
_setfuell = _fuelnow + (_fueltoput/_fueltank);
_timer = ((_fueltoput * .45)/100);
_totalcost = _fueltoput * life_fuelPrices;
_kosten = 0;
_rechnung = 0;
_marker = "";

if (_car distance player > 10 && !(isNull objectParent player)) exitWith {
	[(format[localize "STR_Distance_Vehicle_Pump"]),"Hinweis","yellow"] call MSG_fnc_handle;
    vehiclefuelList = [];
    life_tanken = false;
    closeDialog 0;
};

if(isEngineOn _car) exitWith 
{
	["Bist du irre ?!<br/>Ich nehme zwar gerne dein Geld, aber mach bitte den Motor aus.","Hinweis","yellow"] call MSG_fnc_handle;	
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
    _cP = 0.01;
    _tp =0;
	
    for "_i" from 0 to 1 step 0 do 
	{
        sleep  _timer;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
		
		if((speed _car) > 0.1) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];};
        if(_cP >= 1) exitWith {_pgText ctrlSetText format["Betankung abgeschlossen."];};
        if (player distance _car > 10) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];};
        if !(isNull objectParent player) exitWith {_pgText ctrlSetText format["Betankung abgebrochen."];};
		_kosten = _kosten + round((0.01 * _totalcost));
		_pgText ctrlSetText format ["%3		%1	%2		Preis:	$%4",round(_cp * _fueltoput*100)/100,"Liter","Betankung läuft:",[_kosten] call life_fnc_numberText];
        _tp = _tp +1;
        if (_tp == 9) then {
            _tp = 0;
            [_car,_fuelNow + (_cP * _setfuell)] remoteExecCall ["life_fnc_setFuel",_car];
        };
    };
    _kosten = _kosten + round((0.01 * _totalcost));

	
	
    // if (_car distance player > 10 || !(isNull objectParent player)) then {
        // hint localize "STR_Distance_Vehicle_Pump";
        // vehiclefuelList = [];
        // life_is_processing = false;
        // life_tanken = false;
        // [0] call SOCK_fnc_updatePartial;
        // closeDialog 0;
    // } else {
        // life_is_processing = false;
        // [0] call SOCK_fnc_updatePartial;
    // };
// } else {
    // hint localize "STR_NOTF_NotEnoughMoney";
// };

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
_car setVariable ["betankung",false,true];
_rechnung = _rechnung + round _kosten;
if(_rechnung == 0) exitWith {life_tanken = false;};
player setVariable[format["%1",_marker],_rechnung,true];
life_tanken = false;
sleep 4;
"progressBar" cutText ["","PLAIN"];

[(format["Geh nun zur Kasse und bezahle deine Rechnung in Höhe von $%1.",[_rechnung] call life_fnc_numberText]),"Tankrechnung","green"] call MSG_fnc_handle;	
// sleep (5*60);
// _rechnung = player getVariable[format["%1",_tankestelle],0];
// if(_rechnung == 0) exitWith {};
// _rechnung = _rechnung * 2;
// hint "Da du ja deine Rechnung nicht bezahlen wolltest, wirst du nun wegen Zechprellerei angezeigt!";
// [[getPlayerUID player,name player,"480",_rechnung],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
// player setVariable[format["%1",_tankestelle],0,true];
