/*
Author: Jmaster[SHG]
created for SpearheadGaming @ spearheadgaming.net
*/


//config for arsenal,use weapon/item classnames

_weapons = [
"RHS_WEAP_M16A4",
"SMG_02_ACO_F"
];

_items = [ //includes uniforms
 "ACE_microDAGR",
"ACE_MapTools",
"ItemMap",
"ACE_NVG_Gen2",
"ACE_NVG_Gen1",
"NVGoggles_INDEP",
"ACE_NVG_Wide",
"ACE_NVG_Gen4",
"ItemcTab",
"ItemCompass",
 "ItemAndroid",
 "ItemcTabHCam",
 "ItemMicroDAGR",
 "tf_anprc148jem",
"rhsusf_ANPVS_14",
"ACE_microDAGR",
"ACE_IR_Strobe_Item",
"ACE_Flashlight_XL50",
"rhsusf_ANPVS_15",
"ACE_Kestrel4500"
];
_magazines = [ //includes explosives
"SatchelCharge_Remote_Mag",
"ACE_Clacker",
"ACE_Kestrel4500",
"RHS_AMMO_M18_GREEN",
"RHS_AMMO_M18_PURPLE",
"RHS_AMMO_M18_RED",
"RHS_AMMO_M18_YELLOW",
"DemoCharge_Remote_Mag"
];
_backpacks = [ //includes radios/static weapons
"tf_anprc155"
];






//------------------------DO NOT TOUCH----------------------------------------------------
_crate = _this;


_crate AddAction ["<t color=""#4DB0E2"">" +"Aviation Crate", "","",6];



[_crate,_weapons,{true}] call BIS_fnc_addVirtualWeaponCargo;
[_crate,_items,{true}] call BIS_fnc_addVirtualItemCargo;
[_crate,_magazines,{true}] call BIS_fnc_addVirtualMagazineCargo;
[_crate,_backpacks,{true}] call BIS_fnc_addVirtualBackpackCargo;