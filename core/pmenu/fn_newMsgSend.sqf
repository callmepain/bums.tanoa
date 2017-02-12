#include "..\..\script_macros.hpp"
/*
	file: fn_newMsgSend.sqf 
	Author: Silex 
	Edit by H4uklotz
	
	Description:
	Sendet Nachrichten
*/
private["_to","_type","_playerData","_msg"];
disableSerialization;
_type = [_this,0,-1] call BIS_fnc_param;
_msg = [_this,1,"",[""]] call BIS_fnc_param;


ctrlShow[92000, false];
if(_msg == "") exitWith 
{
	["Du musst eine Nachricht eingeben!","Fehler","red"] call MSG_fnc_handle;
	ctrlShow[92000, true];
};

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
switch(_type) do
{ 
	//1 - msg send			92000
	case 1: 
	{ 		
		[life_smartphoneTarget,_msg,player,1] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",name life_smartphoneTarget,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88883;
	};
	
	//2 - medic send			92002
	case 2: 
	{ 
		[life_smartphoneTarget,_msg,player,2] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",name life_smartphoneTarget,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88883;

	};
	//3 - adac send			92003
	case 3: 
	{ 
		[life_smartphoneTarget,_msg,player,3] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",name life_smartphoneTarget,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88883;
	};
	//4 - admin send			92001
	case 4: 
	{
		[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",name life_smartphoneTarget,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88883;
	};
	//5 - cop send 			92004
	case 5: 
	{ 
		[life_smartphoneTarget,_msg,player,5] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",name life_smartphoneTarget,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88883;
	};
	
	//6 - msg an cops		93000
	case 6: 
	{ 
		if(({side _x == west} count playableUnits) == 0) exitWith 
		{
			["Zur Zeit sind keine Cops verfügbar.<br/>Bitte versuche es später erneut.","Hinweis","yellow"] call MSG_fnc_handle;
		};
				
		_to = "den Cops";
	
		[ObjNull,_msg,player,6] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",_to,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;
	};
	
	//7 - msg an medic		93002
	case 7: 
	{ 
		if(({side _x == independent} count playableUnits) == 0) exitWith 
		{			
			["Zur Zeit sind keine Medics verfügbar.<br/>Bitte versuche es später erneut.","Hinweis","yellow"] call MSG_fnc_handle;
		};
		_to = "den Medics";
		
		[ObjNull,_msg,player,7] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",_to,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;
	};
	
	//8 - msg an adac		93004
	case 8: 
	{ 
		if(({side _x == east} count playableUnits) == 0) exitWith 
		{
			
			["Zur Zeit ist kein ADAC verfügbar.<br/>Bitte versuche es später erneut.","Hinweis","yellow"] call MSG_fnc_handle;
		};
		_to = "dem ADAC";
	
		[ObjNull,_msg,player,8] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",_to,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;
	};
	
	//9 - msg an admins	93001
	case 9: 
	{ 
		_to = "den Admins";
		
		[ObjNull,_msg,player,9] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>%1<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%2<t> <t color='#FFFFFF'><t>",_to,_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;
	};
	
	//10 - cop an alle			93006
	case 10: 
	{ 
		[ObjNull,_msg,player,10] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>an alle<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%1<t> <t color='#FFFFFF'><t>",_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;

	};
	
	//11 - medic an alle		93007
	case 11: 
	{ 
		[ObjNull,_msg,player,11] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>an alle<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%1<t> <t color='#FFFFFF'><t>",_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;

	};
	
	//12 - adac an alle		93008
	case 12: 
	{ 
		[ObjNull,_msg,player,12] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>an alle<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%1<t> <t color='#FFFFFF'><t>",_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;

	};
	
	//13 - admin an alle 	93005 
	case 13: 
	{ 
		[ObjNull,_msg,player,13] remoteExec ["TON_fnc_handleMessages",RSERV];
		[(format["Du hast <br/><t color='#FFFF00'>an alle<t><br/><t color='#FFFFFF'> folgende Nachricht gesendet:<br/> <t color='#FFFF00'>%1<t> <t color='#FFFFFF'><t>",_msg]),"Nachricht gesendet","green"] call MSG_fnc_handle;
		closeDialog 88885;

	};
};