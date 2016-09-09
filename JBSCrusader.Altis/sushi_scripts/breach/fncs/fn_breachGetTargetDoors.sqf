private _return  = [];
params [
["_target",objNull,[objNull]],
["_dist",5,[0]]
];
scopeName "mainScope";

if(!isNull _target && _target isKindOf "house" || _target isKindOf "Cargo_Patrol_base_F" || _target isKindOf "Cargo_Tower_base_F" || _target isKindOf "Cargo_HQ_base_F" && _target call BIS_fnc_isBuildingEnterable) then {
	private _selectionName = "";
	private _dir = getDir player;
	private _cameraVector = [positionCameraToWorld [0,0,0], positionCameraToWorld [0,0,1]] call BIS_fnc_vectorFromXtoY; // Get the current camera vector
	private _cameraPosition = eyePos player; // Starting point for the intersect line
	private _cameraPositionTrue = if(surfaceIsWater _cameraPosition) then {_cameraPosition} else {ASLtoATL _cameraPosition}; // Normalize the starting position
	private _finalPosition = [(( _cameraPosition select 0 ) + sin _dir * _dist ), ((_cameraPosition select 1) + cos _dir * _dist ), ( _cameraPosition select 2 )];
	//_finalPosition = [_cameraPosition, [_cameraVector call BIS_fnc_unitVector, _distance] call BIS_fnc_vectorMultiply] call BIS_fnc_vectorAdd; // Calculate the end position for the intersect line based on the camera vector
	private _finalPositionTrue = if(surfaceIsWater _finalPosition) then {_finalPosition} else {ASLtoATL _finalPosition}; // Normalize the final position of the intersect line
	private _intersects = [_target,"GEOM"] intersect [_cameraPositionTrue, _finalPositionTrue]; // Get the stuff the line intersects

	if(count _intersects > 0) then {
		private _door = (_intersects select 0) select 0;
		private _door1 = str(_door);
		if ((_door1 find "door") > 0 || (_door1 find "dvere") > 0 || _door1 in saf_mission_setting_breach_customDoorNames) then 
		{
			private _selectionName_def = format ["%1_rot", (_intersects select 0) select 0];
			private _selectionName_jbad = format ["%1", (_intersects select 0) select 0];
			private _selectionName_dvere = _selectionName_jbad;
			private _selectionName_Map = _selectionName_jbad;
			private _n = 0; 
				if ((_door1 find "1") > 0) then  { _n = 1; } else {
					if ((_door1 find "2") > 0) then  { _n = 2; } else {
						if ((_door1 find "3") > 0) then  { _n = 3; } else {
							if ((_door1 find "4") > 0) then  { _n = 4; } else {
								if ((_door1 find "5") > 0) then  { _n = 5; } else {
									if ((_door1 find "6") > 0) then  { _n = 6; } else {
										if ((_door1 find "7") > 0) then  { _n = 7; } else {
											if ((_door1 find "8") > 0) then  { _n = 8; } else {
												if ((_door1 find "9") > 0) then  { _n = 9; };
											};
										};
									};
								};
							};
						};
					};
				};
				
			if ((_door1 find "dvere") < 1) then {
				_selectionName_dvere = format ["Dvere%1", _n];
			};
			if ((_door1 find "door_") > 0) then {
				_selectionName_Map = format ["door_%1_rot", _n];
			};
			If ((_door1 find "doore") > 0) then {
				_selectionName_Map = format ["doore%1",_n];
			};
			If ((_door1 find "doorR") > 0) then {
				_selectionName_Map = format ["doorr%1",_n];
			};
			If ((_door1 find "doorF") > 0) then {
				_selectionName_Map = format ["doorF%1",_n];
			};
			
			//-->Manage door locking
			//-->Manage door locking
			private _dS1 = _target getVariable [format ["bis_disabled_%1", _selectionName_def],-1];
			private _dS2 = _target getVariable [format ["bis_disabled_%1", _selectionName_jbad],-1];
			private _dS3 = _target getVariable [format ["bis_disabled_%1", _selectionName_dvere],-1];
			private _dS4 = _target getVariable [format ["bis_disabled_%1", _selectionName_Map],-1];
			private _break = if (saf_mission_setting_breach_closeFix > 0) then { true } else { false };
			{
				private _p = _target animationPhase _x;
				if (saf_mission_setting_breach_closeFix > 0) then { 
					if (_p < 0 || _p > 0) then {
						_break = false;
					};
				} else {
					if (_p > 0) then {
						_break = true;
					};
				};
				
			} foreach [_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map];
			if (_break) then {breakTo "mainScope";};
			if (saf_mission_setting_breach_LockFrontDoorsOnly  > 0) then {
			if (_target in saf_mission_setting_breach_Buildings && _dS1 == -1 && _dS2 == -1 && _dS3 == -1  && _dS4 == -1 &&
				((_selectionName_def == "door_1_rot" || _selectionName_def == "door_3_rot" || _selectionName_def == "door_2_rot") || 
				(_selectionName_jbad == "door_1" || _selectionName_jbad == "door_3" || _selectionName_jbad == "door_2") ||
				(_selectionName_dvere == "dvere1" || _selectionName_dvere == "dvere2" || _selectionName_dvere == "dvere3") ||
				(_selectionName_Map == "DoorF" || _selectionName_Map == "DoorR" || _selectionName_Map == "DoorE"))) then {	
				[_target,_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map,_dS1,_dS2,_ds3,_ds4] call SAF_fnc_breachLockDoor;
			} else {

				if (_target in saf_mission_setting_breach_Buildings) then {
					[_target,_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map] call SAF_fnc_breachManageLockedDoor;
				};
			};
			} else {
			if (saf_mission_setting_breach_LockFrontDoorsOnly  < 1 ) then {
				if (_target in saf_mission_setting_breach_Buildings && _dS1 == -1 && _dS2 == -1 && _dS3 == -1 && _dS4 == -1) then {	
				[_target,_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map,_dS1,_dS2,_ds3,_ds4] call SAF_fnc_breachLockDoor;
			} else {

				if (_target in saf_mission_setting_breach_Buildings) then {
					[_target,_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map] call SAF_fnc_breachManageLockedDoor;
				};
			};
			};
			};
			_return  = [_target,[_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map]];
		};
	};
};

_return;			
