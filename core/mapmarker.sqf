_markername=["del_1","del_2","del_3","del_4"];
{
_terrainobjects=nearestTerrainObjects [(getMarkerPos _x),[],(getmarkersize _x)select 0];
{hideObjectGlobal _x} foreach _terrainobjects;
_x setMarkerAlpha 0;
} foreach _markername;