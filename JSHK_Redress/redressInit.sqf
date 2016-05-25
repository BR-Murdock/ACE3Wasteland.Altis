/*////////////////////////////////////

Author: J.Shock
Editor: BR-Murdock
Script File: redressInit.sqf

Parameters:
	1- Side (EAST, WEST, CIV, GUER) ~ default: EAST
	2- Use of special units (true/false) ~ default: true
	3- Check for spawned units (true/false) ~ default: false
	
Description: Initializes all variables needed for redressing process.
			 Also excludes the units that need not be redressed, as 
			 defined by the user in: _indvUnitExclude and _grpUnitExculde.
			 Contains the gear/loadout arrays to be defined by user.
	Edit to make the script able to handle three factions. Credits go to J.Shock for his good work.
Return: None

**DISCLAIMER**
Do not remove the header from this file. Any reproduced portions of this code
must include credits to the author (J.Shock).

*////////////////////////////////////


_sideToRedress = [_this, 0, WEST, [WEST]] call BIS_fnc_param;
_specialUnits = [_this, 1, false, [false]] call BIS_fnc_param;
_continuous = [_this, 2, false, [true]] call BIS_fnc_param;


//Need to exclude certain units/groups, fill out the below arrays!
//-----------------------------
_indvUnitExclude = [];//<<Put individual unit's variable names here.
_grpUnitExculde = [];//<<Put the group leader's variable names here.
_factionExclusion = [];//<<Put faction classnames here
//-----------------------------


//Gear classes names go below!
//WEST-DEA-----------------------------
JSHK_weaponArrWest = ["arifle_MX_Hamr_pointer_F","arifle_MXC_Holo_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXC_ACO_pointer_F","srifle_EBR_MRCO_LP_BI_F"];
JSHK_uniformArrWest = ["TRYK_shirts_BLK_PAD","TRYK_shirts_BLK_PAD_BK","TRYK_shirts_PAD_YEL","TRYK_T_BLK_PAD"];
JSHK_vestArrWest = ["TRYK_V_ArmorVest_Delta", "TRYK_V_ArmorVest_HRT_OD", "TRYK_V_tacv1_P_BK"];
JSHK_headArrWest = ["TRYK_H_headsetcap_blk","TRYK_H_headsetcap_blk_Glasses","TRYK_H_headsetcap_od_Glasses","TRYK_R_CAP_BLK","TRYK_r_cap_blk_Glasses"];
JSHK_goggleArrWest = ["TRYK_Beard_BK","TRYK_Beard_Gr2","G_Aviator","G_Balaclava_blk","G_Lowprofile","G_Balaclava_combat","G_Spectacles_Tinted"];
JSHK_backpackArrWest = ["TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_Kitbag_blk","TRYK_B_Medbag","TRYK_B_tube_cyt","TRYK_B_Alicepack","TRYK_B_BAF_BAG_CYT"];
//-----------------------------
//EAST-Los Pepes-----------------------------
JSHK_weaponArrEast = ["arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_ARCO_F","arifle_Katiba_GL_ACO_F","arifle_Mk20_GL_MRCO_pointer_F","srifle_DMR_03_woodland_F","MMG_01_hex_ARCO_LP_F"];
JSHK_uniformArrEast = ["TRYK_U_B_BLK","TRYK_U_B_BLK_OD","TRYK_U_B_BLK_OD_Tshirt","TRYK_U_B_BLKBLK_R_CombatUniform","TRYK_U_B_BLKOCP_R_CombatUniformTshirt"];
JSHK_vestArrEast = ["TRYK_LOC_AK_chestrig_OD", "TRYK_V_Bulletproof_BLK", "TRYK_V_harnes_blk_L","TRYK_V_IOTV_BLK","TRYK_V_PlateCarrier_blk_L"];
JSHK_headArrEast = ["TRYK_H_Bandana_wig","TRYK_H_Bandana_wig_g","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_blk_ION","H_Beret_blk","H_BandMask_blk"];
JSHK_goggleArrEast = ["G_Bandanna_sport","G_Bandanna_tan","G_Balaclava_blk","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli"];
JSHK_backpackArrEast = ["TRYK_B_tube_blk","TRYK_B_Medbag_BK","TRYK_B_Kitbag_blk","TRYK_B_Carryall_blk","B_AssaultPack_blk","B_FieldPack_blk"];
//-----------------------------
//GUER-Medellin-----------------------------
JSHK_weaponArrGuer = ["srifle_EBR_ARCO_pointer_F","arifle_Katiba_ARCO_F","arifle_Mk20_Holo_F","arifle_MX_Black_Hamr_pointer_F","hgun_PDW2000_Holo_snds_F","srifle_DMR_03_ARCO_F","MMG_02_sand_RCO_LP_F"];
JSHK_uniformArrGuer = ["TRYK_U_B_RED_T_BR","TRYK_U_denim_hood_3c","TRYK_U_denim_hood_blk","TRYK_U_denim_hood_nc","TRYK_U_denim_hood_mc","TRYK_U_denim_jersey_blk"];
JSHK_vestArrGuer = ["V_Rangemaster_belt", "V_BandollierB_khk", "V_BandollierB_oli","V_HarnessO_gry","TRYK_LOC_AK_chestrig_TAN"];
JSHK_headArrGuer = ["H_Booniehat_khk","H_Cap_red","H_Cap_blk","H_Cap_blu"," H_Cap_oli","H_Cap_tan","H_Cap_grn"];
JSHK_goggleArrGuer = ["G_Squares_Tinted","G_Spectacles_Tinted","G_Lady_Red","G_Lady_Blue","G_Sport_Checkered","G_Aviator","TRYK_Beard_BK"];
JSHK_backpackArrGuer = ["B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_Kitbag_cbr","TRYK_B_tube_od","TRYK_B_Medbag_ucp","TRYK_B_AssaultPack_UCP"];
//-----------------------------


//Special Units Classnames
//All Special Units, DEA+LosPepes+Medellin-----------------------------
JSHK_ATunits = ["O_Soldier_AT_F","I_Soldier_AT_F","B_Soldier_AT_F"];
JSHK_Medicalunits = ["O_medic_F","I_medic_F","B_medic_F"];
JSHK_AAunits = ["O_Soldier_AA_F","I_Soldier_AA_F","B_Soldier_AA_F"];
//-----------------------------



/////***************\\\\\


// Leave the rest ALONE! \\
	

/////***************\\\\\

_units = [];

{
	_currentUnit = _x; 
	if (!(side _currentUnit isEqualTo CIV) &&		//edit check if civilian
	   {({_currentUnit in (units group _x)}count _grpUnitExculde isEqualTo 0)} &&
	   {!(_currentUnit in _indvUnitExclude)} &&
	   {!(_currentUnit getVariable ["JSHK_doneRedress",false])}) then 
	{ 
		_units set [count _units, _currentUnit];
	}
	else
	{
		if (({_currentUnit in (units group _x)}count _grpUnitExculde > 0) || (_currentUnit in _indvUnitExclude) || ((faction _currentUnit) in _factionExclusion)) then
		{
			_currentUnit setVariable ["JSHK_doneRedress",true];
		};
	};
}forEach allUnits;

[_units,_specialUnits,_sideToRedress,_continuous,_factionExclusion] call JSHK_fnc_Redress;

diag_log "Shock's Redressing Script Initialized.";
