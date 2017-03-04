params [
    "_type"
];
_punkte = 0;
_ass = [];
if (_type isEqualTo 0) then {
	{
		_punkte = _punkte + (_x select 0 select 1);
		_ass pushback (_x select 0 select 1);
	}forEach bj_meine_karte;
	if (11 in _ass AND _punkte > 21) then {
		_count = {_x == 11} count _ass;
		_multi = 10 * _count;
		_punkte = _punkte - _multi;
	};
} else {
	{
		_punkte = _punkte + (_x select 0 select 1);
		_ass pushback (_x select 0 select 1);
	}forEach bj_dealer_karte;
	if (11 in _ass AND _punkte > 21) then {
		_count = {_x == 11} count _ass;
		_multi = 10 * _count;
		_punkte = _punkte - _multi;
	};
};
_punkte;