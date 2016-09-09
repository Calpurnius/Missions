disableSerialization;
private _doorArr = [cursorTarget] call saf_fnc_breachGetTargetDoors;
private _actStatus = false;
private _state = animationState player;
private _stance = stance player;
switch (_stance) do {
	case "PRONE": { _stance  = "Dwon"; };
	case "CROUCH": { _stance  = "Crouch"; };
	case "STAND": { _stance  = "Up"; };
};
if(count _doorArr > 0) then {
	/*[_stance] spawn {
		private _stance = _this select 0;
		waitUntil {!isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])};
		waitUntil {isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])};
		player playMoveNow "";
		player playActionNow _stance;
	};*/
	

	player playMove "Acts_carFixingWheel";
	sleep 1.5;
	[player,"Acts_carFixingWheel"] remoteExecCall ["switchMove"];
	_actStatus = [SAF_STR_BREACH_LOCKPICKING,20,player,[getPos player,5]] call SAF_fnc_showStatus;
	[player,_state] remoteExecCall ["switchMove"];
	
	
	
	if (_actStatus) then {
		private _d = _doorArr select 0;
		private _s = _doorArr select 1;
		{
			_d setVariable [format ["bis_disabled_%1", _x], 0,true];
		} foreach _s;
		hint SAF_STR_BREACH_STATUS_OPEN;
	};
};