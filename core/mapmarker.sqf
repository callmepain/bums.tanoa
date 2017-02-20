_markername=[];

for "_i" from 0 to 200 do {  
	_markername pushback format["del_%1",_i];
};

{
_terrainobjects=nearestTerrainObjects [(getMarkerPos _x),[],(getmarkersize _x)select 0];
{hideObjectGlobal _x} foreach _terrainobjects;
_x setMarkerAlpha 0;
} foreach _markername;