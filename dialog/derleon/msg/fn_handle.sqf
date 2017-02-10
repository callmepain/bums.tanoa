#define CONFIG(TYPE,SETTING) TYPE(missionConfigFile >> "Message_Settings" >> SETTING)
/*
File: fn_handle.sqf
Author: Leon "DerL30N" Beeser"

Description:
Handles incoming messages and creates a array
*/
private["_param1","_param2","_param3","_param4","_error","_text","_title","_color","_simpl"]; _error = false;

_param1 = [_this, 0, nil] call BIS_fnc_param;
_param2 = [_this, 1, nil] call BIS_fnc_param;
_param3 = [_this, 2, nil] call BIS_fnc_param;
_param4 = [_this, 3, nil] call BIS_fnc_param;

if (isNil "_param1") exitWith {};

if ((_param1 isEqualType "") OR (_param1 isEqualType text "")) then 
{
	_text = _param1;
	if (!(isNil "_param2")) then 
	{
		if ((_param2 isEqualType "") OR (_param2 isEqualType text "")) then 
		{
			if (isClass (missionConfigFile >> "Colors" >> _param2)) then
			{
				_title = (CONFIG(getText,"baseTitel"));
				_color = _param2;
				if (!(isNil "_param3")) then 
				{
					if (_param3 isEqualType true) then 
					{
						_simpl = _param3;
					} else {
						_error = true; diag_log format["MSG Error : Parameter No.3 erwartet Bool | Parameter : %1",[_param1,_param2,_param3]];
					};
				} else {
					_simpl = false;
				};
			} else {
				_title = _param2;
				if (!(isNil "_param3")) then 
				{
					if ((_param3 isEqualType "") OR (_param3 isEqualType text "")) then 
					{
						if (isClass (missionConfigFile >> "Colors" >> _param3)) then
						{
							_color = _param3;
							if (!(isNil "_param4")) then 
							{
								if (_param4 isEqualType true) then 
								{
									_simpl = _param4;
								} else {
									_error = true; diag_log format["MSG Error : Parameter No.4 erwartet Bool | Parameter : %1",[_param1,_param2,_param3,_param4]];
								};
							} else {
								_simpl = false;
							};
						} else {
							_error = true; diag_log format["MSG Error : Parameter No.3 erwartet String oder Text | Parameter : %1",[_param1,_param2,_param3]];
						};
					} else {
						if (_param3 isEqualType true) then 
						{
							_color = (CONFIG(getText,"baseColor"));
							_simpl = _param3;
						} else {
							_error = true; diag_log format["MSG Error : Parameter No.3 erwartet String oder Text oder Bool | Parameter : %1",[_param1,_param2,_param3]];
						};
					};
				} else {
					_color = (CONFIG(getText,"baseColor"));
					_simpl = false;
				};
			};
		} else {
			if (_param2 isEqualType true) then 
			{
				_title = "";
				_color = (CONFIG(getText,"baseColor"));
				_simpl = _param2;
			} else {
				_error = true; diag_log format["MSG Error : Parameter No.2 erwartet Bool oder Text oder String | Parameter : %1",[_param1,_param2]];
			};
		};
	} else {
		_title = (CONFIG(getText,"baseTitel"));
		_color = (CONFIG(getText,"baseColor"));
		_simpl = false;
	};
} else {
	_error = true; diag_log format["MSG Error : Parameter No.1 erwartet String oder Text | Parameter : %1",[_param1]];
};
if (_error) exitWith {};
if ((isNil "msg_array") OR (isNil "msg_active")) then { msg_array = []; msg_active = false; };
msg_array = msg_array + [[_text,_title,_color,_simpl]];

/*if ((_simpl) && ((CONFIG(getNumber,"overlap")) isEqualTo 1)) then {
if (!msg_active) exitWith { [] spawn MSG_fnc_ctrl;
} else {
if (!msg_active) exitWith { [] spawn MSG_fnc_ctrl; msg_active = true; };
};*/
if (!msg_active) exitWith { [] spawn MSG_fnc_ctrl; msg_active = true; };
/*
[_text,_title,_color,_simpl] call MSG_fnc_handle;
[_text,_title,_color,_simpl] remoteExec ["MSG_fnc_handle",_target];

1.[Text]

2.[Text],[Titel] OR [Text],[Color] OR [Text],[Simple]

3.[Text],[Titel],[Color] OR [Text],[Titel],[Simple] OR [Text],[Color],[Simple]

4.[Text],[Titel],[Color],[Simple]
*/