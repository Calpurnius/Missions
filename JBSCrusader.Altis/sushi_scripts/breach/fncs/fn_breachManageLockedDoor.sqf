params ["_target","_selectionName_def","_selectionName_jbad","_selectionName_dvere","_selectionName_Map",["_dS1",999],["_dS2",999],["_dS3",999],["_dS4",999]];
if (_dS1 == 999) then {_dS1 = _target getVariable [format ["bis_disabled_%1", _selectionName_def],-1];};
if (_dS2 == 999) then {_dS2 = _target getVariable [format ["bis_disabled_%1", _selectionName_jbad],-1];};
if (_dS3 == 999) then {_dS3 = _target getVariable [format ["bis_disabled_%1", _selectionName_dvere],-1];};		
if (_dS4 == 999) then {_dS4 = _target getVariable [format ["bis_disabled_%1", _selectionName_Map],-1];};	

//private _status = _target getVariable ["SAF_var_breach_managingDoor",false];
//if (_status) exitWith {};
	
if (_dS1 == 1 || _dS2 == 1 || _dS3 == 1 || _dS4 == 1) then {				
	{	
	
		private _status = _target getVariable [format["SAF_var_breach_managingDoor_%1",_x], false];
		if (!_status) then {
			[_x,_target] spawn {
				private _d = _this select 0;
				private _target = _this select 1;
				private _status = _target getVariable [format ["bis_disabled_%1", _d], 0];
				_target setVariable [format["SAF_var_breach_managingDoor_%1",_d],true];
				
				while {_status == 1 && _target == cursorTarget} do {
					
					_target animate [_d,saf_mission_setting_breach_closeFix];
					_status = _target getVariable [format ["bis_disabled_%1", _d], 0];
					sleep 0.1;
				};
				_target setVariable [format["SAF_var_breach_managingDoor_%1",_d],false];
				
			};
		};
	} foreach [_selectionName_def,_selectionName_jbad,_selectionName_dvere,_selectionName_Map];
};