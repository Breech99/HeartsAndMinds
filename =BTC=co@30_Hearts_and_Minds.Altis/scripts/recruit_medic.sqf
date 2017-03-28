/* 
recruit medic via addactions:
///////////recruit_medic.sqf/////////**********
put this inside some object init
this addAction ["<t color='#0000FF'>Recruit Medic</t>", "scripts\recruit_medic.sqf",[],4.9,false,true,"","(_target distance _this) < 5"];

///deleteVehicle _x  used for despawning
addons required : ACE, RHS
*/

private ["_unit", "_chief"];
_chief = _this select 1;
if (_chief != (leader group _chief)) exitWith {
hint "Only team leader can recruit team members!";
};
hint "Recruiting Medic";
_unit = group _chief createUnit ["B_medic_F", getPos _chief, [], 5, "PRIVATE"];
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "rhs_uniform_cu_ucp";
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_NVG_Gen4";
_unit addVest "rhsusf_iotv_ucp_Medic";
for "_i" from 1 to 15 do {_unit addItemToVest "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "rhsusf_acc_nt4_black";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_red";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhs_mag_m67";
_unit addBackpack "B_Carryall_mcamo";
for "_i" from 1 to 50 do {_unit addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_bloodIV";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_bodyBag";};
_unit addItemToBackpack "ACE_personalAidKit";
_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";
_unit addGoggles "G_Combat";
_unit addWeapon "rhs_weap_m16a4_carryhandle_grip_pmag";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "Laserdesignator";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";
_unit linkItem "ItemGPS";
_unit enableFatigue false;
dummy = [_unit, units (group _unit)] execVM "scripts\automedic.sqf";
hint "Medic joined your team";
sleep 120;
{deleteVehicle _x} forEach units _chief;
