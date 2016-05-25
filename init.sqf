// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Editor: BR-Murdock
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

// block script injection exploit
inGameUISetEventHandler ["PrevAction", ""];
inGameUISetEventHandler ["Action", ""];
inGameUISetEventHandler ["NextAction", ""];

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Pablo Escobar: 'Plata. O Plomo?'", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];
			playerSpawning = true;

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;

			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

if (hasInterface || isServer) then
{
	//init 3rd Party Scripts
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
	[] execVM "addons\proving_ground\init.sqf";
	[] execVM "addons\laptop\init.sqf";                   // Addon for hack laptop mission
	[] execVM "addons\JumpMF\init.sqf";
	[] execVM "addons\lsd_nvg\init.sqf";
	if (isNil "drn_DynamicWeather_MainThread") then { drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf" };

//AI Spawn Script Pack
nul = [500,900,30,300,5,[1,1,1],player,0.2,1,2500,nil,["AWARE","SAD"],true] execVM "LV\ambientCombat.sqf";
nul = [player,2,true,1,50,1,0.3,nil,nil,nil] execVM "LV\fillHouse.sqf";
//nul = [player,3,false,1,50,1,0.1,nil,nil,nil] execVM "LV\fillHouse.sqf";
nul = [player,0,500,[true,false],[true,false,false],false,[2,1],[1,0],0.2,nil,nil,nil] execVM "LV\militarize.sqf";
//nul = [player,0,150,[true,true],[true,true,true],false,[10,2],[10,0],0.1,nil,nil,nil] execVM "LV\militarize.sqf";
//nul = [player,true,3,1,true,true,player,"random",1000,true,false,8,0.1,[true,true,true,true],nil,nil,nil,true] execVM "LV\reinforcementChopper.sqf";
nul = [player,true,1,3,true,true,player,"random",1000,true,false,6,0.3,[true,true,false,false],nil,nil,nil,true] execVM "LV\reinforcementChopper.sqf";
//nul = [player,3,true,false,1500,"random",false,500,300,8,0.5,200,true,false,false,true,player,false,0.2,nil,nil,nil,true] execVM "LV\heliParadrop.sqf";
nul = [player,2,false,false,1500,"random",false,600,150,6,0.5,50,true,false,true,true,player,false,0.3,nil,nil,nil,true] execVM "LV\heliParadrop.sqf";
nul = [[1],[player],500,true,true] execVM "LV\LV_functions\LV_fnc_simpleCache.sqf";
};;
