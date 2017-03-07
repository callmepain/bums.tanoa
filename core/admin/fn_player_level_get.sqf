private ["_display","_ret","_text"];
disableSerialization;
_ret = _this select 0;

_adminlevel = (_ret select 0);
_adaclevel = (_ret select 1);
_medlevel = (_ret select 2);
_coplevel = (_ret select 3);
_donator = (_ret select 4);

lbSetCurSel [2100, _adaclevel];
lbSetCurSel [2101, _medlevel];
lbSetCurSel [2102, _coplevel];
lbSetCurSel [2103, _donator];
lbSetCurSel [2104, _adminlevel];