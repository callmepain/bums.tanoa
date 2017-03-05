
_handle = []spawn {
	disableSerialization;
	_meine_karte = [];
	_dealer_punkte = 0;
	_meine_punkte = 0;
	_btn_start = ((findDisplay 2300) displayCtrl 1602);
	_punkte_dealer = ((findDisplay 2300) displayCtrl 1100);
	_punkte_meine = ((findDisplay 2300) displayCtrl 1101);
	_btn_start = ((findDisplay 2300) displayCtrl 1602);
	_btn_genug = ((findDisplay 2300) displayCtrl 1601);
	_btn_nehmen = ((findDisplay 2300) displayCtrl 1600);
	_kohle = ((findDisplay 2300) displayCtrl 2100);
	_status = ((findDisplay 2300) displayCtrl 1102);
	_btn_nehmen ctrlShow false;
	_btn_genug ctrlShow false;
		
	for "_i" from 0 to 1 step 0 do {
		bj_aktuell = [];
		_dealer_karte = [];
		_count = count bj_dealer_karte;
		_ctrl_dealer = dealer_karten_control select _count;
		_dealer_punkte = [1]call life_fnc_bj_get_punkte;
		if (_dealer_punkte < 17) then {
			_dealer_karte pushBack (selectRandom bj_karten);

			_ctrl_dealer ctrlSetText "textures\cards\rucken.paa";
			playSound "bj_card";
			_ctrl_dealer ctrlShow true;
			bj_dealer_karte pushBack _dealer_karte;
			bj_karten = bj_karten - _dealer_karte;
		}; 

		_dealer_punkte = [1]call life_fnc_bj_get_punkte;
		sleep 0.5;
		if (_dealer_punkte >= 17) exitWith {
			_meine_punkte = [0]call life_fnc_bj_get_punkte;
			_punkte_dealer ctrlShow true;
			_punkte_meine ctrlShow true;
			call life_fnc_bj_end_dealer;
			_punkte_dealer ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_dealer_punkte];
			_punkte_meine ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_meine_punkte];
			if((_meine_punkte <= 21) && (_dealer_punkte > 21)) then {
				_status ctrlSetStructuredText parseText format["<t align='center'>%1 +%2$</t>     <t align='right'>Aktuell: %3$</t>","Du hast gewonnen",bj_einsatz,[life_cash] call life_fnc_numberText];
				life_cash = life_cash + (parseNumber bj_einsatz);
			};
			if((_meine_punkte < _dealer_punkte) AND (_dealer_punkte > 21)) then {
				life_cash = life_cash + (parseNumber bj_einsatz);
				_status ctrlSetStructuredText parseText format["<t align='center'>%1 +%2$</t>     <t align='right'>Aktuell: %3$</t>","Du hast gewonnen",bj_einsatz,[life_cash] call life_fnc_numberText];
			};
			if((_meine_punkte > _dealer_punkte) AND (_dealer_punkte < 21) AND !(_meine_punkte > 21)) then {
				life_cash = life_cash + (parseNumber bj_einsatz);
				_status ctrlSetStructuredText parseText format["<t align='center'>%1 +%2$</t>     <t align='right'>Aktuell: %3$</t>","Du hast gewonnen",bj_einsatz,[life_cash] call life_fnc_numberText];
			};
			if(_meine_punkte isEqualTo _dealer_punkte) then {
				life_cash = life_cash - (parseNumber bj_einsatz);
				life_fed_bank_money = life_fed_bank_money + (parseNumber bj_einsatz);
				publicVariableServer "life_fed_bank_money";
				_status ctrlSetStructuredText parseText format["<t align='center'>%1 -%2$</t>     <t align='right'>Aktuell: %2$</t>","Unentschieden",bj_einsatz,[life_cash] call life_fnc_numberText];
			};
			if((_meine_punkte < _dealer_punkte) AND (_dealer_punkte <= 21))then {
				life_cash = life_cash - (parseNumber bj_einsatz);
				life_fed_bank_money = life_fed_bank_money + (parseNumber bj_einsatz);
				publicVariableServer "life_fed_bank_money";
				_status ctrlSetStructuredText parseText format["<t align='center'>%1 -%2$</t>    <t align='right'> Aktuell: %3$</t>","Du hast verloren",bj_einsatz,[life_cash] call life_fnc_numberText];
			};
		};
	};
	sleep 0.5;
	_btn_start ctrlShow true;
	_kohle ctrlShow true;	
};