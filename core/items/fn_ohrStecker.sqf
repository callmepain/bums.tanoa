

if (Life_ohrstecker) then {
	Life_ohrstecker = false;
	0.5 fadeSound 1;
	
	[true,"ohrstecker",1] call life_fnc_handleInv;
	
	player removeAction wakOnAction;
	
} else {
	Life_ohrstecker = true;
	0.5 fadeSound 0.1;
	wakOnAction = player addAction ["<t color='#ffff33'>Ohrstöpsel rausnehmen</t>", life_fnc_ohrStecker,player removeAction wakOnAction, -90, false, true, "", "_target == vehicle player"];
};