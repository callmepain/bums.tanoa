waituntil {!isnil "bis_fnc_init"};
// if (isDedicated) exitwith {};
// if (isServer) exitwith {};
// waitUntil { !(isNull player) };
waitUntil { time > 0 };

IL_EV_Count = 0;
IL_Veh_Array = [];

systemChat "IgiLoad wird geladen, Bitte warten ......";
sleep (random 30);
systemChat format["IgiLoad wird Initialisiert für: %1",name Player];


_null = [Player] execVM "core\functions\IgiLoad\IgiLoad.sqf";
waitUntil {scriptDone _null};

sleep (random (IL_Check_Veh_Max - IL_Check_Veh_Min));

{
	if ((typeOf _x) in (IL_Supported_Vehicles_All)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] execVM "core\functions\IgiLoad\IgiLoad.sqf";
		waitUntil {scriptDone _null};
	};
} forEach (vehicles);

systemChat "IgiLoad geladen. Have fun :)";


while {true} do 
{
	sleep (IL_Check_Veh_Min + (random (IL_Check_Veh_Max - IL_Check_Veh_Min)));
	
	//Delete vehicles from "IL_Veh_Array" if not in "vehicles"
	{
		if !(_x in vehicles) then
		{
			IL_Veh_Array = IL_Veh_Array - [_x];
		};
	} forEach (IL_Veh_Array);
	{
		if (((typeOf _x) in (IL_Supported_Vehicles_All)) && !(_x in IL_Veh_Array)) then
		{
			IL_Veh_Array = IL_Veh_Array + [_x];
			_null = [_x] execVM "core\functions\IgiLoad\IgiLoad.sqf";
			waitUntil {scriptDone _null};
		};
	} forEach (vehicles);
};
