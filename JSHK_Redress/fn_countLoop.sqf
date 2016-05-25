/*////////////////////////////////////

Author: J.Shock
Editor: BR-Murdock
Function File: fn_countLoop.sqf

Parameters:
	1- Side (EAST, WEST, CIV, GUER)
	2- Use of special units (true/false)

Description: A loop that counts all units, then the new units are 
			 pushed back, and fn_Redress.sqf is called.
	Edit to support three factions. Credits go to J.Shock for his script.		 
Return: None

**DISCLAIMER**
Do not remove the header from this file. Any reproduced portions of this code
must include credits to the author (J.Shock).

*////////////////////////////////////

private ["_side","_special","_toBeDressed","_faction"];

_side = (_this select 0);
_special = (_this select 1);
_faction = (_this select 2);
_toBeDressed = [];

sleep 5;

//Edit to exclude CIVs and support the 3 other sides.
{
	if (!(_x getVariable ["JSHK_doneRedress",false]) && {side _x != CIV} && {!((faction _x) in _faction)}) then
	{
		_toBeDressed pushBack _x;
	};
} forEach allUnits;
	
[_toBeDressed,_special,_side,true,_faction] call JSHK_fnc_Redress;
