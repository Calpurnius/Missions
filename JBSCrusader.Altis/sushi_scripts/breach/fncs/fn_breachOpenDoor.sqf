_this spawn {
params ["_d","_s",["_force",false]];
private _d = _this select 0;
private _s = _this select 1;

{
	private _o = if (saf_mission_setting_breach_closeFix > 0) then { 0 } else { 1 };
	_d animate [_x, _o];
	_d setVariable [format ["bis_disabled_%1", _x], 0,true];
	sleep 0.1;
	if (_force) then {
		
		_d animate [_x,_o];
		sleep 0.5;
		_d animate [_x, _o];
	};
} foreach _s;
};