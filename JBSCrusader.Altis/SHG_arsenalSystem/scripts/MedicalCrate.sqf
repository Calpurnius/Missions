/*
Author: Jmaster[SHG]
created for SpearheadGaming @ spearheadgaming.net
*/


//config for arsenal,use weapon/item classnames

_weapons = [
];

_items = [ //includes uniforms
 "ACE_plasmaIV_250",
 "ACE_bloodIV",
 "ACE_wirecutter",
 "ACE_bloodIV_250",
 "ACE_morphine",
 "ACE_elasticBandage",
 "ACE_tourniquet",
 "ACE_salineIV_500",
 "ACE_packingBandage",
 "ACE_plasmaIV",
 "ACE_quikclot",
 "ACE_fieldDressing",
 "ACE_personalAidKit",
 "ACE_salineIV_250",
 "ACE_atropine",
 "ACE_plasmaIV_500",
 "ACE_bodyBag",
 "ACE_salineIV",
 "ACE_surgicalKit",
 "ACE_EarPlugs",
 "ACE_bloodIV_500"
];
_magazines = [ //includes explosives
];
_backpacks = [ //includes radios/static weapons
"rhsusf_assault_eagleaiii_ucp",
"tf_anprc155",
"B_Carryall_oli",
"B_Carryall_khk",
"B_Parachute",
"B_Carryall_mcamo",
"rhsusf_assault_eagleaiii_coy",
"B_FieldPack_oli"
];






//------------------------DO NOT TOUCH----------------------------------------------------
_inCompany = false;
_crate = _this;
//_groupleads = _this select 1;
_crate AddAction ["<t color=""#4DB0E2"">" +"Medical Supplies", "","",6];


//[_crate,_weapons,{_inCompany}] call BIS_fnc_addVirtualWeaponCargo;
[_crate,_items,{true}] call BIS_fnc_addVirtualItemCargo;
//[_crate,_magazines,{_inCompany}] call BIS_fnc_addVirtualMagazineCargo;
[_crate,_backpacks,{true}] call BIS_fnc_addVirtualWeaponCargo;