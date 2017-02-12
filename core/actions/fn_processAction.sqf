#include "..\..\script_macros.hpp"
/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
* edity by: Hauklotz, CallmePain

* processMulitpleItems.sqf
* processes any number of input items into one output item. progress bar is from bryan "tonic" boardwines fn_processAction.sqf.
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 3: String - processor type
*
*/

private ["_inputItems", "_outputItem", "_inputItemsNeeded", "_outputItemAmount", "_itemsInv", "_itemsNeeded", "_inputItemsDeleted", "_ui", "_progress", "_pgText", "_cP", "_productionAmount", "_possibleProductionAmount","_processor","_formatedProcessingInfo","_hasLicense","_licenseNeeded","_processingCost","_type","_productionInfo"];

if (isDedicated) exitWith {};
sleep (random 1.00000);

if (life_is_processing) exitWith 
{
	["Der Kollege ist beschäftigt.<br/> Bitte nicht stressen!","Hinweis","yellow"] call MSG_fnc_handle;
};    

//parameter
_processor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_argument = [_this,3,[],[[]]] call BIS_fnc_param;
_type = (_argument select 0);
_prof = (_argument select 1);

diag_log format ["_prof %1",_prof];

//Error check. taken from tonic.
if(isNull _processor OR _type == "" OR (player distance _processor > 5)) exitWith {};
if(vehicle player != player) exitwith 
{
	["Du darfst nicht im Fahrzeug sitzen!","Hinweis","yellow"] call MSG_fnc_handle;
};

life_is_processing = true;

//define your production line here
_productionInfo = switch (_type) do
{
	case "cannabis": 				{[["cannabis"],[4],"marijuana",1,"herstellung",500]};
	case "cement": 				{[["rock"],[3],"cement",1,"herstellung",350]};
	case "cocaine":					{[["cocaine_unprocessed"],[4],"cocaine_processed",1,"cocaine",2000]};
	case "copper": 					{[["copper_unrefined"],[3],"copper_refined",1,"herstellung",2100]};
	case "diamond": 				{[["diamond_uncut"],[3],"diamond_cut",1,"herstellung",1750]};
	case "heroin": 					{[["heroin_unprocessed"],[4],"heroin_processed",1,"heroin",2100]};	
	case "iron": 						{[["iron_unrefined"],[3],"iron_refined",1,"herstellung",1120]};
	case "lsd": 						{[["lsd_unprocessed"],[4],"lsd_processed",1,"lsd",3000]};
	case "oil": 						{[["oil_unprocessed"],[3],"oil_processed",1,"herstellung",1200]};
	case "salt": 						{[["salt_unrefined"],[3],"salt_refined",1,"herstellung",450]};
	case "sand": 					{[["sand"],[2],"glass",1,"herstellung",650]};
	
	case "golderz": 				{[["golderz_unrefined"],[3],"golderz_refined",1,"herstellung",2100]};
	case "wood": 					{[["wood_unrefined"],[2],"wood_refined",1,"herstellung",2100]};
	case "silver": 					{[["silver_unrefined"],[3],"silver_refined",1,"herstellung",1750]};
	case "coal": 						{[["coal_unrefined"],[2],"coal_refined",1,"herstellung",1050]};
	
	case "stahl": 					{[["coal_refined","iron_refined"],[2,1],"stahlbarren_refined",1,"herstellung",5000]};
	case "platinbarren":			{[["golderz_refined","silver_refined"],[2,1],"platinbarren_refined",1,"herstellung",5000]};
	case "silberschmuck":		{[["silver_refined","diamond_cut"],[2,1],"silberschmuck_refined",1,"herstellung",5000]};//silberschmuck
	case "goldschmuck":			{[["golderz_refined","diamond_cut"],[2,1],"goldschmuck_refined",1,"herstellung",5000]};//goldschmuck
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

 _hasLicense = LICENSE_VALUE(_licenseNeeded,"civ");
_inputItemsDeleted = true;
_productionAmount = 9999; //infinite
_formatedProcessingInfo = "";
_action = true;

if ((count _inputItems) != (count _inputItemsNeeded)) exitWith 
	{diag_log format["ERROR: ProcessMultipleItems falsch initialisiert: Anzahl InputItems ungleich Anzahl InputItem Kosten"];life_is_processing = false;};

//check if the player has enough items and determine how much he can produce
for "_x" from 0 to ((count _inputItems) - 1) do 
{
	//get current amount player has
	_itemsInv = ITEM_VALUE(_inputItems select _x);
	_itemsNeeded = _inputItemsNeeded select _x;

	//calculate possible amount of processing cycles
	_possibleProductionAmount = floor (_itemsInv / _itemsNeeded);
	if (_possibleProductionAmount < _productionAmount) then {
		_productionAmount = _possibleProductionAmount;
	};
};

//exit if the player doenst have the required items for one process
if (_productionAmount < 1) exitWith {
	["Du hast nicht genug Materialien dabei","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
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
};

//exit if the player doenst have the required money for one process
if (_productionAmount < 1) exitWith {
	["Du hast nicht genug Geld dabei","Hinweis","yellow"] call MSG_fnc_handle;
	life_is_processing = false;
};

//Setup our progress bar. taken from tonic.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Bei der Herstellung."];
_progress progressSetPosition 0.01;
_cP = 0.01;
_time = 0.3;
_cpUp = 0.01;

_data  = SKILLSYSTEM_VALUE(_prof,"civ");
if( _prof != "" ) then {
	MININGTIME(_time,(_data select 0));
	PROCESSCP(_cpUp,(_data select 0));
};

//substract items 
for "_x" from 0 to ((count _inputItems) - 1) do {
	//reduce 
	if (!([false,(_inputItems select _x),((_inputItemsNeeded select _x) * _productionAmount)] call life_fnc_handleInv)) then {
		_inputItemsDeleted = false;
	}
};

//progress bar. taken from tonic.
while{true} do
{
	sleep  _time;
	_cP = _cP + _cpUp;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Bei der Herstellung."];
	 if(_cP >= 1) exitWith {_pgText ctrlSetText format["Herstellung abgeschlossen. Bitte Warten ...."]};
     if(player distance _processor > 10) exitWith {_pgText ctrlSetText format["Herstellung abgebrochen."];};
};

if(player distance _processor > 10) exitWith 
{
	
	life_is_processing = false;
	["Du hast dich zu weit entfernt!<br/>Bleib dichter dran","Hinweis","yellow"] call MSG_fnc_handle;
	for "_x" from 0 to ((count _inputItems) - 1) do {
	//readd 
		([true,(_inputItems select _x),((_inputItemsNeeded select _x) * _productionAmount)] call life_fnc_handleInv); 
	};
	sleep 2;
	5 cutText ["","PLAIN"]; 
};

//add new items if players items where deleted
if (_inputItemsDeleted) then {
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

	//add the new item
	if (!([true,_outputItem,(_outputItemAmount * _productionAmount)] call life_fnc_handleInv)) exitWith 
	{
		["Ups. Beim produzieren ist was schiefgelaufen.<br/> Irgendein Admin ist Schuld!","Fehler","red"] call MSG_fnc_handle;
		diag_log format["ERROR: fn_processMultipleItems - new item(s) are not added"];
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		life_is_processing = false;
	};

	5 cutText ["","PLAIN"];
	[_formatedProcessingInfo,"Rohstoffherstellung","green"] call MSG_fnc_handle;
};
if( _prof != "" ) then 
{ 
	[_prof,M_CONFIG(getNumber,"profession","Rohstoffabbau","baseEXPgain") * _productionAmount] call life_fnc_addExp;
};

life_is_processing = false;
