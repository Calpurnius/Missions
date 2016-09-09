[] spawn {
	private _cond = " _doorArr = if (cursorTarget isKindOf 'house') then {[cursorTarget,1] call saf_fnc_breachGetTargetDoors } else { [] }; count _doorArr > 0";
	private _actionTxt = format["<t color='%1'>%2</t>",SAF_app_colorBase,SAF_STR_BREACH_CHECK];
	player addAction [_actionTxt,{ [] call SAF_fnc_breachCheckLock; },[],5,false,true,"",_cond];
	
	private _cond = "_doorStatus = 0; if (('ToolKit' in items player || 'ACE_key_lockpick' in items player) && cursorTarget isKindOf 'house' ) then { _doorArr = if (cursorTarget isKindOf 'house') then { [cursorTarget,1] call saf_fnc_breachGetTargetDoors } else { [] }; _doorStatus =  if (count _doorArr > 0) then { [] call SAF_fnc_breachCheckDoor } else { 0 }; _doorStatus = if(_doorStatus == 1) then { [] call SAF_fnc_breachDoorIsChecked } else { 0 }; };  _doorStatus == 1";
	private _actionTxt = format["<t color='%1'>%2</t>",SAF_app_colorBase,SAF_STR_BREACH_PICKLOCK];
	player addAction [_actionTxt,SAF_fnc_breachPickLock,[],5,false,true,"",_cond];
	};