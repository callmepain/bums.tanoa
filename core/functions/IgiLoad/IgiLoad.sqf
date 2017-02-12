//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	IgiLoad v0.9.10_RC_e_(Arma3_1.32)																		//
//	Version info: This is not official version of IgiLoad it is only WIP (RC)								//
//	Author: Igi_PL																							//
//	Web: http://www.igipl.net/																				//
//	Version date: 2014.10.16																				//
//																											//
//	USE:																									//
//	1. In mission "init.sqf" add line: "0 = execVM "IgiLoad\IgiLoadInit.sqf";".								//
//	2. In vehicles "INITIALIZATION" field type: "0 = [this] execVM "IgiLoad\IgiLoad.sqf";"					//
//	3. Unload from script or trigger:																		//
//		a) Unloading cargo from script. Force unload: "0 = [Car, true, "L"] spawn IL_Do_Unload;"			//
//		b) Unloading cargo from script. Force unload: "0 = [Car, true] spawn IL_Do_Unload;"					//
//		c) Unloading cargo from script. Force unload: "0 = [Car] spawn IL_Do_Unload;"						//
//	4. Loading cargo from script. Force load: "0 = [Car, [typeOf Box], "B", true, Box] spawn IL_Do_Load;"	//
//																											//
//	Ways from points 1 and 2 can not be used simultaneously!!!												//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


#include "config.sqf";

//waitUntil { !(isNull player) };
waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

//if (isDedicated) exitwith {};
//if (isServer) exitwith {};

//	VARIABLES
_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);


	//Check if vehicle is supported or it is PLayer init
// if !((_obj_main_type in (IL_Supported_Vehicles_All)) || (_obj_main == Player) || (isServer) || (isDedicated)) exitwith
// {
	// if (IL_DevMod) then
	// {
		// Player globalChat Format["IgiLoad. Object: ""%1"" is not supported.", _obj_main];
	// };
// };

//	PROCEDURES AND FUNCTIONS
#include "init_veh.sqf";

#include "init_box.sqf";
	
	IL_Server_AddScore =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_AddScore.", IL_Script_Inst];
		};
		if (isServer) then
		{
			((_this select 1) select 0) addScore ((_this select 1) select 1);
		};
	};
//	END IL_Server_AddScore

	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
//	END publicVariable "IL_SetScore";

	IL_Score = 
	{
		private ["_obj", "_score"];
		
		_obj = _this select 0;
		_score = _this select 1;
		
		if (_score != 0) then
		{
			IL_SetScore = [_obj, _score];
			if (isServer) then
			{
				["Cos", IL_SetScore] spawn IL_Server_AddScore;
			}
			else
			{
				publicVariableServer "IL_SetScore";
			};
		};
	};
//	END IL_Score
	
	IL_Server_SetDir =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj", "_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);
	};
//	END IL_Server_Turn_Obj

	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
//	END publicVariable "IL_SetDir";
		
	IL_Rotate = 
	{
		private ["_obj", "_to", "_change"];
		
		_obj = _this select 0;
		_to = _this select 1;
		_change = _this select 2;
		
		_change = (getDir _obj + _change) - getDir _to;
		
		IL_SetDir = [_obj, _change];
		if (local _obj) then
		{
			["Cos", IL_SetDir] spawn IL_Server_SetDir;
		}
		else
		{
			if (isDedicated) then
			{
				(owner _obj) publicVariableClient "IL_SetDir";
			}
			else
			{
				publicVariableServer "IL_SetDir";
			};
		};
	};
//	END IL_Rotate
	
#include "il_mass.sqf";
	
	IL_Vehicle_Chat =
	{
		private["_v", "_msg", "_mass_info", "_text", "_cargo_mass", "_v_def_mass"];
		_v = _this select 0;
		_msg = _this select 1;
		_mass_info =  if (count _this > 2) then {_this select 2} else {false};

		_v vehicleChat _msg;
		if (_mass_info && IL_Mass) then
		{
			_cargo_mass = 0;
			_v_def_mass = [_v] call IL_GetDefaultMass;
			_cargo_mass = [_v] call IL_GetCargoMass;
			
			_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "picture")];
			_text = _text + Format ["<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t><br/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Grundgewicht: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Gewicht Ladung: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _cargo_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Gesamtgewicht: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass + _cargo_mass];
		};
		if (vehicle Player != _v) then
		{
			if (_mass_info && IL_Mass) then
			{
				_text = _text + _msg;
				hint parseText (_text);
			}
			else
			{
				Hint Format ["%1", _msg];
			};
		}
		else
		{
			if (_mass_info && IL_Mass) then
			{
				hint parseText (_text);
			};
		};
	};
//	END IL_Vehicle_Chat
	
	IL_Move_Attach=
	{
		private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
		_veh = _this select 0;
		_obj = _this select 1;
		_from = _this select 2;
		_to = _this select 3;
		_step = _this select 4;
		_turn = if (count _this > 5) then {_this select 5} else {false};
		
		_from_x = _from select 0;
		_from_y = _from select 1;
		_from_z = _from select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _from_x =""%2"", _from_y =""%3"", _from_z =""%4""", IL_Script_Inst, _from_x, _from_y, _from_z];
		};

		_to_x = _to select 0;
		_to_y = _to select 1;
		_to_z = _to select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _to_x =""%2"", _to_y =""%3"", _to_z =""%4""", IL_Script_Inst, _to_x, _to_y, _to_z];
		};
		
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x =""%2"", _y =""%3"", _z =""%4""", IL_Script_Inst, _x, _y, _z];
		};
		
		if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
		{
			_steps = round ((abs _x) / _step);
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x > _y and _z, _steps =""%2""", IL_Script_Inst, _steps];
			};
		}
		else
		{
			if ((abs _y) > (abs _z)) then
			{
				_steps = round ((abs _y) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _y > _z, _steps =""%2""", IL_Script_Inst, _steps];
				};
			}
			else
			{
				_steps = round ((abs _z) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _z > _y, _steps =""%2""", IL_Script_Inst, _steps];
				};
			};
		};

		_i = 0;
		_obj AttachTo [_veh, _from];
		while {_i < _steps} do
		{
			_i = _i + 1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_veh, _pos];
			if (_turn) then
			{
				[_obj, _veh, -90] call IL_Rotate;
				_turn = false;
			};
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _pos =""%2""", IL_Script_Inst, _pos];
			};
			sleep 0.25;
		};

		_obj AttachTo [_veh, _to];
			// if (_turn) then
			// {
				// [_obj, _veh, 90] call IL_Rotate;
			// };
	};
//	END IL_Move_Attach

	IL_Create_And_Attach =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Create_And_Attach", IL_Script_Inst];
		};
		_type = _this select 0;
		_to = _this select 1;
		_x = if (count _this > 2) then {_this select 2} else {0};
		_y = if (count _this > 3) then {_this select 3} else {0};
		_z = if (count _this > 4) then {_this select 4} else {0};
		_m = createVehicle [_type, position _to, [], 0, "CAN_COLLIDE"];
		_m AttachTo [_to,[_x,_y,_z]];
		_m
	};
//	END IL_Create_And_Attach
#include "il_para.sqf";

#include "il_load.sqf";

#include "il_unload.sqf";	

#include "il_getout.sqf";
//	END PROCEDURES AND FUNCTIONS

//	MAIN CODE
_vsupported = false;
if (_obj_main_type in IL_Supported_Vehicles_MOHAWK) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MOHAWK.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_NonVeh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1) && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Mohawk, IL_SDistL]) select 0 getVariable 'beladbar')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_Veh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<t color=""#007f0e"">Einsteigen in CH-49</t>",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<t color=""#ff0000"">Aussteigen aus CH-49</t>",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Abspringen</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Ladung per Fallschirm abwerfen</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  gesamte Ladung per Fallschirm abwerfen</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"<t color=""#0066FF"">Laderampe öffnen</t>",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 1];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<t color=""#0066FF"">Laderampe schließen</t>",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 1) && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<t color=""#0066FF"">Be-/Entladen für Co-Pilot aktivieren</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0066FF"">Be-/Entladen für Co-Pilot deaktivieren</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Benutzung Laderampe aktivieren</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Benutzung Laderampe deaktivieren</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_OFFROAD) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_OFFROAD, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E""> Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_OFFROAD, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_Motorboat) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Motorboat.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Ladung aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Motorboat] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_Motorboat, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Motorboat, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_VAN) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_VAN.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_VAN, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_VAN, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_KAMAZ) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_KAMAZ.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Kamaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Kamaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Kamaz, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Kamaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Kamaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Kamaz, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_KAMAZ_Transporter) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_KAMAZ_Transporter.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Kamaz_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Kamaz_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Kamaz_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Kamaz_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Kamaz_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Kamaz_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_TEMPEST) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_TEMPEST.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_TEMPEST] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (_target getVariable 'can_load') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	 _obj_main addAction [
	 "<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	 {
		 [_this select 0, IL_Supported_Cargo_Veh_TEMPEST] call IL_Do_Load;
	 },[],IL_Action_LU_Priority,true,true,"",
	 "(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST, IL_SDistL]) select 0 getVariable 'beladbar')"
	 ];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_TEMPEST_Transporter) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_TEMPEST_Transporter.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_TEMPEST_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_TEMPEST_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];
	
	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_HEMTT) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_HEMTT.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT, IL_SDistL]) select 0 getVariable 'beladbar')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT, IL_SDistL]) select 0 getVariable 'beladbar')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_HEMTT_Transporter) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_HEMTT_Transporter.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fracht aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_HEMTT_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\load.paa' /><t color=""#2EFE2E"">  Fahrzeug aufladen</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_HEMTT_Transporter] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT_Transporter, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && ((nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT_Transporter, IL_SDistL]) select 0 getVariable 'beladbar')"
	];

	_obj_main addAction [
	"<img image='core\functions\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Ladung abladen</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""##FFFF00"">Be-/Entladen von außen aktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#FFFF00"">Be-/Entladen von außen deaktivieren</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};	
//	EOF
