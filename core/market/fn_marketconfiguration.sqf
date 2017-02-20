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

	
	["heroin_processed", 2522, 0, 0, 0.043, 0.043,
		[
			["cocaine_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["cocaine_processed", 3216, 0, 0, 0.055, 0.055,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["lsd_processed", 5782, 0, 0, 0.099, 0.099,
		[
			["heroin_processed",1],
			["cocaine_processed",1],
			["marijuana",1],
			["pilze_processed",1]
		]
	],
	
	["marijuana", 1318, 0, 0, 0.023, 0.023,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["cocaine_processed",1],
			["pilze_processed",1]
		]
	],
	
	["pilze_processed", 53, 0, 0, 0.001, 0.001,
		[
			["heroin_processed",1],
			["lsd_processed",1],
			["marijuana",1],
			["cocaine_processed",1]
		]
	],
	
/////// --------------------------------------- essen 	--------------------------------------- ///////

	
	["peach", 15, 0, 0, 0.001, 0.001,
		[
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["apple", 10, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],	
	
	["rabbit_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["salema_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["ornate_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["mackerel_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["tuna_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["mullet_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["catshark_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["turtle_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["hen_raw",20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["rooster_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["rooster_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["sheep_raw",1],
			["goat_raw",1]
		]
	],
	
	["sheep_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["goat_raw",1]
		]
	],
	
	["goat_raw", 20, 0, 0, 0.001, 0.001,
		[
			["peach",1],
			["apple",1],
			["rabbit_raw",1],
			["salema_raw",1],
			["ornate_raw",1],
			["mackerel_raw",1],
			["tuna_raw",1],
			["mullet_raw",1],
			["catshark_raw",1],
			["turtle_raw",1],
			["hen_raw",1],
			["rooster_raw",1],
			["sheep_raw",1]
		]
	],
	
/////// --------------------------------------- Rohstoffe 	--------------------------------------- ///////


	["oil_processed", 1881, 0, 0, 0.032, 0.032,
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
	
	["wood_refined", 575, 0, 0, 0.002, 0.002,
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
	
	["iron_refined", 1015, 0, 0, 0.017, 0.017,  
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
	
	["coal_refined", 504, 0, 0, 0.009, 0.009, 
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
	
	["copper_refined", 672, 0, 0, 0.005, 0.005,
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
	
	["salt_refined", 1512, 0, 0, 0.026, 0.026,
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
	
	["glass", 504, 0, 0, 0.009, 0.009,
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
	
	["cement", 783, 0, 0, 0.009, 0.009,
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

	["stahlbarren_refined", 6544, 0, 0, 0.112, 0.112,
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

	["diamond_cut", 1541, 0, 0, 0.026, 0.026,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["silver_refined", 1669, 0, 0, 0.029, 0.029,
		[
			["diamond_cut",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["golderz_refined", 1377, 0, 0, 0.024, 0.024,
		[
			["silver_refined",1],
			["diamond_cut",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["platinbarren_refined", 12879, 0, 0, 0.221, 0.221,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["diamond_cut",1],
			["silberschmuck_refined",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["silberschmuck_refined", 15606, 0, 0, 0.267, 0.267,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["diamond_cut",1],
			["goldschmuck_refined",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["goldschmuck_refined", 17340, 0, 0, 0.297, 0.297,
		[
			["silver_refined",1],
			["golderz_refined",1],
			["platinbarren_refined",1],
			["silberschmuck_refined",1],
			["diamond_cut",1],
			["brilliantschmuck_refined",1]
		]
	],
	
	["brilliantschmuck_refined", 54612, 0, 0, 0.936, 0.936,
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


life_market_resources_nahrung =["peach","apple","rabbit_raw","salema_raw","ornate_raw","mackerel_raw","tuna_raw","mullet_raw","catshark_raw","turtle_raw","hen_raw","rooster_raw","sheep_raw","goat_raw"];
life_market_resources_rohstoffe =["wood_refined","cement","salt_refined","glass","coal_refined","copper_refined","iron_refined","oil_processed","stahlbarren_refined"];
life_market_resources_drogen =["pilze_processed","marijuana","cocaine_processed","heroin_processed","lsd_processed"];
life_market_resources_multi =["platinbarren_refined","diamond_cut","silver_refined","golderz_refined","silberschmuck_refined","goldschmuck_refined","brilliantschmuck_refined"];
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
	
	life_market_prices_fix = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices_fix pushback [_x select 0, _x select 1, 0, 0];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	publicVariable "life_market_prices_fix";
	
	systemChat "Market Prices Generated!";
// };