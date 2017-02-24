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
class schliessfach {

	class Stufe0 {
		preis = 5000;
		next = "Stufe1";
		groesse = 100; 
	};
	
	class Stufe1 {
		preis = 10000;
		next = "Stufe2";
		groesse = 250; 
	};

	class Stufe2 {
		preis = 20000;
		next = "Stufe3";
		groesse = 500;
	};

	class Stufe3 {
		preis = 50000;
		next = "Stufe4"; 
		groesse = 1000;
	};

	class Stufe4 {
		preis = 100000;
		next = "Stufe5"; 
		groesse = 2000;
	};
	
	class Stufe5 {
		preis = 200000;
		next = "Stufe6"; 
		groesse = 4000;
	};
	
	class Stufe6 {
		preis = 400000;
		next = "Stufe7"; 
		groesse = 8000;
	};
	
	class Stufe7 {
		preis = 800000;
		next = "Stufe7"; 
		groesse = 16000;
	};

};
class cfgschliessfach {
	kaufen = 10000;
};