//-->Door locking
params ["_target","_selectionName_def","_selectionName_jbad","_selectionName_dvere","_selectionName_Map",["_dS1",999],["_dS2",999],["_dS3",999],["_dS4",999]];
if (_dS1 == 999) then {_dS1 = _target getVariable [format ["bis_disabled_%1", _selectionName_def],-1];};
if (_dS2 == 999) then {_dS2 = _target getVariable [format ["bis_disabled_%1", _selectionName_jbad],-1];};
if (_dS3 == 999) then {_dS3 = _target getVariable [format ["bis_disabled_%1", _selectionName_dvere],-1];};		
if (_dS4 == 999) then {_dS4 = _target getVariable [format ["bis_disabled_%1", _selectionName_Map],-1];};	
if (_dS1 == -1 && _dS2 == -1 && _ds3 == -1 && _dS4 == -1 )then {
	private _lockStatus = 0;
	scopeName "doorStatusLoop";
	{
		private _bld = _x select 0;
		if (_bld == _target) then {
			_lockStatus = _x select 1;
			breakTo "doorStatusLoop";
		};
	} foreach saf_mission_setting_breach_BuildingsOpt;
	private _lock = [0,1] call BIS_fnc_selectRandom;			
	private _lock1 = [0,1,1,1] call BIS_fnc_selectRandom;
	{
		if (_lockStatus == 1) then {
			_target setVariable [format ["bis_disabled_%1", _x], 1,true]; //Lock all doors
		}else{
		if (_lockStatus == 2) then {
			_target setVariable [format ["bis_disabled_%1", _x], _lock1,true]; //Lock 50% of doors
		} else {
			_target setVariable [format ["bis_disabled_%1", _x], _lock,true]; //Lock 66% of doors
		};
	};
	} foreach [_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map];
};