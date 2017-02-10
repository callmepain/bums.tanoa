#include "..\..\script_macros.hpp"
/*
	file: fn_newMsgInit.sqf 
	Author: Silex 
	Edit by H4uklotz
	
	Description:
	Init für neue Nachrichten
*/
private["_to","_type","_playerData","_msg"];
disableSerialization;

/*
msg an spieler
1 - msg send			92000
2 - medic send			92002
3 - adac send			92003
4 - admin send			92001
5 - cop send 			92004

msg an fraktionen
6 - msg an cops		93000
7 - msg an medic		93002
8 - msg an adac		93004
9 - msg an admins	93001

msg von fraktionen
10 - cop an alle			93006
11 - medic an alle		93007
12 - adac an alle		93008
13 - admin an alle 	93005
*/	




if((FETCH_CONST(life_adminlevel) < 1)) then 
{
	ctrlShow[92001,false];		
	ctrlShow[93005,false];		
} 
else 
{ 
	ctrlShow[92001,true];
	ctrlShow[93005,true];	
};

if(playerSide isEqualTo west) then
{
		
	ctrlShow[92004,true];
	ctrlShow[93006,true];	
} 
else 
{ 
	ctrlShow[92004,false];		
	ctrlShow[93006,false];	
};

if(playerSide isEqualTo independent) then
{
		
	ctrlShow[92002,true];
	ctrlShow[93007,true];	
} 
else 
{ 
	ctrlShow[92002,false];		
	ctrlShow[93007,false];	
};

if(playerSide isEqualTo east) then
{
		
	ctrlShow[92003,true];
	ctrlShow[93008,true];	
} 
else 
{ 
	ctrlShow[92003,false];		
	ctrlShow[93008,false];	
};


if(!isNull findDisplay 88883) then 
{

	if(isNUll life_smartphoneTarget) exitWith 
	{
		hint format["No person selected!"];
	};
	
	
	_display = findDisplay 88883;
	_Titel = _display displayCtrl 2100;
	_send = _display displayCtrl 92000;
	_medic = _display displayCtrl 92002;
	_adac = _display displayCtrl 92003;
	_admin = _display displayCtrl 92001;
	_cop = _display displayCtrl 92004;
	
	_Titel ctrlSetStructuredText parseText format["<t align='center'>iMessage schreiben</t>"];
	_send ctrlSetStructuredText parseText format["<t align='center'>iMessage senden</t>"];
	_medic ctrlSetStructuredText parseText format["<t align='center'>Medic-iMessage schreiben</t>"];
	_adac ctrlSetStructuredText parseText format["<t align='center'>ADAC-iMessage schreiben</t>"];
	_admin ctrlSetStructuredText parseText format["<t align='center'>Admin-iMessage schreiben</t>"];
	_cop ctrlSetStructuredText parseText format["<t align='center'>Cop-iMessage schreiben</t>"];
	
	ctrlEnable[92000,false];
	ctrlEnable[92001,false];
	ctrlEnable[92002,false];
	ctrlEnable[92003,false];
	ctrlEnable[92004,false];

	[] spawn
	{
		disableSerialization;
		_display = findDisplay 88883;
		_Limit = _display displayCtrl 2101;
				
		for "_i" from 0 to 1 step 0 do
		{
		
			if ((count (ctrlText 88884)) <=400) then 
			{
				_Limit ctrlSetStructuredText parseText format["<t align='left'>Zeichenlimit beachten!</t><t align='right'>Zeichen: <t color='#8cff9b'>%1 | 400</t></t>",(count (ctrlText 88884))];
				ctrlEnable[92000,true];
				ctrlEnable[92001,true];
				ctrlEnable[92002,true];
				ctrlEnable[92003,true];
				ctrlEnable[92004,true];
			}
			else
			{
				_Limit ctrlSetStructuredText parseText format["<t align='left'>Zeichenlimit beachten!</t><t align='right'>Zeichen: <t color='#FF0000'>%1 | 400</t></t>",(count (ctrlText 88884))];
				ctrlEnable[92000,false];
				ctrlEnable[92001,false];
				ctrlEnable[92002,false];
				ctrlEnable[92003,false];
				ctrlEnable[92004,false];
			};
					
			sleep 0.1;
		};
	};
};

if(!isNull findDisplay 88885) then 
{
	_display = findDisplay 88885;
	_Titel = _display displayCtrl 3100;
	_msgToCop = _display displayCtrl 93000;
	_msgToMedic = _display displayCtrl 93002;
	_msgToAdac = _display displayCtrl 93004;
	_msgToAdmin = _display displayCtrl 93001;
	_msgFromCop = _display displayCtrl 93006;
	_msgFromMedic = _display displayCtrl 93007;
	_msgFromAdac = _display displayCtrl 93008;
	_msgFromAdmin = _display displayCtrl 93005;
	
	_Titel ctrlSetStructuredText parseText format["<t align='center'>iMessage schreiben</t>"];
	_msgToCop ctrlSetStructuredText parseText format["<t align='center'>iMessage an Cops senden</t>"];
	_msgToMedic ctrlSetStructuredText parseText format["<t align='center'>iMessage an Medic senden</t>"];
	_msgToAdac ctrlSetStructuredText parseText format["<t align='center'>iMessage an ADAC senden</t>"];
	_msgToAdmin ctrlSetStructuredText parseText format["<t align='center'>iMessage an Admin senden</t>"];
	_msgFromCop ctrlSetStructuredText parseText format["<t align='center'>Cop-iMessage an alle senden</t>"];
	_msgFromMedic ctrlSetStructuredText parseText format["<t align='center'>Medic-iMessage an alle senden</t>"];
	_msgFromAdac ctrlSetStructuredText parseText format["<t align='center'>ADAC-iMessage an alle senden</t>"];
	_msgFromAdmin ctrlSetStructuredText parseText format["<t align='center'>Admin-iMessage an alle senden</t>"];

	ctrlEnable[93000,false];
	ctrlEnable[93001,false];
	ctrlEnable[93002,false];
	ctrlEnable[93003,false];
	ctrlEnable[93004,false];
	ctrlEnable[93005,false];
	ctrlEnable[93006,false];
	ctrlEnable[93007,false];
	ctrlEnable[93008,false];
	
	[] spawn
	{
		disableSerialization;
		_display = findDisplay 88885;
		_Limit = _display displayCtrl 3101;
		
		for "_i" from 0 to 1 step 0 do
		{
		
			if ((count (ctrlText 88886)) <=400) then 
			{
				_Limit ctrlSetStructuredText parseText format["<t align='left'>Zeichenlimit beachten!</t><t align='right'>Zeichen: <t color='#8cff9b'>%1 | 400</t></t>",(count (ctrlText 88886))];
				ctrlEnable[93000,true];
				ctrlEnable[93001,true];
				ctrlEnable[93002,true];
				ctrlEnable[93003,true];
				ctrlEnable[93004,true];
				ctrlEnable[93005,true];
				ctrlEnable[93006,true];
				ctrlEnable[93007,true];
				ctrlEnable[93008,true];

			}
			else
			{
				_Limit ctrlSetStructuredText parseText format["<t align='left'>Zeichenlimit beachten!</t><t align='right'>Zeichen: <t color='#FF0000'>%1 | 400</t></t>",(count (ctrlText 88886))];
				ctrlEnable[93000,false];
				ctrlEnable[93001,false];
				ctrlEnable[93002,false];
				ctrlEnable[93003,false];
				ctrlEnable[93004,false];
				ctrlEnable[93005,false];
				ctrlEnable[93006,false];
				ctrlEnable[93007,false];
				ctrlEnable[93008,false];
			};
					
			sleep 0.1;
		};
	};
};