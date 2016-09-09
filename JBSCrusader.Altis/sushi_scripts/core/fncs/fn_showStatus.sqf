disableSerialization;
/*
	File: showStatus.sqf
	Author: Sushi

	Description:
	prosty status bar

	Parameter(s):
	0: STRING - text do wyświetlenia
	1: Number - czas
	2 (Optional): Unit - np player
	3 (Optional): ARRAY - pozycja i dystans od niej, jeslid ystans wiekszy nzi podany, akcja bedize przerwana
	4 (Optional): CODE - ddatkowy warunek konczacy jako false

	Returns:
	BOOL - true kiedy jendostka skonczy, fals jeśli przerwie
	
	Example:
	["Sprawdzam",10,player,[getPos player,5]] call SAF_fnc_showStatus;

*/

//-->Parameters
params [
["_string","",[""]],
["_timeTo",0,[0]],
["_unit",objNull,[objNull]],
["_refArr",[],[[]],[2]],
["_code",{false}]
];

//-->Variables
private _return  = true;
private _txtBase = format["<t color='%1' size = '.6'>%2</t>",SAF_app_colorBase,_string];
private _sleep = _timeTo / 100;
//-->Main scope
scopeName "mainScope";
createDialog "SAF_status_dialog";
for "_i" from 0 to 100 do {
	
	_txt = format ["%1<br/><t size = '.4'>%2%3</t>",_txtBase,_i,"%"];
	[_txt,-1,-1,0.1,0,0,789] spawn BIS_fnc_dynamicText;
	
	if (!isNull _unit && count _refArr > 0) then {
		if (_unit distance (_refArr select 0) > (_refArr select 1) || !alive _unit) then {_return = false; breakTo "mainScope"; };
	};
	private _s = call _code;
	if (isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])) then { _return = false; breakTo "mainScope"; };
	if (_s) then {_return = false; breakTo "mainScope"; };
	private _tmpTime =  time + _sleep;
	waitUntil {time > _tmpTime};
};
if(!isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])) then { closeDialog 1};
//-->Return
_return;