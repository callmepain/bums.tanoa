{
	_ctrl_dealer = dealer_karten_control select _forEachIndex;
	_ctrl_dealer ctrlSetText (_x select 0 select 2);
}forEach bj_dealer_karte;