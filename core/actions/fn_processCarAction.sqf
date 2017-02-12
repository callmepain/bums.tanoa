#include "..\..\script_macros.hpp"
/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
* edity by: Hauklotz, CallmePain
*
* processCarAction.sqf
* processes any number of input items into one output item. progress bar is from bryan "tonic" boardwines fn_processAction.sqf.
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 3: String - processor type
*
*/

private ["_inputItems", "_outputItem", "_inputItemsNeeded", "_outputItemAmount", "_itemsInv", "_itemsNeeded", "_inputItemsDeleted", "_ui", "_progress", "_pgText", "_cP", "_productionAmount", "_possibleProductionAmount","_processor","_formatedProcessingInfo","_hasLicense","_licenseNeeded","_processingCost","_type","_productionInfo","_count_car_inv"];
disableSerialization;
if (isDedicated) exitWith {};
sleep (random 1.00000);

if (life_is_processing) exitWith 
{
	["Der Kollege ist beschäftigt.<br/> Bitte nicht stressen!","Hinweis","yellow"] call MSG_fnc_handle;
};    

if((lbCurSel 39402) == -1) exitWith {[(format [localize "STR_Shop_Veh_DidntPick"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
_control = ((findDisplay 39400) displayCtrl 39402);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_vehicle = life_car select _vehicle;
if(isNull _vehicle) exitWith {};


if(_vehicle getVariable ["car_processing",false]) exitWith 
{
	[format[localize "STR_MISC_VehInvUse"],"Hinweis","yellow"] call MSG_fnc_handle;
};

closeDialog 0;


_processor = (life_car_processing select 0);
_type = (life_car_processing select 1);
_prof = (life_car_processing select 2);

//Error check. taken from tonic.
if(isNull _processor OR _type == "" OR (player distance _processor > 5)) exitWith {};


life_is_processing = true;
_vehicle setVariable["car_processing",true,true];

//define your production line here
_productionInfo = switch (_type) do
{

	case "cannabis": 					{[["cannabis"],[4],"marijuana",1,"marijuana",500]};
	case "cement": 						{[["rock"],[3],"cement",1,"herstellung",350]};
	case "cocaine":						{[["cocaine_unprocessed"],[4],"cocaine_processed",1,"cocaine",2000]};
	case "copper": 						{[["copper_unrefined"],[3],"copper_refined",1,"herstellung",2100]};
	case "diamond": 					{[["diamond_uncut"],[3],"diamond_cut",1,"herstellung",1750]};
	case "heroin": 						{[["heroin_unprocessed"],[4],"heroin_processed",1,"heroin",2100]};	
	case "iron": 							{[["iron_unrefined"],[3],"iron_refined",1,"herstellung",1120]};
	case "lsd": 								{[["lsd_unprocessed"],[4],"lsd_processed",1,"lsd",3000]};
	case "oil": 								{[["oil_unprocessed"],[3],"oil_processed",1,"herstellung",1200]};
	case "salt": 							{[["salt_unrefined"],[3],"salt_refined",1,"herstellung",450]};
	case "sand": 							{[["sand"],[2],"glass",1,"herstellung",650]};
	
	case "golderz": 						{[["golderz_unrefined"],[3],"golderz_refined",1,"herstellung",2100]};
	case "wood": 							{[["wood_unrefined"],[2],"wood_refined",1,"herstellung",2100]};
	case "silver": 							{[["silver_unrefined"],[3],"silver_refined",1,"herstellung",1750]};
	case "coal": 							{[["coal_unrefined"],[2],"coal_refined",1,"herstellung",1050]};
	
	case "stahl": 							{[["coal_refined","iron_refined"],[2,1],"stahlbarren_refined",1,"herstellung",5000]};
	case "platinbarren":				{[["golderz_refined","silver_refined"],[2,1],"platinbarren_refined",1,"herstellung",5000]};
	case "silberschmuck":			{[["silver_refined","diamond_cut"],[2,1],"silberschmuck_refined",1,"herstellung",5000]};//silberschmuck
	case "goldschmuck":				{[["golderz_refined","diamond_cut"],[2,1],"goldschmuck_refined",1,"herstellung",5000]};//goldschmuck
	case "brilliantschmuck":		{[["platinbarren_refined","diamond_cut"],[2,1],"brilliantschmuck_refined",1,"herstellung",5000]};//brilliantschmuck
	
	default {[]};
};

//initialize
_inputItems = _productionInfo select 0;
_inputItemsNeeded = _productionInfo select 1;
_outputItem = _productionInfo select 2;
_outputItemAmount = [(_productionInfo select 3),0,0,[0]] call BIS_fnc_param;
_licenseNeeded = _productionInfo select 4;
_processingCost = [(_productionInfo select 5),0,0,[0]] call BIS_fnc_param;
     
_car_inventory = (_vehicle getVariable ["Trunk",[]])select 0;

if ((count _car_inventory) == 0) exitWith 
{
	["Du hast nicht genug Materialien dabei","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};

_index = -1;
_index1 = -1;
_index2 = -1;
_count_car_inv = 0;
_car_x = [];
_shrt = "";
_itemWeight = 0;
_action = true;
_exit1 = false;
_exit2 = false;

if (count _inputItems < 2) then 
{
	_index = [(_inputItems select 0),_car_inventory] call TON_fnc_index;
} 
else 
{
	_index = [[[(_inputItems select 0),_car_inventory] call TON_fnc_index],[[(_inputItems select 1),_car_inventory] call TON_fnc_index]];
};     
     
     
 _hasLicense = LICENSE_VALUE(_licenseNeeded,"civ");
_inputItemsDeleted = true;
_productionAmount = 9999; //infinite
_formatedProcessingInfo = "";
     
if ((count _inputItems) != (count _inputItemsNeeded)) exitWith
{
	diag_log format["ERROR: ProcessMultipleItems falsch initialisiert: Anzahl InputItems ungleich Anzahl InputItem Kosten"];
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};

//process
if (count _inputItems < 2) then 
{
	if(_index == -1) exitWith {_exit1 = true};
	
	_car_x = _car_inventory select _index;
	_shrt = _car_x select 0;
	_count_car_inv = _car_x select 1;
	_itemWeight = (_inputItems call life_fnc_itemWeight) * (_car_inventory select _index select 1);
				    
	//calculate possible amount of processing cycles
	_possibleProductionAmount = floor (_count_car_inv / (_inputItemsNeeded select 0));
	if (_possibleProductionAmount < _productionAmount) then 
	{
		_productionAmount = _possibleProductionAmount;
	};
}
else 
{
	_index1 = (_index select 0) select 0;
	_index2 = (_index select 1) select 0;
	
	if(_index1 == -1) exitWith {_exit1 = true};
	if(_index2 == -1) exitWith {_exit2 = true};
	
	_car_x = [_car_inventory select _index1,_car_inventory select _index2];
	_shrt = [_car_x select 0 select 0,_car_x select 1 select 0];
	_count_car_inv = [_car_x select 0 select 1,_car_x select 1 select 1];
			 
	//calculate possible amount of processing cycles
	_possibleProductionAmount1 = floor ((_count_car_inv select 0) / (_inputItemsNeeded select 0));
	_possibleProductionAmount2 = floor ((_count_car_inv select 1) / (_inputItemsNeeded select 1));
	
	if (_possibleProductionAmount1 < _possibleProductionAmount2) then 
    {
        _productionAmount = _possibleProductionAmount1;
        _itemWeight = (((_inputItems select 0) call life_fnc_itemWeight) * (_productionAmount * (_inputItemsNeeded select 0)));
    }
	else 
    {
        _productionAmount = _possibleProductionAmount2;
        _itemWeight = (((_inputItems select 1) call life_fnc_itemWeight) * (_productionAmount * (_inputItemsNeeded select 1)));
    };
};

if(_exit1) exitWith 
{
	[(format["Du hast nicht genug Materialien dabei.<br/>Dir fehlen %1x %2<br/>um<br/>1x %3 herstellen zu können",(_inputItemsNeeded select 0),localize M_CONFIG(getText,"VirtualItems",( _inputItems select 0),"displayName"),localize M_CONFIG(getText,"VirtualItems",_outputItem,"displayName")]),"Hinweis","yellow"] call MSG_fnc_handle;
	
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};

if(_exit2) exitWith 
{
	[(format["Du hast nicht genug Materialien dabei.<br/>Dir fehlen %1x %2<br/>um<br/>1x %3 herstellen zu können",(_inputItemsNeeded select 1),localize M_CONFIG(getText,"VirtualItems",( _inputItems select 1),"displayName"),localize M_CONFIG(getText,"VirtualItems",_outputItem,"displayName")]),"Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};

//exit if the player doenst have the required items for one process
if (_productionAmount < 1) exitWith 
{
	["Du hast nicht genug Materialien dabei","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};


//check for cash if the player doesnt have the license and calculate possible max production
if (!_hasLicense) then 
{
	//determine max production by money
	if ((floor (CASH / _processingCost)) < _productionAmount) then 
	{
	_productionAmount = floor (CASH / _processingCost);
	};
	
	if (_productionAmount < 1) exitWith {};
	
	_action = 
	[
		format["Du hast keine Lizenz für die Herstellung.<br />Für das Herstellen werden dir:<br />%1€ berechnet.<br />Möchtest du das wirklich tun ?",[(_processingCost * _productionAmount)] call life_fnc_numberText],
		"Herstellung",
		"Ja",
		"Nein, Danke"
	] call BIS_fnc_guiMessage;
	
	
};
     
if(!_action) exitWith 
{
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};
//exit if the player doenst have the required money for one process
if (_productionAmount < 1) exitWith 
{
	["Du hast nicht genug Geld dabei","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
};

{
	if (count _inputItems < 2) then 
	{
		__iname = _x select 0;

		if(__iname in _inputItems) then
		{
			_index = [__iname,_car_inventory] call TON_fnc_index;
			_car_inventory set[_index,-1];
			_car_inventory = _car_inventory - [-1];
		};
	} 
	else 
	{
		__iname = _x select 0;
		
		if(__iname == (_inputItems select 0)) then
		{
			_index = [__iname,_car_inventory] call TON_fnc_index;
			_car_inventory set[_index,-1];
			_car_inventory = _car_inventory - [-1];
		};

		if(__iname == (_inputItems select 1)) then
		{
			_index = [__iname,_car_inventory] call TON_fnc_index;
			_car_inventory set[_index,-1];
			_car_inventory = _car_inventory - [-1];
		};
	};
} foreach _car_inventory; 

_vehicle setVariable["Trunk",[_car_inventory,1],true];

//Setup our progress bar. taken from tonic.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Bei der Herstellung."];
_progress progressSetPosition 0.01;
// _cP = 0.01;    
 _cP = 0;
_time = 0.3;
_cpUp = 0.01;
// _profName = [_type] call life_fnc_profType;
_data  = SKILLSYSTEM_VALUE(_prof,"civ");
if( _prof != "" ) then {
	MININGTIME(_time,(_data select 0));
	PROCESSCARCP(_cpUp,(_data select 0));
};
//progress bar. taken from tonic.
if (count _inputItems == 1) then {  
    while{true} do {
        sleep  _time;
        _cP = _cP + ((1 / _itemWeight )/_cpUp);
        // _cP = _cP + ((1 / 20 )/1.5);

        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Bei der Herstellung."];
        if(_cP >= 1) exitWith {_pgText ctrlSetText format["Herstellung abgeschlossen. Bitte Warten ...."]};
        if(player distance _processor > 20) exitWith {_pgText ctrlSetText format["Herstellung abgebrochen."];};
    };
} 
else {
    while{true} do {
        sleep  _time;
        _cP = _cP + ((1 / (_itemWeight * 1.2))/_cpUp);
		// _cP = _cP + ((1 / 20 )/1.5);
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Bei der Herstellung."];
        if(_cP >= 1) exitWith {_pgText ctrlSetText format["Herstellung abgeschlossen. Bitte Warten ...."]};
        if(player distance _processor > 20) exitWith {_pgText ctrlSetText format["Herstellung abgebrochen."];};
    };
};

//errorcheck distance
if(player distance _processor > 20) exitWith {
	["Du hast dich zu weit entfernt!<br/>Bleib dichter dran","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
	_vehicle setVariable["car_processing",false,true];
	
	if (count _inputItems < 2) then {
		_car_inventory pushBack [(_inputItems select 0),_count_car_inv];
		_vehicle setVariable["Trunk",[_car_inventory,1],true];
	} 
	else {
		_car_inventory = _car_inventory + [[(_inputItems select 0),(_count_car_inv select 0)],[(_inputItems select 1),(_count_car_inv select 1)]]; //fix 17_01_15
		_vehicle setVariable["Trunk",[_car_inventory,1],true];
	};
	sleep 2;
	5 cutText ["","PLAIN"]; 
};
    

//abziehen der verbauchten items

if (count _inputItems < 2) then {
	_amount = _count_car_inv - ((_inputItemsNeeded select 0) * _productionAmount);

	if (_amount > 0) then 
	{
		_car_inventory pushBack [(_inputItems select 0),_amount];
	};
} 
else {
	_amount = (_count_car_inv select 0) - ((_inputItemsNeeded select 0) * _productionAmount);
	if (_amount > 0) then 
	{
		_car_inventory pushBack [(_inputItems select 0),_amount];
	};

	_amount = (_count_car_inv select 1) - ((_inputItemsNeeded select 1) * _productionAmount);
	if (_amount > 0) then 
	{
		_car_inventory pushBack [(_inputItems select 1),_amount];
	};
};


//add new items
if (!_hasLicense) then {
		CASH = CASH - (_processingCost * _productionAmount);
		 //format output
		 _formatedProcessingInfo = "Du hast"; 
		 for "_x" from 0 to ((count _inputItems) - 2) do 
		 { 
		 _formatedProcessingInfo = _formatedProcessingInfo + format[" für $%3,<br/> %1x %2 und",((_inputItemsNeeded select _x) * _productionAmount),localize M_CONFIG(getText,"VirtualItems",( _inputItems select _x),"displayName"),(_processingCost * _productionAmount)]; 
		 }; 
		 _formatedProcessingInfo = _formatedProcessingInfo + format[" %1x %2<br/>zu<br/>%4x %3<br/>verarbeitet",((_inputItemsNeeded select ((count _inputItemsNeeded) - 1)) * _productionAmount),localize M_CONFIG(getText,"VirtualItems",(_inputItems select ((count _inputItems) - 1)),"displayName"),localize M_CONFIG(getText,"VirtualItems",_outputItem,"displayName") ,(_outputItemAmount * _productionAmount)]; 
	}
	else
	{
		//format output
		_formatedProcessingInfo = "Du hast<br/>";
		for "_x" from 0 to ((count _inputItems) - 2) do {
			_formatedProcessingInfo = _formatedProcessingInfo + format[" %1x %2 und",((_inputItemsNeeded select _x) * _productionAmount),(_inputItems select _x)]; //(_inputItems select _x)
		};
		_formatedProcessingInfo = _formatedProcessingInfo + format[" %1x %2<br/>zu<br/>%4x %3<br/>verarbeitet",((_inputItemsNeeded select ((count _inputItemsNeeded) - 1)) * _productionAmount),localize M_CONFIG(getText,"VirtualItems",(_inputItems select ((count _inputItems) - 1)),"displayName"),localize M_CONFIG(getText,"VirtualItems",_outputItem,"displayName") ,(_outputItemAmount * _productionAmount)]; 
	};

_index = [_outputItem,_car_inventory] call TON_fnc_index;
if(_index == -1) then {
	_car_inventory pushBack [_outputItem,(_outputItemAmount * _productionAmount)];
}
	else {
	_val = _car_inventory select _index select 1;
	_car_inventory set [_index,[_outputItem,(_val + (_outputItemAmount * _productionAmount))]];
};

_vehicle setVariable["Trunk",[_car_inventory,1],true];

5 cutText ["","PLAIN"];
[_formatedProcessingInfo,"Rohstoffherstellung","green"] call MSG_fnc_handle;

if( _prof != "" ) then { 
	[_prof,M_CONFIG(getNumber,"profession","Rohstoffabbau","baseEXPgain") * _productionAmount] call life_fnc_addExp;
};
life_is_processing = false;
_vehicle setVariable["car_processing",false,true];