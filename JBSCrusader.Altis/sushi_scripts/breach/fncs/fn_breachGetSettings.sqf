#include "..\cfg\cfgDefines.cpp"

if !(isClass(SAF_MISSION_SETTINGS(Plugins,BREACH))) exitWith {diag_log "exit";};

SAF_MISSION_SET(breach_useBreach) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"useBreach",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_allowDoorCheck) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"allowDoorCheck",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_allowLockPick) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"allowLockPick",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_allowGunBreach) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"allowGunBreach",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_allowExplosiveBreach) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"allowExplosiveBreach",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_gunClasses) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"gunClasses",[]] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_closeFix) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"closeFix",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_customDoorNames) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"customDoorNames",[]] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_LockFrontDoorsOnly ) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"LockFrontDoorsOnly",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_lockpickcheck ) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"lockpickcheck",0] call BIS_fnc_returnConfigEntry;
SAF_MISSION_SET(breach_checkexplosive ) = [SAF_MISSION_SETTINGS(Plugins,BREACH),"checkexplosive",0] call BIS_fnc_returnConfigEntry;

SAF_MISSION_SET(breach_Zones) = [];
SAF_MISSION_SET(breach_Buildings) = [];
SAF_MISSION_SET(breach_BuildingsOpt) = [];
SAF_MISSION_SET(breach_PostInitRun) = 0;

private _zArr = [];
for "_i" from 0 to ((count (SAF_MISSION_SETTINGS(Plugins,BREACH)  >> "lockDoor")) - 1) do {
	private _zone = (SAF_MISSION_SETTINGS(Plugins,BREACH)  >> "lockDoor") select _i;
	if (isClass(_zone)) then {
		_zArr pushBack _zone;
	};
};

if (count _zArr > 0) then {
	{
		private _c = _x;
		private _zone = getText(_c >> "zone");
		private _locAll = getNumber(_c >> "lockAll");
		private _closeDoors = getNumber(_c >> "closeDoors");
		SAF_MISSION_SET(breach_Zones) pushBack [_zone,_locAll,_closeDoors];
		
	} foreach _zArr;
};

