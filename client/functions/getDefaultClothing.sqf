// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "TRYK_shirts_BLK_PAD_BLW" };
				if (_item == "vest") then { _result = "TRYK_V_tacv1_FBI_BK" };
				if (_item == "goggles") then { _result = "G_Aviator" };
				if (_item == "headgear") then { _result = "H_Cap_police" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "TRYK_U_B_AOR2_Rollup_CombatUniform" };
				if (_item == "vest") then { _result = "TRYK_V_tacv1LC_SRF_OD" };
				if (_item == "goggles") then { _result = "G_Bandanna_aviator" };
				if (_item == "headgear") then { _result = "H_Cap_usblack" };
			};
			default
			{
				if (_item == "uniform") then { _result = "TRYK_shirts_BLK_PAD_YEL" };
				if (_item == "vest") then { _result = "TRYK_V_tacv1_MSL_BK" };
				if (_item == "goggles") then { _result = "G_Aviator" };
				if (_item == "headgear") then { _result = "TRYK_R_CAP_BLK" };
			};
		};

		if (_item == "headgear") then { _result = "H_Cap_police" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "TRYK_U_B_C01_Tsirt" };
				if (_item == "vest") then { _result = "V_BandollierB_blk" };
				if (_item == "goggles") then { _result = "G_Bandanna_beast" };
				if (_item == "headgear") then { _result = "TRYK_H_woolhat" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "TRYK_U_B_BLK" };
				if (_item == "vest") then { _result = "TRYK_V_IOTV_BLK" };
				if (_item == "goggles") then { _result = "TRYK_Beard_BK" };
				if (_item == "headgear") then { _result = "H_Cap_blk_CMMG" };
			};
			default
			{
				if (_item == "uniform") then { _result = "TRYK_U_B_BLK3CD_Tshirt" };
				if (_item == "vest") then { _result = "V_BandollierB_blk" };
				if (_item == "goggles") then { _result = "G_Bandanna_khk" };
				if (_item == "headgear") then { _result = "H_Cap_blk_ION" };
			};
		};

		if (_item == "headgear") then { _result = "H_Cap_blk_Raven" };
	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "TRYK_U_pad_j" };
				if (_item == "vest") then { _result = "V_HarnessOSpec_gry" };
				if (_item == "goggles") then { _result = "G_Aviator" };
				if (_item == "headgear") then { _result = "H_MilCap_blue" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "TRYK_U_denim_hood_3c" };
				if (_item == "vest") then { _result = "TRYK_V_harnes_TAN_L" };
				if (_item == "goggles") then { _result = "TRYK_Beard_BK" };
				if (_item == "headgear") then { _result = "H_MilCap_gry" };
			};
			default
			{
				if (_item == "uniform") then { _result = "TRYK_U_denim_jersey_blk" };
				if (_item == "vest") then { _result = "V_HarnessOSpec_gry" };
				if (_item == "goggles") then { _result = "G_Bandanna_khk" };
				if (_item == "headgear") then { _result = "H_StrawHat_dark" };
			};
		};

		if (_item == "headgear") then { _result = "H_Booniehat_khk" };
	};
};

_result
