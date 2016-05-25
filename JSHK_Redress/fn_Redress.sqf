/*////////////////////////////////////

Author: J.Shock
Editor: BR-Murdock

Function File: fn_Redress.sqf

Parameters:
	1- Units to be redress: (array)
	2- Use special units: (boolean)
	3- Side of units: (side)
	4- Loop through units: (boolean)

Description: The redressing process of the defined units.
	Edit to support three factions. Credits go to J.Shock for his script.
Return: None

**DISCLAIMER**
Do not remove the header from this file. Any reproduced portions of this code
must include credits to the author (J.Shock).
	
*////////////////////////////////////

//if (isServer) then
//{
	private ["_units", "_unitSide", "_continuous", "_special", "_uniform", "_ATunits", "_Medunits", "_AAunits", "_weapon", "_goggle", "_head", "_vest", "_backpack"];

	_units = (_this select 0);
	_special = (_this select 1);
	_unitSide = (_this select 2);
	_continuous = (_this select 3);
	_factionExclude = (_this select 4);
	
	if ((count _units) < 1) exitWith 
	{
		if (_continuous) then 
		{
			[_unitSide,_special,_factionExclude] spawn JSHK_fnc_countLoop;
		};
	};

	_ATunits = [];
	_Medunits = [];
	_AAunits = [];

	if (_special) then 
	{
		{
			if (typeOf _x in JSHK_ATunits) then { _ATunits pushBack _x; };
	
			if (typeOf _x in JSHK_Medicalunits) then { _Medunits pushBack _x; };

			if (typeOf _x in JSHK_AAunits) then { _AAunits pushBack _x; };

		} foreach _units;
	};

//The redressing process...
//Edit to change gear depending on unitSide

	{
	switch (_unitSide) do
		{
		case WEST:
			{
				_uniform = JSHK_uniformArrWest call BIS_fnc_selectRandom;
				_weapon = JSHK_weaponArrWest call BIS_fnc_selectRandom;
				_backpack = JSHK_backpackArrWest call BIS_fnc_selectRandom;
				_head = JSHK_headArrWest call BIS_fnc_selectRandom;
				_vest = JSHK_vestArrWest call BIS_fnc_selectRandom;
				_goggle = JSHK_goggleArrWest call BIS_fnc_selectRandom;
				_muzzles = getArray(configfile >> "cfgWeapons" >> (_weapon) >> "muzzles"); 
        		};
        	case East:
			{
				_uniform = JSHK_uniformArrEast call BIS_fnc_selectRandom;
				_weapon = JSHK_weaponArrEast call BIS_fnc_selectRandom;
				_backpack = JSHK_backpackArrEast call BIS_fnc_selectRandom;
				_head = JSHK_headArrEast call BIS_fnc_selectRandom;
				_vest = JSHK_vestArrEast call BIS_fnc_selectRandom;
				_goggle = JSHK_goggleArrEast call BIS_fnc_selectRandom;
				_muzzles = getArray(configfile >> "cfgWeapons" >> (_weapon) >> "muzzles"); 
        		};
        	case GUER:
			{
				_uniform = JSHK_uniformArrGuer call BIS_fnc_selectRandom;
				_weapon = JSHK_weaponArrGuer call BIS_fnc_selectRandom;
				_backpack = JSHK_backpackArrGuer call BIS_fnc_selectRandom;
				_head = JSHK_headArrGuer call BIS_fnc_selectRandom;
				_vest = JSHK_vestArrGuer call BIS_fnc_selectRandom;
				_goggle = JSHK_goggleArrGuer call BIS_fnc_selectRandom;
				_muzzles = getArray(configfile >> "cfgWeapons" >> (_weapon) >> "muzzles"); 
        		};
        	default 
        		{
        		};
        	};
        	
        _unit = _x;

		_x unassignItem "NVGoggles_OPFOR";
		_x unassignItem "NVGoggles";
		_x unassignItem "NVGoggles_INDEP";
		clearItemCargo _x;
		clearWeaponCargo _x;
		clearMagazineCargo _x;
		removeallWeapons _x;
		removeAllHandgunItems _x;
		removeHeadgear _x;
		removeGoggles _x;
		removeUniform _x;
		removeBackpack _x;

		_x forceaddUniform _uniform;
		_x addBackpack _backpack;
		_x addHeadgear _head;
		_x addVest _vest;
		_x addGoggles _goggle;
		_x addMagazines ["HandGrenade", 3];
		_x addMagazines ["SmokeShell", 3];

		{ 
			if (_x=="this") then 
			{
				_mags = getArray(configfile >> "cfgWeapons" >> (_weapon) >> "magazines"); 
				{ 
					_unit addMagazines [_x, 10]; 
				} forEach [_mags select 0]; 
			} 
			else 
			{ 
				_mags = getArray(configfile >> "cfgWeapons" >> (_weapon) >> _x >> "magazines"); 
				{
					_unit addMagazines [_x, 10]; 
				} forEach [_mags select 0]; 
			}; 
		} forEach _muzzles;  

		_x addWeapon _weapon;
		_x setVariable ["JSHK_doneRedress",true];

	} foreach _units;

	if !(_special) exitWith 
	{ 
		if (_continuous) then 
		{
			[_unitSide,_special,_factionExclude] spawn JSHK_fnc_countLoop;
		};
	};
	
	if ((count _ATunits) > 0) then 
	{
		{
			_x addWeapon "launch_RPG32_F";
			_x addMagazine ["RPG32_HE_F", 2];
		} foreach _ATunits;
	};
	
	if ((count _Medunits) > 0) then 
	{
		{
			clearAllItemsFromBackpack _x;
			_x addItemToBackpack "Medikit";
			_x addItemToBackpack "FirstAidKit";
			_x addItemToBackpack "FirstAidKit";
			_x addItemToBackpack "FirstAidKit";
		} foreach _Medunits;
	};
	
	if ((count _AAunits) > 0) then 
	{
		{
			_x addWeapon "launch_Titan_F";
			_x addMagazine ["Titan_AA", 2];
		} foreach _AAunits;
	};
   
	if (_continuous) then 
	{
		[_unitSide,_special,_factionExclude] spawn JSHK_fnc_countLoop;
	};
//};
