/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class profession {
	class Ernten {
		displayName = "STR_PRO_Ernten";
		variable = "Ernten";
		baseEXPgain = 20; 
		icon = "icons\skillsystem\ico_ernten.paa";
		side = "civ";
		Resource = "Resources";
	};

	class Rohstoffabbau {
		displayName = "STR_PRO_Rohstoffabbau";
		variable = "Rohstoffabbau";
		baseEXPgain = 10;
		icon = "icons\skillsystem\ico_rohstoff.paa";
		side = "civ";
		Resource = "Minerals";
	};

	class FahrenPKW {
		displayName = "STR_PRO_Fahren_PKW";
		variable = "FahrenPKW";
		baseEXPgain = 100;
		icon = "icons\skillsystem\ico_auto.paa";
		side = "civ";
		time = 30;
	};

	class FahrenLKW {
		displayName = "STR_PRO_Fahren_LKW";
		variable = "FahrenLKW"; 
		baseEXPgain = 20;
		icon = "icons\skillsystem\ico_lkw.paa";
		side = "civ";
		time = 30;
	};

	class Fliegen {
		displayName = "STR_PRO_Fliegen";
		variable = "Fliegen";
		baseEXPgain = 30;
		icon = "icons\skillsystem\ico_fliegen.paa";
		side = "civ";
		time = 30;
	};
	class Beschlagnahmen {
		displayName = "STR_PRO_Beschlagnahmen";
		variable = "Beschlagnahmen";
		baseEXPgain = 200;
		icon = "icons\items\ico_pickaxe.paa";
		side = "cop";
	};
	class Durchsuchen {
		displayName = "STR_PRO_Durchsuchen";
		variable = "Durchsuchen";
		baseEXPgain = 10;
		icon = "icons\items\ico_pickaxe.paa";
		side = "cop";
	};
	class Blut {
		displayName = "STR_PRO_Blut";
		variable = "Blut";
		baseEXPgain = 10;
		icon = "icons\items\ico_pickaxe.paa";
		side = "med";
	};
};
