


_test1 = civ_1 getVariable ["ACE_medical_pain", 0];
_test2 = civ_1 getVariable ["ACE_medical_morphine", 0];
_test3 = civ_1 getVariable ["ACE_medical_bloodVolume", 100];
_test4 = civ_1 getVariable ["ACE_isUnconscious", false];
_test5 = civ_1 getVariable ["ACE_medical_tourniquets", [0,0,0,0,0,0]];
_test6 = civ_1 getVariable ["ACE_medical_openWounds", []];
_test7 = civ_1 getVariable ["ACE_medical_bandagedWounds", []];
_test8 = civ_1 getVariable ["ACE_medical_internalWounds", []];
_test9 = civ_1 getVariable ["ACE_medical_lastUniqueWoundID", 1];
_test10 = civ_1 getVariable ["ACE_medical_heartRate", 80];
_test11 = civ_1 getVariable ["ACE_medical_heartRateAdjustments", []];
_test12 = civ_1 getVariable ["ACE_medical_bloodPressure", [80, 120]];
_test13 = civ_1 getVariable ["ACE_medical_peripheralResistance", 100];
_test14 = civ_1 getVariable ["ACE_medical_fractures", []];
_test15 = civ_1 getVariable ["ACE_medical_triageLevel", 0];
_test16 = civ_1 getVariable ["ACE_medical_triageCard", []];
_test17 = civ_1 getVariable ["ACE_medical_salineIVVolume", 0];
_test18 = civ_1 getVariable ["ACE_medical_plasmaIVVolume", 0];
_test19 = civ_1 getVariable ["ACE_medical_bloodIVVolume", 0];
_test20 = civ_1 getVariable ["ACE_medical_bodyPartStatus", [0,0,0,0,0,0]];
_test21 = civ_1 getVariable ["ACE_medical_airwayStatus", 100];
_test22 = civ_1 getVariable ["ACE_medical_airwayOccluded", false];
_test23 = civ_1 getVariable ["ACE_medical_airwayCollapsed", false];
_test24 = civ_1 getVariable ["ACE_medical_addedToUnitLoop", false];
_test25 = civ_1 getVariable ["ACE_medical_inCardiacArrest", false];
_test26 = civ_1 getVariable ["ACE_medical_hasLostBlood", 0];
_test27 = civ_1 getVariable ["ACE_medical_isBleeding", false];
_test28 = civ_1 getVariable ["ACE_medical_hasPain", false];
_test29 = civ_1 getVariable ["ACE_medical_painSuppress", 0];
_test30 = damage civ_1;



diag_log format ["ACE_medical_pain: %1 ",_test1];
diag_log format ["ACE_medical_morphine: %1 ",_test2];
diag_log format ["ACE_medical_bloodVolume: %1 ",_test3];
diag_log format ["ACE_isUnconscious: %1 ",_test4];
diag_log format ["ACE_medical_tourniquets: %1 ",_test5];
diag_log format ["ACE_medical_openWounds: %1 ",_test6];
diag_log format ["ACE_medical_bandagedWounds: %1 ",_test7];
diag_log format ["ACE_medical_internalWounds: %1 ",_test8];
diag_log format ["ACE_medical_lastUniqueWoundID: %1 ",_test9];
diag_log format ["ACE_medical_heartRate: %1 ",_test10];
diag_log format ["ACE_medical_heartRateAdjustments: %1 ",_test11];
diag_log format ["ACE_medical_bloodPressure: %1 ",_test12];
diag_log format ["ACE_medical_peripheralResistance: %1 ",_test13];
diag_log format ["ACE_medical_fractures: %1 ",_test14];
diag_log format ["ACE_medical_triageLevel: %1 ",_test15];
diag_log format ["ACE_medical_triageCard: %1 ",_test16];
diag_log format ["ACE_medical_salineIVVolume: %1 ",_test17];
diag_log format ["ACE_medical_plasmaIVVolume: %1 ",_test18];
diag_log format ["ACE_medical_bloodIVVolume: %1 ",_test19];
diag_log format ["ACE_medical_bodyPartStatus: %1 ",_test20];
diag_log format ["ACE_medical_airwayStatus: %1 ",_test21];
diag_log format ["ACE_medical_airwayOccluded: %1 ",_test22];
diag_log format ["ACE_medical_airwayCollapsed: %1 ",_test23];
diag_log format ["ACE_medical_addedToUnitLoop: %1 ",_test24];
diag_log format ["ACE_medical_inCardiacArrest: %1 ",_test25];
diag_log format ["ACE_medical_hasLostBlood: %1 ",_test26];
diag_log format ["ACE_medical_isBleeding: %1 ",_test27];
diag_log format ["ACE_medical_hasPain: %1 ",_test28];
diag_log format ["ACE_medical_painSuppress: %1 ",_test29];
diag_log format ["damage: %1 ",_test30];
