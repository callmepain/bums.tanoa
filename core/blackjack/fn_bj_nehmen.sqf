_handle = []spawn {
	disableSerialization;
	_meine_karte = [];
	_dealer_karte = [];
	_meine_punkte = 0;
	_dealer_punkte = 0;
	_count_meine = count bj_meine_karte;
	_count_dealer = count bj_dealer_karte;
	_ctrl_meine = meine_karten_control select _count_meine;
	_ctrl_dealer = dealer_karten_control select _count_dealer;

	_btn_start = ((findDisplay 2300) displayCtrl 1602);
	_punkte_dealer = ((findDisplay 2300) displayCtrl 1100);
	_punkte_meine = ((findDisplay 2300) displayCtrl 1101);
	_btn_start = ((findDisplay 2300) displayCtrl 1602);
	_btn_genug = ((findDisplay 2300) displayCtrl 1601);
	_btn_nehmen = ((findDisplay 2300) displayCtrl 1600);
	_kohle = ((findDisplay 2300) displayCtrl 2100);
	_status = ((findDisplay 2300) displayCtrl 1102);

	_btn_nehmen ctrlEnable false;
	_btn_genug ctrlEnable false;
	///////////meine
	_meine_karte pushBack (selectRandom bj_karten);
	_ctrl_meine ctrlSetText (_meine_karte select 0 select 2);
	_ctrl_meine ctrlShow true;
	bj_meine_karte pushBack _meine_karte;
	bj_karten = bj_karten - _meine_karte;
	_meine_punkte = [0]call life_fnc_bj_get_punkte;
	if (_meine_punkte > 21) exitWith {

		_btn_nehmen ctrlShow false;
		_btn_genug ctrlShow false;
		_punkte_dealer ctrlShow true;
		_punkte_meine ctrlShow true;
		_btn_start ctrlShow true;
		_kohle ctrlShow true;
		_dealer_punkte = [1]call life_fnc_bj_get_punkte;
		call life_fnc_bj_end_dealer;
		_punkte_dealer ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_dealer_punkte];
		_punkte_meine ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_meine_punkte];
		life_cash = life_cash - (parseNumber bj_einsatz);
		_status ctrlSetStructuredText parseText format["<t align='center'>%1 -%2$     Aktuell: %3$</t>","Du hast verloren!",bj_einsatz,life_cash];
	};
	playSound "bj_card";
	sleep 0.5;
	//////////dealer
	_dealer_punkte = [1]call life_fnc_bj_get_punkte;
	if (_dealer_punkte < 17) then {
		_dealer_karte pushBack (selectRandom bj_karten);
		_ctrl_dealer ctrlSetText "textures\cards\rucken.paa";
		_ctrl_dealer ctrlShow true;
		bj_dealer_karte pushBack _dealer_karte;
		playSound "bj_card";
	};
	bj_karten = bj_karten - _dealer_karte;
	_dealer_punkte = [1]call life_fnc_bj_get_punkte;
	if (_dealer_punkte > 21) exitWith {
		call life_fnc_bj_end_dealer;
		_btn_nehmen ctrlShow false;
		_btn_genug ctrlShow false;
		_punkte_dealer ctrlShow true;
		_punkte_meine ctrlShow true;
		_btn_start ctrlShow true;
		_kohle ctrlShow true;
		_punkte_dealer ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_dealer_punkte];
		_punkte_meine ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_meine_punkte];
		life_cash = life_cash + (parseNumber bj_einsatz);
		_status ctrlSetStructuredText parseText format["<t align='center'>%1 +%2$     Aktuell: %3$</t>","Du hast gewonnen",bj_einsatz,life_cash];
	};
	sleep 0.5;
	_btn_nehmen ctrlEnable true;
	_btn_genug ctrlEnable true;	
};
