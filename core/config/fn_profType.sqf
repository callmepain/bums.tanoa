/*
File: fn_profType
Author: Jacob "PapaBear" Tyler
 
Description:
Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;
 
if(_type == "" ) exitWith {[]};
 
_profName = "";
switch ( _type ) do
{
//text to license
case "heroin": {_profName = "Heroin_Prof"; };
case "cocaine": { _profName = "Cocain_Prof";};
case "marijuana": { _profName = "Canabis_Prof";};
case "Marijuana": { _profName = "Canabis_Prof";};
case "copper": { _profName = "Copper_Prof"; };
case "iron": { _profName = "Iron_Prof";};
case "salt": {_profName = "Salt_Prof"; };
case "sand": { _profName = "Sand_Prof";};
case "diamond": { _profName = "Diamond_Prof";};
case "oil": { _profName = "Oil_Prof";};
case "cement": { _profName = "Rock_Prof";};
case "apple": { _profName = "Fruit_Prof"; };
case "peach": { _profName = "Fruit_Prof";};
case "heroinu": {_profName = "Heroin_Prof"; };
case "cannabis": { _profName = "Canabis_Prof";};
case "copperore": { _profName = "Copper_Prof"; };
case "ironore": { _profName = "Iron_Prof";};
case "oilu": { _profName = "Oil_Prof";};
case "rock": { _profName = "Rock_Prof";};
case "lsd": { _profName = "lsd_Prof"; };
case "goldore": { _profName = "Gold_Prof"; };
case "silberore": { _profName = "Silber_Prof"; };
case "kohleore": { _profName = "Kohle_Prof"; };
case "pilze": { _profName = "Pilze_Prof"; };

case "Heroin": {_profName = "Heroin_Prof"; };
case "Kokain": { _profName = "Cocain_Prof";};
case "cannabis": { _profName = "Canabis_Prof";};
case "Kupfer": { _profName = "Copper_Prof"; };
case "Eisen": { _profName = "Iron_Prof";};
case "Salz": {_profName = "Salt_Prof"; };
case "Sand": { _profName = "Sand_Prof";};
case "Diamanten": { _profName = "Diamond_Prof";};
case "Öl": { _profName = "Oil_Prof";};
case "Zement": { _profName = "Rock_Prof";};
case "Früchte": { _profName = "Fruit_Prof"; };
case "LSD": { _profName = "lsd_Prof"; };
case "gold": { _profName = "Gold_Prof"; };
case "Gold": { _profName = "Gold_Prof"; };
case "silber": { _profName = "Silber_Prof"; };
case "Silber": { _profName = "Silber_Prof"; };
case "kohle": { _profName = "Kohle_Prof"; };
case "Kohle": { _profName = "Kohle_Prof"; };
case "Pilze": { _profName = "Pilze_Prof"; };

case "stahl": { _profName = "Stahl_Prof"; };
case "platin": { _profName = "Platin_Prof"; };
case "gems1": { _profName = "Gems1_Prof"; };
case "gems2": { _profName = "Gems2_Prof"; };
case "gems3": { _profName = "Gems3_Prof"; };

case "Stahl": { _profName = "Stahl_Prof"; };
case "Platin": { _profName = "Platin_Prof"; };
case "Silberschmuck": { _profName = "Gems1_Prof"; };
case "Goldschmuck": { _profName = "Gems2_Prof"; };
case "Brilliantschmuck": { _profName = "Gems3_Prof"; };
 
//license to text
case "Heroin_Prof": {_profName = "Heroin"; };
case "Cocain_Prof": { _profName = "Kokain";};
case "Canabis_Prof": { _profName = "Marijuana";};
case "Copper_Prof": { _profName = "Kupfer"; };
case "Iron_Prof": { _profName = "Eisen";};
case "Salt_Prof": {_profName = "Salz"; };
case "Sand_Prof": { _profName = "Sand";};
case "Diamond_Prof": { _profName = "Diamanten";};
case "Oil_Prof": { _profName = "Öl";};
case "Rock_Prof": { _profName = "Zement";};
case "Fruit_Prof": { _profName = "Früchte"; };
case "lsd_Prof": { _profName = "LSD"; };
case "Gold_Prof": { _profName = "Gold"; };
case "Silber_Prof": { _profName = "Silber"; };
case "Kohle_Prof": { _profName = "Kohle"; };
case "Pilze_Prof": { _profName = "Pilze"; };

case "Stahl_Prof": { _profName = "Stahl"};
case "Platin_Prof": { _profName = "Platin"};
case "Gems1_Prof": { _profName = "Silberschmuck"};
case "Gems2_Prof": { _profName = "Goldschmuck"};
case "Gems3_Prof": { _profName = "Brilliantschmuck"};
default{""};
};
 
 
 
_profName;