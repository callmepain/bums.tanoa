///////1 = karo      2 = herz       3 = pik          4 = kreuz

if(!createDialog "Life_Black_Jack") exitWith {[(format [localize "STR_MISC_DialogError"]),"Hinweis","Yellow"] call MSG_fnc_handle;}; //Couldn't create the menu?
disableSerialization;
_kohle_array = [100,500,1000,5000,10000,50000,100000];
call life_fnc_bj_clear;
_punkte_dealer = ((findDisplay 2300) displayCtrl 1100);
_punkte_meine = ((findDisplay 2300) displayCtrl 1101);
_btn_start = ((findDisplay 2300) displayCtrl 1602);
_btn_genug = ((findDisplay 2300) displayCtrl 1601);
_btn_nehmen = ((findDisplay 2300) displayCtrl 1600);
_status = ((findDisplay 2300) displayCtrl 1102);
_titel = ((findDisplay 2300) displayCtrl 1104);
_kohle = ((findDisplay 2300) displayCtrl 2100);

lbClear _kohle;
_btn_nehmen ctrlShow false;
_btn_genug ctrlShow false;
_punkte_dealer ctrlShow false;
_punkte_meine ctrlShow false;
{
	_kohle lbAdd format ["%1",_x];
	_kohle lbSetData [(lbSize _kohle)-1, str _x];
} forEach _kohle_array;
_status ctrlSetStructuredText parseText format["<t align='center'>Aktuell: %1$</t>",life_cash];
_btn_start ctrlSetStructuredText parseText "<t align='center'>Spiel Starten</t>";
_titel ctrlSetStructuredText parseText "<t align='center'>Black Jack ohne Nutten v.1_0</t>";