/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class oil {
        MaterialsReq[] = {{"oil_unprocessed",3}};
        MaterialsGive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        //ScrollText = "Process Oil";
        NoLicenseCost = 1200;
    };

    class diamond {
        MaterialsReq[] = {{"diamond_uncut",3}};
        MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
        //ScrollText = "Cut Diamonds";
        NoLicenseCost = 1750;
    };

    class copper {
        MaterialsReq[] = {{"copper_unrefined",3}};
        MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
        NoLicenseCost = 750;
    };

    class iron {
        MaterialsReq[] = {{"iron_unrefined",3}};
        MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 1120;
    };

    class sand {
        MaterialsReq[] = {{"sand",3}};
        MaterialsGive[] = {{"glass",1}};
        Text = "STR_Process_Sand";
        //ScrollText = "Melt Sand into Glass";
        NoLicenseCost = 650;
    };

    class salt {
        MaterialsReq[] = {{"salt_unrefined",3}};
        MaterialsGive[] = {{"salt_refined",1}};
        Text = "STR_Process_Salt";
        //ScrollText = "Refine Salt";
        NoLicenseCost = 450;
    };

	class cement {
        MaterialsReq[] = {{"rock",3}};
        MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
	
	class wood {
        MaterialsReq[] = {{"wood_unrefined",3}};
        MaterialsGive[] = {{"wood_refined",1}};
        Text = "STR_Process_wood";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
	
	class coal {
        MaterialsReq[] = {{"coal_unrefined",3}};
        MaterialsGive[] = {{"coal_refined",1}};
        Text = "STR_Process_coal";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
	
	class silver {
        MaterialsReq[] = {{"silver_unrefined",3}};
        MaterialsGive[] = {{"silver_refined",1}};
        Text = "STR_Process_silver";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
	
	class golderz {
        MaterialsReq[] = {{"golderz_unrefined",3}};
        MaterialsGive[] = {{"golderz_refined",1}};
        Text = "STR_Process_gold";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
	
	///////multi//////////
	
	class stahl {
        MaterialsReq[] = {{"coal_refined",2},{"iron_refined",1}};
        MaterialsGive[] = {{"stahlbarren_refined",1}};
        Text = "STR_Process_stahl";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 5000;
    };
	
	class platinbarren {
        MaterialsReq[] = {{"golderz_refined",2},{"silver_refined",1}};
        MaterialsGive[] = {{"platinbarren_refined",1}};
        Text = "STR_Process_platin";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 5000;
    };
	
	class silberschmuck {
        MaterialsReq[] = {{"silver_refined",2},{"diamond_cut",1}};
        MaterialsGive[] = {{"silberschmuck_refined",1}};
        Text = "STR_Process_silberschmuck";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 5000;
    };
	
	class goldschmuck {
        MaterialsReq[] = {{"golderz_refined",2},{"diamond_cut",1}};
        MaterialsGive[] = {{"goldschmuck_refined",1}};
        Text = "STR_Process_goldschmuck";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 5000;
    };
	
	class brilliantschmuck {
        MaterialsReq[] = {{"platinbarren_refined",2},{"diamond_cut",1}};
        MaterialsGive[] = {{"brilliantschmuck_refined",1}};
        Text = "STR_Process_brilliantschmuck";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 5000;
    };
	
	
	////////////drugs//////////////
    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",4}};
        MaterialsGive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
        NoLicenseCost = 1500;
    };

    class marijuana {
        MaterialsReq[] = {{"cannabis",4}};
        MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 500;
    };
	
	
    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",4}};
        MaterialsGive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 1750;
    };
	
	class lsd {
        MaterialsReq[] = {{"lsd_unprocessed",4}};
        MaterialsGive[] = {{"lsd_processed",1}};
        Text = "STR_Process_LSD";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 1750;
    };

};
