#include "..\..\script_macros.hpp"

_processor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_veh = nearestObject[getPos _processor,"car"];
_veh2 = typeOf _veh;

_carprice = M_CONFIG(getNumber,"LifeCfgVehicles",_veh2,"price");
_price = (_Carprice / 100) *5;

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
	[_veh,0] remoteExec ["TON_fnc_repairCar",0];
	[(format [ "Dein Auto wurde Repariert"]),"Reparatur","Green"] call MSG_fnc_handle;
}