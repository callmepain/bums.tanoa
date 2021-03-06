class Socket_Reciever {
    tag = "SOCK";
    class SQL_Socket {
        file = "core\session";
        class dataQuery {};
        class insertPlayerInfo {};
        class requestReceived {};
        class syncData {};
        class updatePartial {};
        class updateRequest {};
    };
};

class SpyGlass {
    tag = "SPY";
    class Functions {
        file = "SpyGlass";
        class cookieJar{};
        class notifyAdmins{};
        class observe{};
    };
};

class Life_Client_Core {
    tag = "life";

    class Master_Directory {
        file = "core";
        class initCiv {};
        class initCop {};
        class initMedic {};
        class initADAC {};
        class setupActions {};
        class setupEVH {};
        class survival {};
        class welcomeNotification {};
		class bloodcount {};
		class mapmarker {};
    };

    class Actions {
        file = "core\actions";		
		class carProcessingMenu;
		class car_repair {};
		class craftAction {};
		class storeContainer {};
		class container_sell_menu {};
		class repair_menu {};
        class arrestAction {};
        class buyLicense {};
        class captureHideout {};
        class catchFish {};
        class dpFinish {};
        class dropFishingNet {};
        class escortAction {};
        class gather {};
        class getDPMission {};
        class gutAnimal {};
        class healHospital {};
        class impoundAction {};
        class mine {};
        class newsBroadcast {};
        class packupSpikes {};
        class pickupItem {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class processCarAction {};
        class pulloutAction {};
        class putInCar {};
        class rechnung {};
        class removeContainer {};
        class repairTruck {};
        class restrainAction {};
        class robAction {};
        class searchAction {};
        class searchVehAction {};
        class seizePlayerAction {};
        class serviceChopper {};
        class stopEscorting {};
        class storeVehicle {};
        class surrender {};
        class ticketAction {};
        class unrestrain {};
		class hackbank {};
    };

    class Admin {
        file = "core\admin";
        class adminCompensate {};
        class adminDebugCon {};
        class adminFreeze {};
        class admingetID {};
        class adminGodMode {};
        class adminid {};
        class admininfo {};
        class adminMarkers {};
        class adminMenu {};
        class adminQuery {};
        class adminSpectate {};
        class adminTeleport {};
        class adminTpHere {};
		class player_level_get {};
    };
	
	class Adac {
        file = "core\adac";
        class adacLoadout {};
        class adacMarkers {};
    };
	
	class farming {
        file = "core\farming";
        class grow {};
        class harvest {};
    };
	
	class drugs {
        file = "core\drugs";
        class useCocaine {};
        class useHeroin {};
		class useMarijuana {};
    };
	
    class Civilian {
        file = "core\civilian";
        class civLoadout {};
        class civMarkers {};
        class demoChargeTimer {};
        class freezePlayer {};
        class jail {};
        class jailMe {};
        class kaution {};
        class kautionInit {};
        class kautionLBChange {};
        class knockedOut {};
        class knockoutAction {};
        class removeLicenses {};
        class robPerson {};
        class robReceive {};
        class tazed {};
    };

    class Config {
        file = "core\config";
		class craftCfg {};
        class houseConfig {};
        class itemWeight {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
    };

	class SkillSystem 
	{	
		file = "core\SkillSystem";
		class profSetUp {};
        class grabSkills {};
		class addexp {};
		class getnext {};
		class getnow {};
		class getnext_menu {};
		class getnow_menu {};
		class get_next_car {};
	};
	
	class Markers 
	{	
		file = "core\markers";
		class del_markers {};
        class get_markers {};
	};
	
	class BlackJack 
	{	
		file = "core\blackjack";
		class bj_mischen {};
        class bj_nehmen {};
		class bj_stop {};
		class blackjack_init {};
		class bj_geben {};
		class bj_clear {};
		class bj_get_punkte {};
		class bj_end_dealer {};
	};
	
	class Spritverbrauch 
	{	
		file = "core\sprit";
		class spritverbrauch {};
	};
	
	class Ausweis 
	{	
		file = "core\ausweis";
		class zeige_ausweis {};
		class open_ausweis {};
	};
	
	class Schliessfach 
	{	
		file = "core\schliessfach";
		class openSchliessfach {};
		class erweiternSf {};
		class buySchliessfach {};
        class schliessfachInventory {};
		class schliessfachStoreItem {};
		class schliessfachTakeItem {};
		class schliessfachUpdateWeight {};
	};
	
    class Cop {
        file = "core\cop";
        class bountyReceive {};
        class containerInvSearch {};
        class copInteractionMenu {};
        class copLights {};
        class copLoadout {};
        class copMarkers {};
        class copSearch {};
        class copSiren {};
        class doorAnimate {};
        class fedCamDisplay {};
        class jail_time {};
        class licenseCheck {};
        class licensesRead {};
        class questionDealer {};
        class radar {};
        class repairDoor {};
        class restrain {};
        class searchClient {};
        class seizeClient {};
        class sirenLights {};
        class spikeStripEffect {};
        class ticketGive {};
        class ticketPaid {};
        class ticketPay {};
        class ticketPrompt {};
        class vehInvSearch {};
        class wantedGrab {};
    };

    class Dialog_Controls {
        file = "dialog\function";
        class bankDeposit {};
        class bankMenu {};
        class bankTransfer {};
        class bankWithdraw {};
        class displayHandler {};
        class gangDeposit {};
        class gangWithdraw {};
        class garageLBChange {};
        class garageLBChangeImpound {};
        class impoundMenu {};
        class impoundVehiclesMenu {};
        class insureCar {};
        class progressBar {};
        class safeFix {};
        class safeInventory {};
        class safeOpen {};
        class safeTake {};
        class sellGarage {};
        class setMapPosition {};
        class spawnConfirm {};
        class spawnMenu {};
        class spawnPointCfg {};
        class spawnPointSelected {};
        class unimpound {};
        class unimpoundvehicles {};
        class vehicleGarage {};
        class wireTransfer {};    
		class admin_level {};
		
		};
	
    class Functions {
        file = "core\functions";
        class AAN {};
        class accType {};
        class actionKeyHandler {};
        class animSync {};
        class calWeightDiff {};
        class clearVehicleAmmo {};
        class dropItems {};
        class escInterupt {};
        class fetchCfgDetails {};
        class fetchDeadGear {};
        class fetchVehInfo {};
        class isDamaged {};
        class giveDiff {};
        class handleDamage {};
        class handleInv {};
        class handleItem {};
        class hideObj {};
        class hudCrew {};
        class hudSetup {};
        class hudUpdate {};
        class inventoryClosed {};
        class inventoryOpened {};
        class isUIDActive {};
        class keyHandler {};
        class loadDeadGear {};
        class loadGear {};
        class nearATM {};
        class nearestDoor {};
        class nearUnits {};
        class numberText {};
        class onFired {};
        class onTakeItem {};
        class playerSkins {};
        // class playerTags {};
        class postNewsBroadcast {};
        class pullOutVeh {};
        class pushObject {};
        class receiveItem {};
        class receiveMoney {};
        class revealObjects {};
        class saveGear {};
        class searchPosEmpty {};
        class simDisable {};
        class stripDownPlayer {};
        class tazeSound {};
        class teleport {};
        class whereAmI {};
		class woodcutting {};
		class ragdoll {};
    };
	
	class Market
	{
		file = "core\market";
		
		class boerse {};
		// class boerse_buy {};
		class boerse_config  {};
		class boerseLBChange {};
		// class boerse_license {};
		// class boerse_menu {};
		// class boerse_vehicle {};
		// class vehicleShopMarketChange {};
		
		
		class openMarketView;
		class refreshMarketView;
		// class marketShortView;
		class marketBuy;
		class marketSell;
		class marketGetBuyPrice;
		class marketGetSellPrice;
		class marketconfiguration;
		class marketReset;
		class marketChange;
		class marketGetRow;
		class marketGetPriceRow;
		class marketSetPriceRow;
	};

    class Gangs {
        file = "core\gangs";
        class createGang {};
        class gangCreated {};
        class gangDisband {};
        class gangDisbanded {};
        class gangInvite {};
        class gangInvitePlayer {};
        class gangKick {};
        class gangLeave {};
        class gangMenu {};
        class gangNewLeader {};
        class gangUpgrade {};
        class initGang {};
    };

    class Housing {
        file = "core\housing";
        class buyHouse {};
        class buyHouseGarage {};
        class containerMenu {};
        class copBreakDoor {};
        class copHouseOwner {};
        class garageRefund {};
        class getBuildingPositions {};
        class houseMenu {};
        class initHouses {};
        class lightHouse {};
        class lightHouseAction {};
        class lockHouse {};
        class lockupHouse {};
        class placeContainer {};
        class PlayerInBuilding {};
        class raidHouse {};
        class sellHouse {};
        class sellHouseGarage {};
    };

    class Items {
        file = "core\items";
        class blastingCharge {};
        class boltcutter {};
        class defuseKit {};
        class flashbang {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class ohrStecker {};
        class placestorage {};
        class spikeStrip {};
        class storageBox {};
    };

    class Medical_System {
        file = "core\medical";
        class deathScreen {};
        class medicLights {};
        class medicLoadout {};
        class medicMarkers {};
        class medicRequest {};
        class medicSiren {};
        class medicSirenLights {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class requestMedic {};
        class respawned {};
        class revived {};
        class revivePlayer {};
    };

    class Network {
        file = "core\functions\network";
        class broadcast {};
        class corpse {};
        class jumpFnc {};
        class say3D {};
        class setFuel {};
        class soundDevice {};
    };

    class Player_Menu 
	{
        file = "core\pmenu";
        class cellphone {};
        class giveItem {};
        class giveMoney {};
        class keyDrop {};
        class keyGive {};
        class keyMenu {};
        class p_openMenu {};
        class p_updateMenu {};
        class pardon {};
        class removeItem {};
        class s_onChar {};
        class s_onCheckedChange {};
        class s_onSliderChange {};
        class settingsMenu {};
        class updateViewDistance {};
        class useItem {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class newMsgInit {};
		class newMsgSend {};
		class showMsg {};
		class smartphone {};
		class wanted2 {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
		class wantedadd2 {};    
	};

    class Shops {
        file = "core\shops";
        class atmMenu {};
        class buyClothes {};
        class changeClothes {};
        class chopShopMenu {};
        class chopShopSelection {};
        class chopShopSell {};
        class clothingFilter {};
        class clothingMenu {};
        class fuelLBchange {};
        class fuelStatOpen {};
        class levelCheck {};
        class vehicleShop3DPreview {};
        class vehicleShopBuy {};
        class vehicleShopEnd3DPreview {};
        class vehicleShopInit3DPreview {};
        class vehicleShopLBChange {};
        class vehicleShopMenu {};
        class virt_buy {};
        class virt_menu {};
        class virt_sell {};
        class virt_update {};
        class weaponShopAccs {};
        class weaponShopBuySell {};
        class weaponShopFilter {};
        class weaponShopMags {};
        class weaponShopMenu {};
        class weaponShopSelection {};
    };

    class Vehicle {
        file = "core\vehicle";
        class addVehicle2Chain {};
        class autosafe {};
        class colorVehicle {};
        class deviceMine {};
        class FuelRefuelcar {};
        class fuelStore {};
        class fuelSupply {};
        class lockVehicle {};
        class openInventory {};
        class vehiclecolor3DRefresh {};
        class vehicleOwners {};
        class vehicleUpdateTrunkWeight {};
        class vehicleWeight {};
        class vehInventory {};
        class vehStoreItem {};
        class vehTakeItem {};
        class vInteractionMenu {};
    };
};

class MSG_SYSTEM {
	tag = "MSG";
		class Master {
		file = "dialog\derleon\msg";
		class ctrl {};
		class handle {};
	};
};