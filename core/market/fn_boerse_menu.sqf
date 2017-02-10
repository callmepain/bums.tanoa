/*
	File: fn_economymenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: OLLI
	
	Description:
	Menü für Börse
*/
#define Btn1 40002
#define Btn2 40003
#define Btn3 40004
#define Btn4 40005
#define Btn5 40006
#define Btn6 40007
#define Btn7 40008
#define Title 40001

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];

createDialog "economy_Menu";

disableSerialization;
_display = findDisplay 40000;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;

//Einkaufspreis
_Btn1 ctrlSetText "Einkaufspreise";
_Btn1 buttonSetAction "[] call life_fnc_boerse_buy";

//Verkaufspreis
_Btn2 ctrlSetText "Rohstoffverkaufspreise";
_Btn2 buttonSetAction "[] call life_fnc_openMarketView;";
// _Btn2 buttonSetAction "createDialog ""marketView""";
// _Btn2 buttonSetAction "[[player],""DB_fnc_queryBoerse"",false,false] spawn life_fnc_MP;";



//Fahrzeugpreis
_Btn3 ctrlSetText "Lizenzpreise";
_Btn3 buttonSetAction "[] call life_fnc_boerse_license";

//Lizenzpreis
_Btn4 ctrlSetText "Fahrzeugpreisliste";
_Btn4 buttonSetAction "[] call life_fnc_boerse_vehicle";
