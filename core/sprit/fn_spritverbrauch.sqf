#include "..\..\script_macros.hpp"
params [
	["_veh",objNull,[objNull]],
	["_type","",[""]]
];
_side = "";
_level = 1;
SIDEOFPLAYER(_side);
if (_side isEqualTo "civ")then {
	_data = SKILLSYSTEM_VALUE(_type,_side);
	_level = (_data select 0);
};
_avb = M_CONFIG(getNumber,"Spritverbrauch",_type,"Ansitegverbrauch");
_apg = M_CONFIG(getNumber,"Spritverbrauch",_type,"amplitudegange");
_gange = M_CONFIG(getNumber,"Spritverbrauch",_type,"gange");
_xav = M_CONFIG(getNumber,"Spritverbrauch",_type,"xachsenverschiebung");
_vbm = M_CONFIG(getNumber,"Spritverbrauch",_type,"verbrauchsmulti");
_azf = M_CONFIG(getNumber,"Spritverbrauch",_type,"anzeigefaktor");
_lf = M_CONFIG(getNumber,"Spritverbrauch",_type,"levelfaktor");
_fuelConsumption = 0;
_mass = getMass _veh;
_vehiclespeed = speed _veh;
_fuel_old = fuel _veh;
_exp = (_mass / 10000) + (exp(_vehiclespeed/_avb))+((cos((_vehiclespeed*(180/_gange)-_xav))/_apg));
_fuelConsumption = ((_exp * _vbm)-((_level/_lf) / 100000));

_veh setFuel (_fuel_old - _fuelConsumption);
_fuelConsumption = round(_fuelConsumption * 1000000 * _azf)/100;

_fuelConsumption;