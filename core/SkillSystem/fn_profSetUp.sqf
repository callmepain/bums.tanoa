#include "..\..\script_macros.hpp"
/*
    File: fn_profSetUp.sqf
    Original Author: Jacob "PapaBear" Tyler
    rewritten for list display by [midgetgrimm]
    Description:Opens GUI menu, but now is structured and pulls in life_prof based on having any and is selectable to view
*/
private["_dialog","_Names","_profText","_data","_profLevel","_profExp","_side"];
// createDialog "life_prof_dialog";
disableSerialization;
_dialog = findDisplay 7730;
_Names = _dialog displayCtrl 7731;
_Titel = _dialog displayCtrl 1100;
_Titel ctrlSetStructuredText parseText "Fahigkeiten";

lbClear _Names;
_side = "";
SIDEOFPLAYER(_side);
_SkillConfigs = "getText(_x >> 'side') isEqualTo _side" configClasses (missionConfigFile >> "profession");
{
	if(_side == "civ") then {
		//_Skills = _Skills + localize getText(_x >> "displayName") + "<br/>";
		_profText = localize getText(_x >> "displayName");
		_icon = getText(_x >> "icon");
		//_data = missionNamespace getVariable (_x select 0);
		_data = SKILLSYSTEM_VALUE(configName _x,_side);
		_profLevel = _data select 0;
		_profExp = _data select 1;
		_Names lbAdd format["%1",_profText];
		_Names lbSetData [(lbSize _Names)-1,str(_profText)];
		_Names lbSetPicture [(lbSize _Names)-1,_icon];
	};
	if(_side == "cop") then {
		//_Skills = _Skills + localize getText(_x >> "displayName") + "<br/>";
		_profText = localize getText(_x >> "displayName");
		_icon = getText(_x >> "icon");
		//_data = missionNamespace getVariable (_x select 0);
		_data = SKILLSYSTEM_VALUE(configName _x,_side);
		_profLevel = _data select 0;
		_profExp = _data select 1;
		_Names lbAdd format["%1",_profText];
		_Names lbSetData [(lbSize _Names)-1,str(_profText)];
		_Names lbSetPicture [(lbSize _Names)-1,_icon];
	};
	if(_side == "med") then {
		//_Skills = _Skills + localize getText(_x >> "displayName") + "<br/>";
		_profText = localize getText(_x >> "displayName");
		_icon = getText(_x >> "icon");
		//_data = missionNamespace getVariable (_x select 0);
		_data = SKILLSYSTEM_VALUE(configName _x,_side);
		_profLevel = _data select 0;
		_profExp = _data select 1;
		_Names lbAdd format["%1",_profText];
		_Names lbSetData [(lbSize _Names)-1,str(_profText)];
		_Names lbSetPicture [(lbSize _Names)-1,_icon];
	};
} forEach _SkillConfigs;
/*{
	if((_x select 1) == _side) then {
		_profText = (_x select 0);
		_icon = M_CONFIG(getText,"profession",_profText,"icon");	
		_data = missionNamespace getVariable (_x select 0);
		_profLevel = _data select 0;
		_profExp = _data select 1;
		_Names lbAdd format["%1",_profText];
		_Names lbSetData [(lbSize _Names)-1,str(_profText)];
		_Names lbSetPicture [(lbSize _Names)-1,_icon];
	};
} foreach life_prof; */