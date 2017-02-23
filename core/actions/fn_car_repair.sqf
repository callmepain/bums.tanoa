#include "..\..\script_macros.hpp"
_index =  lbValue[39402,(lbCurSel 39402)];
_car = (life_car select _index);
_carprice = M_CONFIG(getNumber,"LifeCfgVehicles",(typeof _car),"price");
_repairmutli = LIFE_SETTINGS(getNumber,"vehicle_repair_multiplier");
_price = _Carprice * _repairmutli;

closeDialog 0;
_delete =
[
	format["Moechtest du dein Auto fuer %1 $ Reparieren?",_price],
	"Reparieren",
	"Ok",
	"Nein Danke"
] call BIS_fnc_guiMessage;
if (_delete) then {
	 if (_price > CASH) exitWith { [(format [ "Du hast zuwenig Kohle!"]),"Hinweis","Yellow"] call MSG_fnc_handle;};
	 CASH = CASH - _price;
	//[_veh,0] remoteExec ["TON_fnc_repairCar",-2];
	[_car] remoteExec ["TON_fnc_vehicleUpdate",RSERV];
	[_car, 0] call life_fnc_setHitIndex;
	[(format [ "Dein Auto wurde Repariert"]),"Reparatur","Green"] call MSG_fnc_handle;
}
