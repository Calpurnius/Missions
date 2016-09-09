private _center = _this select 0;
private _r = 20;
private _affected = _center nearEntities ["CAManBase", _r];

{
	private _conscious = _x getVariable ["ace_isUnconscious", false];
	private _cuffed = _x getVariable ["ace_captives_isHandcuffed", false];
	private _surrending = _x getVariable ["ace_captives_isSurrendering", false];
	private _safHos = _x getVariable ["SAF_var_hostage_state",-1];
	private _stance = stance player;
	switch (_stance) do {
		case "PRONE": { _stance  = "Dwon"; };
		case "CROUCH": { _stance  = "Crouch"; };
		case "STAND": { _stance  = "Up"; };
	};
	sleep 0.2;
	if (alive _x && !isPlayer _x && !_conscious && !_cuffed && _safHos == -1 && !_surrending)  then {
		private _strength = 1 - (((getPosASL _x) vectorDistance _center) min 20) / 20;
		
	
		if (_strength > 0.3) then {
			[[_x,_stance],{
				private _u =_this select 0;
				private _stance  = _this select 1;
				_u disableAI "AUTOTARGET";
				_u switchMove "acts_CrouchingCoveringRifle01";
				group _u setBehaviour "CARELESS";
				private _t = 0;
				waitUntil {
					sleep 0.1;
					_t = _t +0.1;

					_t > 5 || !alive _u
				};
				
				private _cuffed = _u getVariable ["ace_captives_isHandcuffed", false];
				private _safHos = _u getVariable ["SAF_var_hostage_state",-1];
				private _surrending = _u getVariable ["ace_captives_isSurrendering", false];
				if (!_cuffed && _safHos == -1) then {
					_u switchMove "";
					if (!_surrending) then {
						_u playActionNow "crouch";
					};					
				};
				group _u setBehaviour "AWARE";
				_u enableAI "AUTOTARGET";
			}] remoteExec ["BIS_fnc_spawn"];
		};
	};
} foreach _affected;