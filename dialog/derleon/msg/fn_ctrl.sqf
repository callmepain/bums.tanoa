#define CONFIG(TYPE,SETTING) TYPE(missionConfigFile >> "Message_Settings" >> SETTING)
/*
 File: fn_ctrl.sqf
 Author: Leon "DerL30N" Beeser"

 Description:
 Controles the players hud
*/
if (!(count msg_array > 0)) exitWith { msg_active = false; };

disableSerialization;

while {count msg_array >= 1} do {
	_msg = msg_array select 0;
	_text = _msg select 0;
	_title = _msg select 1;
	_color = _msg select 2;
	_simpl = _msg select 3;
	_color = getArray (missionConfigFile >> "Colors" >> _color >> "rgba");
	if ((CONFIG(getNumber,"killHint")) isEqualto 1) then { hint ""; };
	private "_display";
	if (_simpl) then {
		(CONFIG(getNumber,"rscLayer")) cutRsc["msg_simpl",(CONFIG(getText,"kindOfCutRsc")),(CONFIG(getNumber,"fadein"))];
		if ((CONFIG(getNumber,"noSoundSec")) isEqualTo 0) then { playSound [(CONFIG(getText,"soundSec")),true]; };
		_display = uiNamespace getVariable "msg_simpl";
		_lic1 = _display displayCtrl 9001;
		_lic2 = _display displayCtrl 9002;
		_lic3 = _display displayCtrl 9003;
		if ((CONFIG(getNumber,"noBar")) isEqualTo 0) then { _lic1 ctrlSetBackgroundColor [(_color select 0),(_color select 1),(_color select 2),0.7]; } else { _lic1 ctrlSetBackgroundColor [-1,-1,-1,-1]; };
		_lic2 ctrlSetStructuredText parseText format["<t size='0.9px'>%1</t>",_text];
		_lic2 ctrlSetPosition [0.845469 * safezoneW + safezoneX,0.115 * safezoneH + safezoneY,0.139219 * safezoneW,ctrlTextHeight _lic2];
		_lic2 ctrlCommit 0;
		_lic3 ctrlSetPosition [0.840312 * safezoneW + safezoneX,0.104 * safezoneH + safezoneY,0.149531 * safezoneW,((((ctrlPosition _lic2) select 1) + ((ctrlPosition _lic2) select 3)) - (0.104 * safezoneH + safezoneY)) + 0.011 * safezoneH];
		_lic3 ctrlCommit 0;
	} else {
		(CONFIG(getNumber,"rscLayer")) cutRsc["msg",(CONFIG(getText,"kindOfCutRsc")),(CONFIG(getNumber,"fadein"))];
		if ((CONFIG(getNumber,"noSound")) isEqualTo 0) then { playSound [(CONFIG(getText,"sound")),true]; };
		_display = uiNamespace getVariable "msg";
		_lic1 = _display displayCtrl 9001;
		_lic2 = _display displayCtrl 9002;
		_lic3 = _display displayCtrl 9003;
		_lic4 = _display displayCtrl 9004;
		_lic1 ctrlSetStructuredText parseText format["<t size='1.1px'>%1</t>",_title];
		_lic1 ctrlSetPosition [0.842468 * safezoneW + safezoneX,0.115 * safezoneH + safezoneY,0.142219 * safezoneW,ctrlTextHeight _lic1];
		_lic1 ctrlCommit 0;
		_lic2 ctrlSetPosition [0.845469 * safezoneW + safezoneX,((ctrlPosition _lic1) select 1) + ((ctrlPosition _lic1) select 3) + (0.00325 * safezoneH),0.139219 * safezoneW,0.0055 * safezoneH];
		_lic2 ctrlCommit 0;
		_lic2 ctrlSetBackgroundColor [(_color select 0),(_color select 1),(_color select 2),0.7];
		_lic3 ctrlSetStructuredText parseText format["<t size='0.9px'>%1</t>",_text];
		_lic3 ctrlSetPosition [0.845469 * safezoneW + safezoneX,((ctrlPosition _lic1) select 1) + ((ctrlPosition _lic1) select 3) + (2 * (0.0055 * safezoneH)),0.139219 * safezoneW,ctrlTextHeight _lic3];
		_lic3 ctrlCommit 0;
		_lic4 ctrlSetPosition [0.840312 * safezoneW + safezoneX,0.104 * safezoneH + safezoneY,0.149531 * safezoneW,((((ctrlPosition _lic3) select 1) + ((ctrlPosition _lic3) select 3)) - (0.104 * safezoneH + safezoneY)) + 0.011 * safezoneH];
		_lic4 ctrlCommit 0;
	};
 // waitUntil { sleep 0.1; (!isNull _display) };
 // waitUntil { sleep 0.1; (isNull _display) };
 msg_array = msg_array - [_msg];
};
//if ((!_simpl) && ((CONFIG(getNumber,"overlap")) isEqualTo 0)) then { msg_active = false; };
msg_active = false;