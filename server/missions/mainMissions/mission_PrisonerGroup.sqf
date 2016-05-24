// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_PrisonerGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_nbUnits", "_box1", "_box2", "_hostage1", "_hostage2", "_hostage3"];

_setupVars =
{
	_missionType = "Kriegsgefangene";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_box1 = createVehicle ["Box_NATO_Wps_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_USSpecial"] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_USLaunchers"] call fn_refillbox;

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];
	
	_hostage1 = createVehicle ["C_man_p_fugitive_F_afro", _missionPos, [], 0, "CAN COLLIDE"];
    _hostage1 setPosATL [_missionPos select 0, _missionPos select 1, _missionPos select 2];
    _hostage1 switchmove "Acts_AidlPsitMstpSsurWnonDnon_loop"; 
    _hostage1 disableAI "anim";
	
	_hostage2 = createVehicle ["C_man_p_beggar_F_asia", _missionPos, [], 0, "CAN COLLIDE"];
    _hostage2 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) + 2, _missionPos select 2];
    _hostage2 switchmove "Acts_AidlPsitMstpSsurWnonDnon_loop"; 
    _hostage2 disableAI "anim";
	
	_hostage3 = createVehicle ["C_man_p_beggar_F_afro", _missionPos, [], 0, "CAN COLLIDE"];
    _hostage3 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) - 2, _missionPos select 2];
    _hostage3 switchmove "Acts_AidlPsitMstpSsurWnonDnon_loop"; 
    _hostage3 disableAI "anim";

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createGroup5;

	_missionHintText = "<br/><t color='%1'>Guerillas</t> haben Kriegsgefangene gemacht und warten auf den Abtransport. <br/>Unterbindet das Vorhaben mit <t color='%1'>aller Härte</t> und befreit die Gefangenen!";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _hostage1};
_waitUntilCondition = {!alive _hostage2};
_waitUntilCondition = {!alive _hostage3};

_failedExec =
{
	// Mission failed
	
	{ deleteVehicle _x } forEach [_box1, _box2, _hostage1, _hostage2, _hostage3];
	_failedHintMessage = format ["Die Kriegsgefangenen werden Altis verlassen. In Blechsärgen!"];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	{ deleteVehicle _x } forEach [_hostage1, _hostage2, _hostage3];

	_successHintMessage = format ["Die Gefangenen sind wieder auf freiem Fuß! Sehr gute Arbeit!"];
};

_this call sideMissionProcessor;
