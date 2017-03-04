_dealer_karten = [];
dealer_karten_control = [];
_meine_karten = [];
meine_karten_control = [];
_punkte_dealer = ((findDisplay 2300) displayCtrl 1100);
_punkte_meine = ((findDisplay 2300) displayCtrl 1101);
_status = ((findDisplay 2300) displayCtrl 1102);
_punkte_dealer ctrlShow false;
_punkte_meine ctrlShow false;
for "_i" from 1 to 10 do {
	if(_i < 10) then {
		_dealer_karten pushback (compile format["((findDisplay 2300) displayCtrl 120%1)",_i]);
	} else {
		_dealer_karten pushback (compile format["((findDisplay 2300) displayCtrl 12%1)",_i]);
	};
};
{
	dealer_karten_control pushback call _x;
}forEach _dealer_karten;

for "_i" from 1 to 10 do {
	if(_i < 10) then {
		_meine_karten pushback (compile format["((findDisplay 2300) displayCtrl 130%1)",_i]);
	} else {
		_meine_karten pushback (compile format["((findDisplay 2300) displayCtrl 13%1)",_i]);
	};
};
{
	meine_karten_control pushback call _x;
}forEach _meine_karten;

{
	_x ctrlShow false;
}forEach meine_karten_control;
{
	_x ctrlShow false;
}forEach dealer_karten_control;