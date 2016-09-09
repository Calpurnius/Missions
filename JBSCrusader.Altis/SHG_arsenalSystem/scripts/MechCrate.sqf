/*
Author: Jmaster[SHG]
created for SpearheadGaming @ spearheadgaming.net
*/


//config for arsenal,use weapon/item classnames

_weapons = [
"rhs_weap_m4a1",
"rhs_weap_m4a1_m203s",
"rhs_weap_m16a4",
"rhs_weap_m14ebrri",
"rhs_weap_m240B",
"rhs_weap_m249_pip_S",
"rhs_weap_M136",
"rhs_weap_m27iar",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp",
"RH_m9"
];

_magazines = [
"RH_15Rnd_9x19_M9",
"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
"rhsusf_20Rnd_762x51_m118_special_Mag",
"rhsusf_20Rnd_762x51_m993_Mag",
"rhsusf_20Rnd_762x51_m62_Mag",
"rhs_200rnd_556x45_M_SAW",
"rhs_200rnd_556x45_B_SAW",
"rhs_200rnd_556x45_T_SAW",
"rhsusf_50Rnd_762x51",
"rhsusf_100Rnd_762x51",
"rhsusf_50Rnd_762x51_m62_tracer",
"SmokeShellBlue",
"SmokeShellGreen",
"SmokeShellOrange",
"SmokeShellPurple",
"SmokeShellRed",
"SmokeShellYellow",
"1Rnd_HE_Grenade_shell",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"1Rnd_Smoke_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"rhs_mag_m67",
"SmokeShell",
"DemoCharge_Remote_Mag",
"SatchelCharge_Remote_Mag",
"rhsusf_m112x4_mag"
];

_items = [
"rhs_uniform_cu_ucp",
"rhs_googles_clear",
"ItemcTab",
 "ItemAndroid",
 "ItemMap",
"ItemCompass",
 "ItemcTabHCam",
 "ItemMicroDAGR",
"rhsusf_ach_helmet_ESS_ucp",
"rhsusf_cvc_green_ess",
"rhsusf_iotv_ucp_Grenadier",
"rhsusf_iotv_ucp_Medic",
"rhsusf_iotv_ucp_Rifleman",
"rhsusf_iotv_ucp_SAW",
"rhsusf_iotv_ucp_Squadleader",
"rhsusf_iotv_ucp_Teamleader",
"rhsusf_ANPVS_15",
"ACE_VectorDay",
"ACE_Clacker",
"ACE_M26_Clacker",
"ACE_IR_Strobe_Item",
"ACE_EarPlugs",
"ACE_DefusalKit",
"ACE_Flashlight_XL50",
"ACE_MapTools",
"ACE_wirecutter",
"ToolKit",
"tf_anprc148jem_2",
"ItemMicroDAGR",
"RH_compM2",
"ACE_microDAGR",
"RH_ta31rco_2D",
"ACE_RangeTable",
"RH_leu_mk4"
];

_backpacks = [
"rhsusf_assault_eagleaiii_ucp",
"tf_anprc155" // Or whatever equivalent.
];






//------------------------DO NOT TOUCH----------------------------------------------------
_crate = _this;

_crate AddAction ["<t color=""#4DB0E2"">" +"Cavalry Company Crate", "","",6];



[_crate,_weapons,{true}] call BIS_fnc_addVirtualWeaponCargo;
[_crate,_items,{true}] call BIS_fnc_addVirtualItemCargo;
[_crate,_magazines,{true}] call BIS_fnc_addVirtualMagazineCargo;
[_crate,_backpacks,{true}] call BIS_fnc_addVirtualBackpackCargo;