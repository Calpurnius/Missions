private _doorArr = [cursorTarget] call saf_fnc_breachGetTargetDoors;
private _txt = "";
private _doorStatus = 0;
private _anim = true;
if(count _doorArr > 0) then {
	private _d = _doorArr select 0;
	private _s = _doorArr select 1;
	{
		if (_anim) then {
			private _o = if (saf_mission_setting_breach_closeFix > 0) then { 0.95 } else { 0.05 };
			_d animate [_x, _o];
			sleep 0.1;
			_d animate [_x, saf_mission_setting_breach_closeFix];
		};
	
		_doorStatus = _d getVariable [format ["bis_disabled_%1", _x], 0];
		if (_doorStatus == 0) then {
			_txt = SAF_STR_BREACH_STATUS_OPEN;
		} else {
			_txt = SAF_STR_BREACH_STATUS_LOCK;
		};
		
	} foreach _s;
	
	hint _txt;
	{
		_d setVariable [format ["saf_var_checked_%1", _x], 1];
	} foreach _s;
};

_doorStatus;