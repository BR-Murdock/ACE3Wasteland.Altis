//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
_leader addUniform "TRYK_U_B_OD_OD_R_CombatUniform";
_leader addVest "TRYK_V_PlateCarrier_JSDF";
_leader addBackpack "TRYK_B_Kitbag_Base";
_leader addMagazine "10Rnd_762x51_Mag";
_leader addWeapon "srifle_DMR_01_F";
_leader addPrimaryWeaponItem "optic_Holosight";
_leader addMagazine "10Rnd_762x51_Mag";
_leader addMagazine "10Rnd_762x51_Mag";
_leader addMagazine "RPG32_F";
_leader addWeapon "launch_RPG32_F";
_leader addMagazine "RPG32_F";
_leader addHeadgear "H_Booniehat_mcamo";
_leader addGoggles "G_Balaclava_blk";


// Soldier2
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
_man2 addUniform "TRYK_U_B_ARO2_CombatUniform";
_man2 addVest "TRYK_V_harnes_od_L";
_man2 addBackpack "TRYK_B_Kitbag_Base";
_man2 addMagazine "10Rnd_762x51_Mag";
_man2 addWeapon "srifle_DMR_01_F";
_man2 addPrimaryWeaponItem "optic_Holosight";
_man2 addMagazine "10Rnd_762x51_Mag";
_man2 addMagazine "Titan_AT";
_man2 addWeapon "launch_I_Titan_short_F";
_man2 addMagazine "Titan_AT";
_man2 addHeadgear "H_Booniehat_mcamo";
_man2 addGoggles "G_Balaclava_blk";

// Soldier3
_man3 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
_man3 addUniform "TRYK_U_B_ARO2_CombatUniform";
_man3 addVest "TRYK_V_harnes_od_L";
_man3 addMagazine "10Rnd_762x51_Mag";
_man3 addPrimaryWeaponItem "optic_Holosight";
_man3 addWeapon "srifle_DMR_01_F";
_man3 addMagazine "10Rnd_762x51_Mag";
_man3 addMagazine "10Rnd_762x51_Mag";
_man3 addHeadgear "H_Booniehat_mcamo";
_man3 addGoggles "G_Balaclava_blk";

// Soldier4
_man4 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
_man4 addUniform "TRYK_U_B_ARO2R_CombatUniform";
_man4 addVest "TRYK_V_harnes_od_L";
_man4 addMagazine "10Rnd_762x51_Mag";
_man4 addWeapon "srifle_DMR_01_F";
_man4 addPrimaryWeaponItem "optic_Holosight";
_man4 addMagazine "10Rnd_762x51_Mag";
_man4 addMagazine "10Rnd_762x51_Mag";
_man4 addHeadgear "H_Booniehat_mcamo";
_man4 addGoggles "G_Balaclava_blk";


// Soldier5
_man5 = _group createUnit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
_man5 addUniform "TRYK_U_B_ARO2R_CombatUniform";
_man5 addVest "TRYK_V_harnes_od_L";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addWeapon "srifle_DMR_01_F";
_man5 addPrimaryWeaponItem "optic_Holosight";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addHeadgear "H_Booniehat_mcamo";
_man5 addGoggles "G_Balaclava_blk";


// Soldier6
_man6 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
_man6 addUniform "TRYK_U_B_Woodland_Tshirt";
_man6 addVest "TRYK_V_harnes_od_L";
_man6 addWeapon "srifle_DMR_01_F";
_man6 addPrimaryWeaponItem "optic_Holosight";
_man6 addMagazine "10Rnd_762x51_Mag";
_man6 addMagazine "10Rnd_762x51_Mag";
_man6 addHeadgear "H_Booniehat_mcamo";
_man6 addGoggles "G_Balaclava_blk";


_leader = leader _group;

{
	_x spawn refillPrimaryAmmo;
//	_x spawn addMilCap;
	_x call setMissionSkill;
	_x addRating 9999999;
	_x addEventHandler ["Killed", server_playerDied];
} forEach units _group;

[_group, _pos, "LandVehicle"] call defendArea;