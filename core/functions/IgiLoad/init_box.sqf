IL_Init_Box =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
		};

		private["_obj", "_obj_type", "_bbr", "_p0", "_p1"];
		_obj = _this select 0;
		
		_obj setVariable["attachedPos", 0, true];
		_obj setVariable["attachedTruck", _obj, true];
		_obj setVariable["doors", "N", true];
		
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0, true];
		
		_bbr = boundingBoxReal _obj;
		_p0 = _bbr select 0;
		_p1 = _bbr select 1;
		_obj setVariable["zload_cargo", abs (_p0 select 2), true];
		
		_obj_type = (typeOf _obj);
		
		if (_obj_type in IL_Supported_Cargo20) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.6, true];//HEMETT Box ~2.09281
			//LOCAL
			//_obj setMass 2400;
			[_obj, 2400] call IL_SetNewMass;
		};
		
		if (_obj_type in IL_Supported_HEMTT) then
		{
			_obj setVariable["slots", 10, true];
			_obj setVariable["cargo_offset", 4.2, true];
		};
		if (_obj_type in IL_Supported_Strider) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.2, true];
		};
		if (_obj_type in IL_Supported_Hunter) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.5, true];
		};
		if (_obj_type in IL_Supported_Ifrit) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.3, true];
		};
		if (_obj_type in IL_Supported_VAN) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.8, true];
		};
		if (_obj_type in IL_Supported_Hatchback) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 1.9, true];
		};
		if (_obj_type in IL_Supported_SUV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_OFFROAD) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.4, true];
		};
		if (_obj_type in IL_Supported_Kart) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.5, true];
		};
		if (_obj_type in IL_Supported_KAMAZ) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 0.5, true];
		};
		if (_obj_type in IL_Supported_Motorboat) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.4, true];
		};
		if (_obj_type in IL_Supported_Speedboot) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 0.4, true];
		};
		if (_obj_type in IL_Supported_Rubberboat) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_SDV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.6, true];
		};
		if (_obj_type in IL_Supported_Quadbike) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.5, true];
		};
		if (_obj_type in IL_Supported_Veh_Ammo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.4, true];
			[_obj, 750] call IL_SetNewMass;
		};
	};
//	END IL_Init_Box