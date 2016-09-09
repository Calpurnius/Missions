#include "..\cfg\cfgDefines.cpp"
if ( SAF_MISSION_SET(breach_useBreach) < 1 ) exitWith {};
[] spawn {
	private _langFile = format["sushi_scripts\breach\locale\%1.sqf",SAF_app_lang];
	call compile preProcessFileLineNumbers _langFile;
	private _zeroes = ["dvere","dvere1l","dvere1r","dvere2l","dvere2r","dvere_spodni_r","dvere_spodni_l","dvere_vrchni","vrata1","vrata2","vratal1","vratar1","vratal2","vratar2","vratal3","vratar3"];
	private _ones = ["door","door_1_1","door_1_2","door_2_1","door_2_2","dvere1","dvere2","dvere3","dvere4","dvere5","dvere6","dvere7","dvere8","dvere9","dvere10","dvere11","dvere12","dvere13","dvere14","doorl","doorr","door_01","door01_a","door_02","door02_a","door_03","door_04","door_05","door_06","door_1a","door_1","door_2", "DoorR", "DoorL", "DoorF", "Door2F", "Door_1_source", "Door_2_soruce", "DoorE1", "DoorE2"];
	private _twos = ["door_1_rot","door_3_rot","door_2_rot","door_4_rot","door_5_rot","door_6_rot","door_7_rot"];
	//-->Handle buildings
	{
		private _arr = _x;
		private _zone = _arr select 0;
		private _locAll = _arr select 1;
		private _closeDoors = _arr select 2;
		
		private _center = getMarkerPos _zone;
		private _size = markerSize _zone;
		private _rX = _size select 0;
		private _rY = _size select 1;
		private _r = ((_rX + _rY) /2);
		private _buildingsArr = nearestObjects [_center,["house","Cargo_Patrol_base_F","Cargo_Tower_base_F","Cargo_HQ_base_F"],_r];
		if (count _buildingsArr > 0) then //Ensuring there are buildings to interact with
		{
		diag_log format ["Breaching Script is being Initialized..."];
		diag_log format ["This may take a few minutes depending on the number of buildings."];
			{
			if ([_x] call BIS_fnc_isBuildingEnterable && SAF_MISSION_SET(breach_PostInitRun) < 1) then { //Making sure the buildings are enterable, and the PostInit script has only been run once.  Almost all civilian objects in ArmA are of the kind "house"
				SAF_MISSION_SET(breach_Buildings) pushBack _x;
				SAF_MISSION_SET(breach_BuildingsOpt) pushBack [_x,_locAll];
			};
			if (_closeDoors > 0 && isServer && [_x] call BIS_fnc_isBuildingEnterable && SAF_MISSION_SET(breach_PostInitRun) < 1) then {  //again, ensuring the buildings are enterable and the script has been run once.  But now this is to close the doors if they are open, and the settings file calls for doors to be closed
					 _y = _x;
					 {_y animate [format ["%1", _x], SAF_MISSION_SET(breach_closeFix)]} foreach _zeroes;
					 {_y animate [format ["%1", _x], SAF_MISSION_SET(breach_closeFix)]} foreach _ones;
					 {_y animate [format ["%1", _x], SAF_MISSION_SET(breach_closeFix)]} foreach _twos;
					 {_y animate [format ["%1", _x], SAF_MISSION_SET(breach_closeFix)]} foreach SAF_MISSION_SET(breach_customDoorNames);
				};
			} foreach _buildingsArr;
		}; 
		
	} foreach SAF_MISSION_SET(breach_Zones);
	SAF_MISSION_SET(breach_PostInitRun) = 2;
	Diag_Log format ["Breach Script has be initialized"];

	//-->Handle gun breach
	if (SAF_MISSION_SET(breach_allowGunBreach) > 0 && !isDedicated) then {
		//-->Add event handler
		player addEventHandler ["FIRED",saf_fnc_breachFiredEh];
	};

	//-->Handle other actions

	if (SAF_MISSION_SET(breach_allowLockPick) > 0 && !isDedicated) then {  //Add lock picking
	if (!isNull Player) then {
	call SAF_fnc_lockpickcheck;
	player addeventhandler ["respawn","call SAF_fnc_lockpickcheck;"];
	};
	};

	if (SAF_MISSION_SET(breach_allowExplosiveBreach) > 0 && !isDedicated) then {  //Add explosive breaching
	if (!isNull Player) then {
	call SAF_fnc_checkexplosive;
	player addeventhandler ["respawn","call SAF_fnc_checkexplosive;"];
	};
	};
};