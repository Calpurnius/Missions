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


	//-->Animation
	player playMove "Acts_carFixingWheel";
	sleep 1.5;
	[player,"Acts_carFixingWheel"] remoteExecCall ["switchMove"];
	private _actStatus = [SAF_STR_BREACH_PUTINGCHARGE,10,player,[getPos player,5]] call SAF_fnc_showStatus;
	[player,_state] remoteExecCall ["switchMove"];
	
	//-->Set c4
	if (_actStatus) then {
		private _magazines = magazines player;
		{
			if (_x == "rhsusf_m112_mag") exitWith {
				player removeMagazineGlobal "rhsusf_m112_mag";
			};
			if (_x == "DemoCharge_Remote_Mag") exitWith {
				player removeMagazineGlobal "DemoCharge_Remote_Mag";
			};
		} count _magazines;
		
		private _cameraPosition = eyePos player;
		private _cameraPositionTrue = if(surfaceIsWater _cameraPosition) then {_cameraPosition} else {ASLtoATL _cameraPosition};
		private _c4Arr = player getVariable ["SAF_var_breach_playerC4",[]];
		private _dist = 0.5;
		private _dir = getdir player;
		private _finalPosition = [(( _cameraPosition select 0 ) + sin _dir * _dist ), ((_cameraPosition select 1) + cos _dir * _dist ), ( _cameraPosition select 2 )];
		private _finalPositionTrue = if(surfaceIsWater _finalPosition) then {_finalPosition} else {ASLtoATL _finalPosition};
		private _c4Pos = [];
		
		while {count _c4Pos < 2} do {
			_i = [cursorTarget,"GEOM"] intersect [_cameraPositionTrue, _finalPositionTrue];
			if (count _i > 0) then {
				_dist = _dist - 0.05;
				_finalPosition = [(( _cameraPosition select 0 ) + sin _dir * _dist ), ((_cameraPosition select 1) + cos _dir * _dist ), ( _cameraPosition select 2 )];
				_finalPositionTrue = if(surfaceIsWater _finalPosition) then {_finalPosition} else {ASLtoATL _finalPosition};
			} else {
				_finalPosition = [(( _cameraPosition select 0 ) + sin _dir * (_dist - 0.1) ), ((_cameraPosition select 1) + cos _dir * (_dist - 0.1) ), ( _cameraPosition select 2 )];
				_c4Pos = _finalPositionTrue;
			};
		};
		
		//->Finalize
		_c4Pos = [_finalPositionTrue select 0,_finalPositionTrue select 1 ,_finalPositionTrue select 2];
		private _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle _c4Pos;
		[_c4,[[0.5,0.5,0],[-0.5,0.5,0]]] remoteExec ["setVectorDirAndUp"];
		_n = count _c4Arr;
		_c4Arr set [_n, _c4];
		player setVariable ["SAF_var_breach_playerC4",_c4Arr,true];
		
		//->Mark doors
		private _d = _doorArr select 0;
		private _s = _doorArr select 1;
		{
			_d setVariable [format ["saf_var_charge_%1", _x], 1,true];
		} foreach _s;
		
		
		
		//-->Add Action
		private _actionTxt = format["<t color='%1'>%2 %3</t>",SAF_app_colorBase,SAF_STR_BREACH_DETONATE,_n];
		private _actId = player addAction [_actionTxt,SAF_fnc_breachDetonate,[_c4,_doorArr],6,true,true,""];
		
		//-->if doors open
		
		waitUntil 
		{
			sleep 0.5;
			private _p = 0;
			{
				private _pTmp = _d animationPhase _x;
				if (saf_mission_setting_breach_closeFix > 0) then 
				{
					_p = 1;
					if (_pTmp > 0.3) then { _p = 0};	
				} else 
				{
					if (_pTmp > 0.3) then { _p = 1};
				};
			};
			isNull _c4 || !alive player || _p > 0
		};
		
		if (!isNull _c4) then {
			deleteVehicle _c4;
		};
		player removeAction _actId;
		{
			_d setVariable [format ["saf_var_charge_%1", _x], 0,true];
		} foreach _s;
	};
};