/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";
[] execvm "core\functions\fn_hudCrew.sqf";
[] execvm "core\functions\fn_effects.sqf";
[] execVM "core\mapmarker.sqf";
StartProgress = true;
