class CfgGather {
    class Resources {
        class apple {
            amount = 2;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
			displayName = "STR_MAR_Apple_Field";
            item = "";
			mined[] = {"apple"};
            zoneSize = 30;
			level = 1;
        };

        class peach {
            amount = 2;
            zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
			displayName = "STR_MAR_Peaches_Field";
            item = "";
			mined[] = {"peach"};
            zoneSize = 30;
			level = 1;
        };

        /*class heroin_unprocessed {
            amount = 2;
            zones[] = { "heroin_1" };
			displayName = "STR_MAR_Heroin_Field";
            item = "";
			mined[] = {"heroin_unprocessed"};
            zoneSize = 30;
			level = 5;
        };

        class cocaine_unprocessed {
            amount = 2;
            zones[] = { "cocaine_1" };
			displayName = "STR_MAR_Cocaine_Field";
            item = "";
			mined[] = {"cocaine_unprocessed"};
            zoneSize = 30;
			level = 4;
        };

        class cannabis {
            amount = 2;
            zones[] = { "weed_1" };
			displayName = "STR_MAR_Weed_Field";
            item = "";
			mined[] = {"cannabis"};
            zoneSize = 30;
			level = 3;
        };*/
		
		 class lsd_unprocessed {
            amount = 2;
            zones[] = { "aga_1" };
			displayName = "STR_MAR_Aga_Field";
            item = "";
			mined[] = {"lsd_unprocessed"};
            zoneSize = 30;
			level = 6;
        };		
	
		class pilze_processed {
            amount = 2;
            zones[] = { "pilze_1" };
			displayName = "STR_MAR_zauberpilze_mine";
            item = "";
			mined[] = {"pilze_processed"};
            zoneSize = 30;
			level = 2;
        };
    };

	
	class Farming {
		
		class Weizen {
			classname = "A3L_Wheat";
			extra = 1;
            amount = 1;
            zones[] = { "wheat_1" };
			displayName = "STR_MAR_wheat_Field";
            item = "wheatseeds";
			mined[] = {"wheat"};
            zoneSize = 30;
			level = 3;
        };
		
		class Korn {
			classname = "A3L_Corn";
			extra = 2;
            amount = 1;
            zones[] = { "corn_1" };
			displayName = "STR_MAR_corn_Field";
            item = "cornseeds";
			mined[] = {"corn"};
            zoneSize = 30;
			level = 3;
        };
		
		class Baumwolle {
			classname = "A3L_Cotton";
			extra = 3;
            amount = 1;
            zones[] = { "cotton_1" };
			displayName = "STR_MAR_cotton_Field";
            item = "cottonseeds";
			mined[] = {"cotton"};
            zoneSize = 30;
			level = 3;
        };
		
		class Bohnen {
			classname = "A3L_Beans";
			extra = 3;
            amount = 1;
            zones[] = { "bean_1" };
			displayName = "STR_MAR_bean_Field";
            item = "beanseeds";
			mined[] = {"bean"};
            zoneSize = 30;
			level = 3;
        };
		
		class Sonnenblumen {
			classname = "A3L_Sunflower";
			extra = 1;
            amount = 1;
            zones[] = { "sunflower_1" };
			displayName = "STR_MAR_sunflower_Field";
            item = "sunflowerseeds";
			mined[] = {"sunflower"};
            zoneSize = 30;
			level = 3;
        };
		
		class Cannabis {
			classname = "A3L_Cannabis";
			extra = 2;
            amount = 1;
            zones[] = { "weed_1" };
			displayName = "STR_MAR_Weed_Field";
            item = "cannabisseeds";
			mined[] = {"cannabis"};
            zoneSize = 30;
			level = 3;
        };
		
		class Heroin {
			classname = "koprivy";
			extra = 2;
            amount = 1;
            zones[] = { "heroin_1" };
			displayName = "STR_MAR_heroin_Field";
            item = "heroinseeds";
			mined[] = {"heroin_unprocessed"};
            zoneSize = 30;
			level = 3;
        };
		
		class Kokain {
			classname = "koprivy";
			extra = 2;
            amount = 1;
            zones[] = { "cocaine_1" };
			displayName = "STR_MAR_cocaine_Field";
            item = "cocaineseeds";
			mined[] = {"cocaine_unprocessed"};
            zoneSize = 30;
			level = 3;
        };
		
	};
/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
    };
    This will give :
    25(±1)% to copper_unrefined;
    70(±1)% to iron_unrefined;
    5%(±1)% to diamond_uncut;

                                                         ! Watch Out !
 If percents are used,you MUST put more than 1 resource in the mined parameter
 mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
 mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
 mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
 mined[] = { "copper_unrefined" }; OK
 mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/

    class Minerals {
        class copper_unrefined {
            amount = 2;
            zones[] = { "copper_mine" };
			displayName = "STR_MAR_Copper_Mine";
			processor = "copper_processing";
			processorname = "STR_MAR_Copper_Processing";
            item = "pickaxe";
            mined[] = {"copper_unrefined"};
            zoneSize = 30;
			level = 2;
        };

        class iron_unrefined {
            amount = 2;
            zones[] = { "iron_mine" };
			displayName = "STR_MAR_Iron_Mine";
			processor = "iron_processing";
			processorname = "STR_MAR_Iron_processing";
            item = "pickaxe";
            mined[] = { "iron_unrefined" };
            zoneSize = 30;
			level = 3;
        };

        class salt_unrefined {
            amount = 2;
            zones[] = { "salt_mine" };
			displayName = "STR_MAR_Salt_Mine";
			processor = "salt_processing";
			processorname = "STR_MAR_Salt_Processing";
            item = "shovel";
            mined[] = { "salt_unrefined" };
            zoneSize = 30;
			level = 4;
        };

        class sand {
            amount = 2;
            zones[] = { "sand_mine" };
			displayName = "STR_MAR_Sand_Mine";
			processor = "sand_processing";
			processorname = "STR_MAR_Sand_Processing";
            item = "shovel";
            mined[] = { "sand" };
            zoneSize = 30;
			level = 3;
        };

        class diamond_uncut {
            amount = 2;
            zones[] = { "diamond_mine" };
			displayName = "STR_MAR_Diamond_Mine";
			processor = "diamond_processing";
			processorname = "STR_MAR_Diamond_Processing";
            item = "pickaxe";
            mined[] = { "diamond_uncut" };
            zoneSize = 30;
			level = 6;
        };
		
		class golderz {
            amount = 2;
            zones[] = { "gold_mine" };
			displayName = "STR_MAR_Gold_Mine";
			processor = "gold_processing";
			processorname = "STR_MAR_Gold_processing";
            item = "pickaxe";
            mined[] = { "golderz_unrefined" };
            zoneSize = 30;
			level = 5;
        };
		
		class silver {
            amount = 2;
            zones[] = { "silver_mine" };
			displayName = "STR_MAR_Silber_Mine";
			processor = "silver_processing";
			processorname = "STR_MAR_Silver_processing";
            item = "pickaxe";
            mined[] = { "silver_unrefined" };
            zoneSize = 30;
			level = 5;
        };

		class wood {
            amount = 2;
            zones[] = { };
			displayName = "STR_MAR_Wood_Mine";
			processor = "wood_processing";
			processorname = "STR_MAR_Wood_processing";
            item = "axe";
            mined[] = { "wood_unrefined" };
            zoneSize = 30;
			level = 1;
        };
		
		class coal {
            amount = 2;
            zones[] = { "coal_mine" };
			displayName = "STR_MAR_Coal_Mine";
			processor = "coal_processing";
			processorname = "STR_MAR_Coal_processing";
            item = "pickaxe";
            mined[] = { "coal_unrefined" };
            zoneSize = 30;
			level = 2;
        };
		
        class rock {
            amount = 2;
            zones[] = { "rock_quarry" };
			displayName = "STR_MAR_Rock_Quarry";
			processor = "rock_processing";
			processorname = "STR_MAR_Rock_Processing";
            item = "pickaxe";
            mined[] = { "rock" };
            zoneSize = 30;
			level = 1;
        };

        class oil_unprocessed {
            amount = 2;
            zones[] = { "oil_field_1", "oil_field_2" };
			displayName = "STR_MAR_Oil_Field";
			processor = "OilP";
			processorname = "STR_MAR_Oil_Processing";
            item = "shovel";
            mined[] = { "oil_unprocessed" };
            zoneSize = 30;
			level = 4;
        };
    };
	class Processing {
        class copper_unrefined {
			level = 2;
            processor = "copper_processing";
			processorname = "STR_MAR_Copper_Processing";
        };

        class iron_unrefined {
			processor = "iron_processing";
			processorname = "STR_MAR_Iron_processing";
			level = 3;
        };

        class salt_unrefined {
			processor = "salt_processing";
			processorname = "STR_MAR_Salt_Processing";
			level = 4;
        };

        class sand {
			processor = "sand_processing";
			processorname = "STR_MAR_Sand_Processing";
			level = 3;
        };

        class diamond_uncut {
			processor = "diamond_processing";
			processorname = "STR_MAR_Diamond_Processing";
			level = 7;
        };
		
		class golderz {
			processor = "gold_processing";
			processorname = "STR_MAR_Gold_processing";
			level = 6;
        };
		
		class silver {
			processor = "silver_processing";
			processorname = "STR_MAR_Silver_processing";
			level = 5;
        };

		class wood {
			processor = "wood_processing";
			processorname = "STR_MAR_Wood_processing";
			level = 1;
        };
		
		class coal {
			processor = "coal_processing";
			processorname = "STR_MAR_Coal_processing";
			level = 2;
        };
		
		class stahl {
			processor = "stahl_processing";
			processorname = "STR_MAR_Stahl_processing";
			level = 5;
        };
		
		class platin {
			processor = "platin_processing";
			processorname = "STR_MAR_Platin_processing";
			level = 6;
        };
		
		class silberschmuck {
			processor = "schmuck_processing";
			processorname = "STR_Shops_jewels";
			level = 7;
        };
		
		class goldschmuck {
			processor = "schmuck_processing";
			processorname = "STR_Shops_jewels";
			level = 8;
        };
		
		class brilliantschmuck {
			processor = "schmuck_processing";
			processorname = "STR_Shops_jewels";
			level = 9;
        };
		
        class rock {
			processor = "rock_processing";
			processorname = "STR_MAR_Rock_Processing";
			level = 1;
        };

        class oil_unprocessed {
			processor = "OilP";
			processorname = "STR_MAR_Oil_Processing";
			level = 4;
        };
    };
	class Shops {
        class Industrie {
			level = 2;
            Shops = "iron_copper_trader";
			Shopsname = "STR_MAR_Iron_Copper_Trader";
        };
		
		class juwelier {
			level = 7;
            Shops = "Juwelier_trader";
			Shopsname = "STR_MAR_Juwelier_Trader";
        };

        class baustoffe {
			level = 1;
			Shops = "baustoffe_trader";
			Shopsname = "STR_Shops_baustoffe";
        };

        class oil_unprocessed {
			Shops = "oil_trader";
			Shopsname = "STR_MAR_Oil_Trader";
			level = 4;
        };
    };
};