life_market_resources = [];
life_market_prices = [];
life_market_event = "";


life_market_resources = [_this,0,[],[[]]] call BIS_fnc_param;
life_market_event = [_this,1,"",[""]] call BIS_fnc_param;



{
	_event = _x;
	if((_event select 4) != 0) then
	{
		life_market_prices pushback [_event select 0, _event select 4];
	};
} foreach life_market_resources;


