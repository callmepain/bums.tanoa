params [
    "_count"
];
_handle = _count spawn {
	disableSerialization;
	_meine_karte = [];
	_dealer_karte = [];
	_this = _this -1;
	_ctrl_meine = meine_karten_control select _this;
	_ctrl_dealer = dealer_karten_control select _this;

	///////////meine
	_meine_karte pushBack (selectRandom bj_karten);
	_ctrl_meine ctrlSetText (_meine_karte select 0 select 2);
	_ctrl_meine ctrlShow true;
	bj_meine_karte pushBack _meine_karte;
	bj_karten = bj_karten - _meine_karte;
	playSound "bj_card";
	sleep 0.5;
	//////////dealer

	_dealer_karte pushBack (selectRandom bj_karten);
	_ctrl_dealer ctrlSetText "textures\cards\rucken.paa";
	_ctrl_dealer ctrlShow true;
	bj_dealer_karte pushBack _dealer_karte;
	bj_karten = bj_karten - _dealer_karte;
	playSound "bj_card";
};