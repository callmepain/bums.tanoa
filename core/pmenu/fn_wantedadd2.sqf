private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9900)};
_display = findDisplay 9900;
_list = _display displayCtrl 9902;
_Titel = _display displayCtrl 1100;
//Purge List
lbClear _list;


{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Guer"}; case east : {"Reb"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", name _x,_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;


_list2 = _display displayCtrl 9991;
lbClear _list2;


_Titel ctrlSetStructuredText parseText "<t align='center' >Person auf die Fahndungsliste setzen</t>";

//_index = lbAdd [_list2, "Name"];
//lbSetData [_list2, _index, "pfad/zum/bild.paa"];
//lbSetValue  [_list2, _index, "pfad/zum/bild.paa"];
_text = "Totschlag";
_data = "187";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "fahrlässige Tötung"; // name and price
_data = "187V";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Entführung"; // name and price
_data = "207";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "versuchte Entführung"; // name and price
_data = "207A";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Raub"; // name and price
_data = "211";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Benutzung von Sprengstoff"; // name and price
_data = "213";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "versuchter Autodiebstahl"; // name and price
_data = "215";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Autodiebstahl"; // name and price
_data = "216";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Vergewaltigung"; // name and price
_data = "261";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "versuchte Vergewaltigung"; // name and price
_data = "261A";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "öffentliche Trunkenheit"; // name and price
_data = "390";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Einbrecher"; // name and price
_data = "459";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Zechprellerei"; // name and price
_data = "480";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenbesitz"; // name and price
_data = "481";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenhandel"; // name and price
_data = "482";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenschmuggel"; // name and price
_data = "483";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Bankräuber"; // name and price
_data = "484";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "mit beschädigtem Fahrzeug fahren"; // name and price
_data = "485";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren ohne Licht"; // name and price
_data = "486";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren auf der Falschen Spur"; // name and price
_data = "487";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "kleiner Diebstahl"; // name and price
_data = "488";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Landen auf nicht dafür vorher gesehenen Flächen"; // name and price
_data = "489";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "fehlende Gefahrgutbeförderungslizenz"; // name and price
_data = "490";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Widerstand gegen die Staatsgewalt"; // name and price
_data = "491";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Besitz von illegalen Waffen"; // name and price
_data = "492";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren ohne Führerschein"; // name and price
_data = "500";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Gefängnisausbruch"; // name and price
_data = "901";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Organhändler"; // name and price
_data = "919";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];