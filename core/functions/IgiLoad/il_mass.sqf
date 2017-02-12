	IL_Server_SetMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
		};
		private ["_obj", "_mass"];
		_obj = _this select 1 select 0;
		_mass = _this select 1 select 1;
		if ((getMass _obj) != _mass) then
		{
			_obj setMass _mass;
		};
	};
//	END IL_Server_SetMass
	
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
//	END publicVariable "IL_SetMass";
	
	IL_GetCargoMass =
	{
		private ["_v", "_cargo_mass"];
		_v = _this select 0;
		_cargo_mass = 0;
		if (count(attachedObjects _v) > 0) then
		{
			{
				_cargo_mass = _cargo_mass + getMass _x;
			} forEach attachedObjects _v;
		};
		_cargo_mass;
	};
//	END IL_GetCargoMass

	IL_GetDefaultMass =
	{
		private ["_v"];
		_v = _this select 0;
		_v getVariable "default_mass";
	};
//	END IL_GetDefaultMass

	IL_SetNewMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_SetMass", IL_Script_Inst];
		};
		
		if !(IL_Mass) ExitWith {};
		private ["_v", "_v_def_mass", "_cargo_mass"];
		_v = _this select 0;
		_v_def_mass =  if (count _this > 1) then {_this select 1} else {0};
		_cargo_mass =  if (count _this > 2) then {_this select 2} else {0};
		
		if (_v_def_mass == 0) then
		{
			_v_def_mass = [_v] call IL_GetDefaultMass;
		};
		if (_cargo_mass == 0) then
		{
			_cargo_mass = [_v] call IL_GetCargoMass;
		};
		
		if ((getMass _v) != (_v_def_mass + _cargo_mass)) then
		{
			IL_SetMass = [_v, (_v_def_mass + _cargo_mass)];
			if (local _v) then
			{
				["Cos", IL_SetMass] spawn IL_Server_SetMass;
			}
			else
			{
				if (isDedicated) then
				{
					(owner _v) publicVariableClient "IL_SetMass";
				}
				else
				{
					publicVariableServer "IL_SetMass";
				};
			};
		};
//		_v setMass (_v_def_mass + _cargo_mass);
	};
//	END IL_SetNewMass