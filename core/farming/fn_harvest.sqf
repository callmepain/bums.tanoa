_growprcnt = cursorobject getVariable "growprcnt";
if (_growprcnt == 100) Then {
	_plants_array = [
	["A3L_Wheat",1,"wheat",1,"A3L_Seed_wheat"],
	["A3L_Corn",2,"corn",1,"A3L_Seed_corn"],
	["A3L_Beans",3,"beans",1,"A3L_Seed_Beans"],
	["A3L_Cannabis",2,"cannabis",1,"A3L_Seed_Cannabis"],
	["A3L_Cotton",3,"cotton",1,"A3L_Seed_cotton"],
	["Ficus_Bush_1",2,"olive",1,"A3L_Seed_wheat"],
	["A3L_Pumpkin",0,"pumpkin",1,"A3L_Seed_Pumpkin"],
	["A3L_Sunflower",0,"sunflower",1,"A3L_Seed_sunflower"],
	["Oleander2",2,"poppy",1,"A3L_Seed_poppy"]
	];
	_player = player;
	_plant = cursorobject;
	_plantclsname = typeOf cursorobject;
	_arraypart = "0";
	{
		_selectedarray = _forEachIndex;
		_arrselplant = _x select 0;
		if(_plantclsname == _arrselplant) then {_arraypart = _selectedarray;};
	} foreach _plants_array;
	_newarray = _plants_array select _arraypart;
	_extra = _newarray select 1;
	_harvestitem = _newarray select 2;
	_itemvalue = _newarray select 3;
	_itemclassname = _newarray select 4;
	_extracalculator = random _extra;  
	_roundextra = round _extracalculator;
	_totalharvest = 1 + _roundextra * _itemvalue;
	if(([true,_harvestitem,_totalharvest] call life_fnc_handleInv)) then
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		deleteVehicle _plant;
		[format ["Du hast %1 abgebaut",_harvestitem],"Hinweis","green"] call MSG_fnc_handle;
		} else {
		["Dein Inventar ist voll","Hinweis","red"] call MSG_fnc_handle;
	};
} else {
if (_growprcnt < 10) Then {
["Diese Pflanze ist gerade erst gesetzt worden.Bleib doch mal locker...","Hinweis","blue"] call MSG_fnc_handle;
} else {
if (_growprcnt < 40) Then {
["Diese Pflanze is fast halb fertig gewachsen","Hinweis","blue"] call MSG_fnc_handle;
} else {
if (_growprcnt < 80) Then {
["Diese Pflanze ist mehr als halb fertig gewachsen","Hinweis","blue"] call MSG_fnc_handle;
} else {
if (_growprcnt < 100) Then {
["Diese Pflanze ist fast fertig zum abbauen","Hinweis","blue"] call MSG_fnc_handle;
};};};};};