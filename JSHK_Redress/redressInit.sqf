/*////////////////////////////////////

Author: J.Shock

Script File: redressInit.sqf

Parameters:
	1- Side (EAST, WEST, CIV, GUER) ~ default: EAST
	2- Use of special units (true/false) ~ default: true
	3- Check for spawned units (true/false) ~ default: false
	
Description: Initializes all variables needed for redressing process.
			 Also excludes the units that need not be redressed, as 
			 defined by the user in: _indvUnitExclude and _grpUnitExculde.
			 Contains the gear/loadout arrays to be defined by user.

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
_factionExclusion = ["BLU_F"];//<<Put faction classnames here
//-----------------------------


//Gear classes names go below!
//-----------------------------
JSHK_weaponArr = ["arifle_MX_Hamr_pointer_F","arifle_MXC_Holo_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXC_ACO_pointer_F","srifle_EBR_MRCO_LP_BI_F"];
JSHK_uniformArr = ["TRYK_shirts_BLK_PAD","TRYK_shirts_BLK_PAD_BK","TRYK_shirts_PAD_YEL","TRYK_T_BLK_PAD"];
JSHK_vestArr = ["TRYK_V_ArmorVest_Delta", "TRYK_V_ArmorVest_HRT_OD", "TRYK_V_tacv1_P_BK"];
JSHK_headArr = ["TRYK_H_headsetcap_blk","TRYK_H_headsetcap_blk_Glasses","TRYK_H_headsetcap_od_Glasses","TRYK_R_CAP_BLK","TRYK_r_cap_blk_Glasses"];
JSHK_goggleArr = ["TRYK_Beard_BK","TRYK_Beard_Gr2","G_Aviator","G_Balaclava_blk","G_Lowprofile","G_Balaclava_combat","G_Spectacles_Tinted"];
JSHK_backpackArr = ["TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_Kitbag_blk","TRYK_B_Medbag","TRYK_B_tube_cyt","TRYK_B_Alicepack","TRYK_B_BAF_BAG_CYT"];
//-----------------------------


//Special Units Classnames
//-----------------------------
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
	if ((side _currentUnit isEqualTo _sideToRedress) &&
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