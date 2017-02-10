#include <macro.h>
/*
	File: fn_economy_license.sqf
	
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];

disableSerialization;
if(!createDialog "Life_Market") exitWith {diag_log "!dialog";};

_display = findDisplay 2300;
_text = _display displayCtrl 2304;
_display displayCtrl 2301 ctrlSetStructuredText parseText "<t align='center'>Borderline-Life Lizenzpreisliste</t>";
_display displayCtrl 2302 ctrlSetStructuredText parseText "Lizenzübersicht";
_display displayCtrl 2303 ctrlSetStructuredText parseText "<t align='right'>Kaufpreis</t>";

_list = "";
_mylist = [];
{
	_license = _x select 0;
	
	if(!(_license in _mylist)) then
	{
		_mylist pushback _license;
				
		_licenseName = [_license] call life_fnc_varToStr;
		_licenseType = [_license,1] call life_fnc_licenseType select 0;
		_preis = [([_licenseType] call life_fnc_licensePrice)] call life_fnc_numberText;
	
		_list = _list + format["%1<t align='right'>%2€</t><br/>",_licenseName,_preis];

	};
} foreach life_licenses select 0;

_text ctrlSetStructuredText parseText format["%1",_list];