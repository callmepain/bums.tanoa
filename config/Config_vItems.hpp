/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*/
class VirtualShops {
    //Virtual Shops
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "";
        items[] = { "fuelFB5L","fuelFD25L","fuelFK50L","waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick","axe","pickaxe", "shovel", "jackhammer", "toolkit", "peach", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        conditions = "";
        items[] = { "waterBottle", "rabbit", "redgull", "tbacon", "toolkit","fuelFB5L","fuelFD25L","fuelFK50L"};
    };
	
	 class adac_market {
        name = "STR_Shops_Market";
        side = "adac";
        conditions = "";
        items[] = { "waterBottle", "rabbit", "redgull", "tbacon", "toolkit","fuelFB5L","fuelFD25L","fuelFK50L"};
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = { "waterBottle", "rabbit", "redgull", "tbacon", "lockpick","axe", "pickaxe", "shovel", "jackhammer", "toolkit", "boltcutter", "blastingcharge" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        conditions = "";
        items[] = { "waterBottle", "rabbit", "redgull", "tbacon", "lockpick","axe", "pickaxe", "shovel", "jackhammer", "toolkit", "boltcutter", "blastingcharge" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        conditions = "";
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        conditions = "";
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        conditions = "";
        items[] = { "coffee", "donuts", "redgull", "toolkit"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        conditions = "";
        items[] = { "cocaine_processed", "heroin_processed", "marijuana","pilze_processed","lsd_processed" };
    };

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        conditions = "";
        items[] = { "oil_processed", "pickaxe" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        conditions = "";
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
    };

/*    class glass {
        name = "STR_Shops_Glass";
        side = "civ";
        conditions = "";
        items[] = { "glass" };
    };*/

    class iron  {
        name = "STR_Shops_Minerals";
        side = "civ";
        conditions = "";
        items[] = { "coal_refined","iron_refined", "copper_refined","stahlbarren_refined","platinbarren_refined","golderz_refined","silver_refined" };
    };

   /* class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        conditions = "";
        items[] = { "diamond_uncut", "diamond_cut" };
    };*/

  /*  class salt {
        name = "STR_Shops_Salt";
        side = "civ";
        conditions = "";
        items[] = { "salt_refined" };
    };*/
	
	class baustoffe {
        name = "STR_Shops_baustoffe";
        side = "civ";
        conditions = "";
        items[] = { "salt_refined","wood_refined","cement", "glass"};
    };
	
/*	class coal {
        name = "STR_Shops_Coal";
        side = "civ";
        conditions = "";
        items[] = { "coal_refined" };
    };*/
	
/*	class wood {
        name = "STR_Shops_Wood";
        side = "civ";
        conditions = "";
        items[] = { "wood_refined" };
    };*/
	
	class silberschmuck {
        name = "STR_Shops_jewels";
        side = "civ";
        conditions = "";
        items[] = { "diamond_uncut", "diamond_cut","silberschmuck_refined","goldschmuck_refined","brilliantschmuck_refined" };
    };

 /*   class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        conditions = "";
        items[] = { "cement" };
    };*/

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        conditions = "";
        items[] = { "goldbar" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        conditions = "";
        items[] = { "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "toolkit", "defusekit" };
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Virtual Items

    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 120;
        sellPrice = 48;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_pickaxe.paa";
    };
	
	class axe {
        variable = "axe";
        displayName = "STR_Item_axe";
        weight = 2;
        buyPrice = 120;
        sellPrice = 48;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_axe.paa";
    };
	
	class shovel {
        variable = "shovel";
        displayName = "STR_Item_Shovel";
        weight = 2;
        buyPrice = 100;
        sellPrice = 48;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_shovel.paa";
    };
	
	class jackhammer {
        variable = "jackhammer";
        displayName = "STR_Item_Jackhammer";
        weight = 10;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_jackhammer.paa";
    };

    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 900;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_defibrillator.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 350;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };
	
	class fuelFB5L {
        variable = "fuelFB5L";
        displayName = "STR_Item_fuelFB5L";
        weight = 5;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };
	
	class fuelFD25L {
        variable = "fuelFD25L";
        displayName = "STR_Item_fuelFD25L";
        weight = 25;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };

	class fuelFK50L {
        variable = "fuelFK50L";
        displayName = "STR_Item_fuelFK50L";
        weight = 50;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };
	
		class fuelFBE {
        variable = "fuelFBE";
        displayName = "STR_Item_fuelFBE";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };
	
	class fuelFDE {
        variable = "fuelFDE";
        displayName = "STR_Item_fuelFDE";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };

	class fuelFKE {
        variable = "fuelFKE";
        displayName = "STR_Item_fuelFKE";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_fuel.paa";
    };
	
    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1200;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 5000;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 14527;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 35000;
        sellPrice = 14000;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 5000;
        sellPrice = 2000;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 400;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 40000;
        sellPrice = 16000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 90000;
        sellPrice = 36000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_storageBig.paa";
    };

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_copper.paa";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2200;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_Steinsalt";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_saltProcessed.paa";
    };
	
	class golderz_unrefined {
        variable = "goldUnrefined";
        displayName = "STR_Item_GoldOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_golderzUnprocessed.paa";
    };

    class golderz_refined {
        variable = "goldRefined";
        displayName = "STR_Item_GoldIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_golderzProcessed.paa";
    };
	
	class platinbarren_refined {
        variable = "platinRefined";
        displayName = "STR_Item_PlatinIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_platinProcessed.paa";
    };
	
	class stahlbarren_refined {
        variable = "stahlRefined";
        displayName = "STR_Item_StahlIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_stahlProcessed.paa";
    };
	
	class silberschmuck_refined {
        variable = "silberschmuckRefined";
        displayName = "STR_Item_Silberschmuck";
        weight = 3;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_silberschmuckProcessed.paa";
    };
	
	class goldschmuck_refined {
        variable = "goldschmuckRefined";
        displayName = "STR_Item_Goldschmuck";
        weight = 3;
        buyPrice = -1;
        sellPrice = 4000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_goldschmuckProcessed.paa";
    };
	
	class brilliantschmuck_refined {
        variable = "brilliantschmuckRefined";
        displayName = "STR_Item_Brilliantschmuck";
        weight = 3;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_BrilliantschmuckProcessed.paa";
    };
	
	class silver_unrefined {
        variable = "silverUnrefined";
        displayName = "STR_Item_SilberOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_silverUnprocessed.paa";
    };

    class silver_refined {
        variable = "silverRefined";
        displayName = "STR_Item_SilberIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 4000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_silverProcessed.paa";
    };
	
	class wood_unrefined {
        variable = "woodUnrefined";
        displayName = "STR_Item_woodUnrefined";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_wood.paa";
    };

    class wood_refined {
        variable = "woodRefined";
        displayName = "STR_Item_woodRefined";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_bredder.paa";
    };
	
	class coal_unrefined {
        variable = "coalUnrefined";
        displayName = "STR_Item_CoalOre";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_coalUnprocessed.paa";
    };

    class coal_refined {
        variable = "coalRefined";
        displayName = "STR_Item_CoalP";
        weight = 1;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_coalProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_cement.paa";
    };

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "STR_Item_Heroin";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2503;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1853;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_marijuana.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3900;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_cocaineProcessed.paa";
    };
	
    class lsd_unprocessed {
        variable = "lsdUnprocessed";
        displayName = "STR_Item_LSDU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_aga.paa";
        processedItem = "lsd_processed";
    };

    class lsd_processed {
        variable = "lsdProcessed";
        displayName = "STR_Item_LSDP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3900;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_lsd.paa";
    };
	
	class pilze_processed {
        variable = "pilze_processed";
        displayName = "STR_Item_zauberpilze";
        weight = 2;
        buyPrice = -1;
        sellPrice = 3900;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_pilze.paa";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 10;
        sellPrice = 4;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_coffee.paa";
    };
	
	class ohrstecker {
        variable = "ohrstecker";
        displayName = "Ohrstecker";
        weight = 1;
        buyPrice = 25;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_ohrstecker.paa";
    };
	
	class handschellen {
        variable = "handschellen";
        displayName = "Handschellen";
        weight = 1;
        buyPrice = 100;
        sellPrice = 5;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_handschellen.paa";
    };
	
	class kabelbinder {
        variable = "kabelbinder";
        displayName = "Kabelbinder";
        weight = 1;
        buyPrice = 100;
        sellPrice = 5;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_kabelbinder.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_waterBottle.paa";
    };

    //Food
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = -1;
        sellPrice = 50;
        illegal = false;
        edible = 10;
        icon = "icons\items\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = -1;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "icons\items\ico_bananen.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 2;
        sellPrice = 1;
        illegal = false;
        edible = 40;
        icon = "icons\items\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 12;
        sellPrice = 5;
        illegal = false;
        edible = 30;
        icon = "icons\items\ico_donuts.paa";
    };

    class rabbit_raw {
        variable = "rabbitRaw";
        displayName = "STR_Item_RabbitRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_rabbitRaw.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = 6;
        sellPrice = 2;
        illegal = false;
        edible = 20;
        icon = "icons\items\ico_rabbit.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
        displayName = "STR_Item_SalemaRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 5;
        sellPrice = 2;
        illegal = false;
        edible = 30;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 6;
        sellPrice = 2;
        illegal = false;
        edible = 25;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 25;
        sellPrice = 12;
        illegal = false;
        edible = 30;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 50;
        sellPrice = 25;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 30;
        sellPrice = 15;
        illegal = false;
        edible = 80;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 35;
        sellPrice = 17;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2;
        illegal = true;
        edible = -1;
        icon = "icons\items\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 250;
        sellPrice = 125;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_turtleSoup.paa";
    };

    class hen_raw {
        variable = "henRaw";
        displayName = "STR_Item_HenRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_wholeChickenRaw.paa";
    };

    class hen {
        variable = "hen";
        displayName = "STR_Item_Hen";
        weight = 1;
        buyPrice = 30;
        sellPrice = 15;
        illegal = false;
        edible = 65;
        icon = "icons\items\ico_wholeChicken.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
        displayName = "STR_Item_RoosterRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_chickenDrumstickRaw.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "STR_Item_Rooster";
        weight = 115;
        buyPrice = 45;
        sellPrice = 27;
        illegal = false;
        edible = 45;
        icon = "icons\items\ico_chickenDrumstick.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
        displayName = "STR_Item_SheepRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_lambChopRaw.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "STR_Item_Sheep";
        weight = 2;
        buyPrice = 50;
        sellPrice = 25;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_lambChop.paa";
    };

    class goat_raw {
        variable = "goatRaw";
        displayName = "STR_Item_GoatRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2;
        illegal = false;
        edible = -1;
        icon = "icons\items\ico_muttonLegRaw.paa";
    };

    class goat {
        variable = "goat";
        displayName = "STR_Item_Goat";
        weight = 2;
        buyPrice = 75;
        sellPrice = 37;
        illegal = false;
        edible = 100;
        icon = "icons\items\ico_muttonLeg.paa";
    };
};
