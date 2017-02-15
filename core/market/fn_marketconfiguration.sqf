/*
	Edit by H4uklotz
	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

	//Schema:	 SHORTNAME, 			Default, 	Min, 		Max, 	changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//[				"golderz_refined", 	1500, 		450, 	2300, 	8, 5],


life_market_resources = [
/////// --------------------------------------- Drogen 	--------------------------------------- ///////

	
	["heroin_processed", 1594, 1116, 2072, 16, 8,
		[
			["cocaine_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["cocaine_processed", 1016, 711, 1321, 12, 6,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["lsd_processed", 3516, 2461, 3516, 16, 8,
		[
			["heroin_processed",1],
			["cocaine_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["marijuana", 31, 22, 40, 6, 3,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["cocaine_processed",1],
			["pilze_processed",1]
		]
	],
	
	["pilze_processed", 66, 46, 86, 4, 2,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["cocaine_processed",1]
		]
	],
	
/////// --------------------------------------- essen 	--------------------------------------- ///////

	
	["peach", 55, 30, 80, 2, 2,
		[
			["apple",1]
		]
	],
	
	["apple", 50, 25, 75, 2, 3,
		[
			["peach",1]
		]
	],	
	
/////// --------------------------------------- Rohstoffe 	--------------------------------------- ///////


	["oil_processed", 547, 383, 711, 8, 4,
		[
			["coal_refined",1],
			["wood_refined",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		]
	],
	
	["wood_refined", 150, 105, 195, 8, 4,
		[
			["coal_refined",1],
			["wood_refined",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		]
	],
	
	["iron_refined", 391, 274, 508, 8, 4,  
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		] 
	],
	
	["coal_refined", 547, 383, 711, 4, 2, 
		[ 
			["oil_processed",1],
			["wood_refined",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		] 
	],
	
	["copper_refined", 250, 175, 250, 0.045, 2,
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["iron_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		] 
	],
	
	["salt_refined", 234, 164, 304, 10, 5,
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["cement",1],
			["glass",1],
			["stahlbarren_refined",1]
		] 
	],
	
	["glass", 242, 169, 242, 4, 2,
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["stahlbarren_refined",1]
		] 
	],
	
	["cement", 250, 175, 325, 12, 6,
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["glass",1],
			["stahlbarren_refined",1]
		] 
	],

	["stahlbarren_refined", 1328, 930, 1726, 20, 10,
		[ 
			["coal_refined",1], 
			["wood_refined",1],
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["salt_refined",1],
			["cement",1],
			["glass",1]
		] 
	],


/////// --------------------------------------- Hochwertig 	--------------------------------------- ///////

	["diamond_cut", 1172, 820, 1524, 4, 2,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["silver_refined", 703, 492, 914, 10, 5,
		[
			["diamond_cut",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["golderz_refined", 969, 678, 969, 10, 5,
		[
			["silver_refined",1],
			["diamond_cut",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["platinbarren_refined", 2047, 1433, 2661, 30, 15,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["diamond_cut",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["silberschmuck_refined", 1406, 984, 1828, 20, 10,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["diamond_cut",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["goldschmuck_refined", 1641, 1149, 2133, 24, 12,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["diamond_cut",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["brilliantschmuck_refined", 15625, 10938, 20313, 200, 100,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["diamond_cut",1]
		]
	]	
];
publicVariable "life_market_resources";


life_market_resources_nahrung =["peach","apple"];
life_market_resources_rohstoffe =["wood_refined","cement","salt_refined","glass","coal_refined","copper_refined","iron_refined","oil_processed","stahlbarren_refined"];
life_market_resources_drogen =["pilze_processed","marijuana","cocaine_processed","heroin_processed","lsd_processed"];
life_market_resources_multi =["platinbarren_refined","diamond_cut","silver_refined","golderz_refined","platinbarren_refined","silberschmuck_refined","goldschmuck_refined","brilliantschmuck_refined"];
publicVariable "life_market_resources_rohstoffe";
publicVariable "life_market_resources_drogen";
publicVariable "life_market_resources_multi";
publicVariable "life_market_resources_nahrung";
////////////GENERATED CONFIG
life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames pushback (_x select 0);
	life_market_clampprices pushback [_x select 0, _x select 2, _x select 3];
	life_market_changes pushback [_x select 0, _x select 4, _x select 5];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
publicVariable "life_market_clampprices";

//SYNC PRICES WITH SERVER IF EMPTY
// if(isNil("life_market_prices")) then
// {
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices pushback [_x select 0, _x select 1, 0, 0];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
// };