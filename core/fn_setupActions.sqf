/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
    };
};


	// life_actions = life_actions + [player addAction["Admin",life_fnc_copInteractionMenu,cursorTarget,0,false,false,"",'']];
	//life_actions = life_actions + [player addAction["ausweis",life_fnc_zeige_ausweis,"",0,false,false,"",'']];
	life_actions = life_actions + [player addAction["Personalausweis zeigen",{[player] remoteExecCall ["life_fnc_zeige_ausweis",cursorTarget];},"",0,false,false,"",'
		isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];