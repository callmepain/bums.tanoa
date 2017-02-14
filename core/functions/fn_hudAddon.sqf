ICE_HUD = 
{
    waitUntil {!isNull player};
    if (!local Player) exitWith {};

	disableSerialization; 
    ("ICE_Layer" call BIS_fnc_rscLayer) cutRsc ["TAG_ICEHUD","PLAIN"];
	
    _display = uiNamespace getVariable "TAG_ICE_display"; 
    _ctrlDir = _display displayCtrl 520500; 
    _ctrlFps = _display displayCtrl 520501;
	_ctrlHps = _display displayCtrl 520502;
	_ctrlSta = _display displayCtrl 520503;
	_ctrlSvr = _display displayCtrl 520504;
		
    private "_heading";
    while {!isNull _display} do 
	{
	
		if(alive player) then
		{
		
			sleep 0.1;
			_ctrlFps ctrlSetText format ["%1 FPS", round diag_fps];
			_ctrlFps ctrlSetTextColor 	[0,1,0,1];
			_ctrlHps ctrlSetText format ["%1%2", round((1 - (damage player)) * 100), "%"];
			_ctrlSta ctrlSetText format ["%1%2", round((1 - (getFatigue player)) * 100), "%"];
			_ctrlSvr ctrlSetText format["Cops: %1 | Civs: %2 | Medic: %3 | ADAC: %4 | ASSI-TS-ADRESSE | powered by Team [ASSI] ", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, east countSide playableUnits];		
					
			switch (true) do {
			
				case (damage Player >= 0.75): {_ctrlHps ctrlSetTextColor [1,0,0,1];};
				case (damage Player >= 0.5):  {_ctrlHps ctrlSetTextColor [1,0.645,0,1];};
				case (damage Player >= 0.25): {_ctrlHps ctrlSetTextColor [1,1,0,1];};
				case (damage Player < 0.25):  {_ctrlHps ctrlSetTextColor [0,1,0,1];}; 
			};

			
			switch (true) do {

				case (getFatigue Player >= 0.75): {_ctrlSta ctrlSetTextColor [1,0,0,1];};
				case (getFatigue Player >= 0.50): {_ctrlSta ctrlSetTextColor [1,0.645,0,1];};
				case (getFatigue Player >= 0.25): {_ctrlSta ctrlSetTextColor [1,1,0,1];};  
				case (getFatigue Player < 0.25):  {_ctrlSta ctrlSetTextColor [0,1,0,1];}; 
			};
			
			If (vehicle player != player) Then {
				_dir = getDir vehicle player;
				switch (true) do {
					case (_dir >= 337.5 || _dir < 22.5): {_heading = "N";};
					case (_dir >= 292.5 && _dir < 337.5): {_heading = "NW";};
					case (_dir >= 247.5 && _dir < 292.5): {_heading = "W";};
					case (_dir >= 202.5 && _dir < 247.5): {_heading ="SW";};
					case (_dir >= 157.5 && _dir < 202.5): {_heading ="S";};
					case (_dir >= 112.5 && _dir < 157.5): {_heading ="SO";};
					case (_dir >= 67.5 && _dir < 112.5): {_heading ="O";};
					case (_dir >= 22.5 && _dir < 67.5): {_heading ="NO";};
				};
					_ctrlDir ctrlSetText format ["%1", _heading];
					_ctrlDir ctrlSetTextColor 	[0,1,0,1];  
	 
			} Else {
				_dir = getDir player;
				switch (true) do {
					case (_dir >= 337.5 || _dir < 22.5): {_heading = "N";};
					case (_dir >= 292.5 && _dir < 337.5): {_heading = "NW";};
					case (_dir >= 247.5 && _dir < 292.5): {_heading = "W";};
					case (_dir >= 202.5 && _dir < 247.5): {_heading ="SW";};
					case (_dir >= 157.5 && _dir < 202.5): {_heading ="S";};
					case (_dir >= 112.5 && _dir < 157.5): {_heading ="SO";};
					case (_dir >= 67.5 && _dir < 112.5): {_heading ="O";};
					case (_dir >= 22.5 && _dir < 67.5): {_heading ="NO";};
				};
					_ctrlDir ctrlSetText format ["%1", _heading];
					_ctrlDir ctrlSetTextColor 	[0,1,0,1];
			};
		}
		else
		{
			5 cutText ["","PLAIN"];
		};
	};	
};