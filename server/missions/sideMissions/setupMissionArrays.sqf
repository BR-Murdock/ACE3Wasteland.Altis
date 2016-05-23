// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	// Mission filename, weight
	//["mission_ArmedDiversquad", 0.3],
	//["mission_Coastal_Convoy", 0.5],
	["mission_Convoy", 1],
	["mission_HostileHeliFormation", 0.75],
	["mission_APC", 1],
	["mission_MBT", 1],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
	["mission_AbandonedJet", 1],
	["mission_HostileJetFormation", 0.5],
	["mission_CivHeli", 1],
	["mission_HostageRescue", 1],
	//["mission_PrisonerGroup", 1],
	["mission_Hackers", 1]
	
	
];

SideMissions =
[
	["mission_HostileHelicopter", 1],
	["mission_MiniConvoy", 1],
	//["mission_SunkenSupplies", 0.5],
	["mission_TownInvasion", 1],
	["mission_AirWreck", 1],
	["mission_HostileInfantry", 1],
	["mission_WepCache", 1],
	["mission_Outpost", 3],
	["mission_drugsRunners", 1],
	["mission_Truck", 1],
	["mission_Roadblock", 1],
	["mission_HostileJet", 0.5],
	["mission_Sniper", 1],
	["mission_Smugglers", 1],
	["mission_geoCache", 1]
	
];

MoneyMissions =
[
	["mission_MoneyShipment", 1],
	//["mission_SunkenTreasure", 1],
	["mission_militaryPatrol", 1],
	["mission_drugsmuggler", 1],
	["mission_altisPatrol", 1]
];



MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation", "mission_HostileJet"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;


MissionSpawnMarkers = [];
SunkenMissionMarkers = [];
RoadblockMissionMarkers =[];
SniperMissionMarkers =[];
{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["SunkenMission_", _x] call fn_startsWith):
		{
			SunkenMissionMarkers pushBack [_x, false];
		};
		case (["RoadBlock_", _x] call fn_startsWith):
		{
			RoadblockMissionMarkers pushBack [_x, false];
		};
		case (["Sniper_", _x] call fn_startsWith):
		{
			SniperMissionMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

LandConvoyPaths = [];
{
	LandConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf");

CoastalConvoyPaths = [];
{
	CoastalConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf");

PatrolConvoyPaths = [];
{
	PatrolConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\patrolConvoysList.sqf");
