// ai medic using ACE3 ^^^^^^^****** dummy = [this, units (group this)] execVM "scripts\automedic.sqf";
#include "\z\ace\addons\medical\script_component.hpp"
private ["_needradio", "_medic", "_injured", "_deads"];
_medic = _this select 0;
_units = _this select 1;
_injured = objNull;
_needradio = true;

//main loop
while {alive _medic} do {

	sleep 2;
	//waiting for a wounded
	while {(isNull _injured) and (alive _medic)} do {
		//if the medic is injured
		if (_medic getvariable [QGVAR(isBleeding), false]) then {
			//if medic is already dead, then exit
			if (!alive _medic) exitWith{};
			//else he is the injured and he is a priority to heal himself
			_injured = _medic;
		} else {
			_deads = [];
			{
				if (!alive _x or isNull _x) then {
					_deads = _deads + [_x];
				};
				if ((isNull _injured) and (_x getvariable [QGVAR(isBleeding), false]) and (alive _x) and (!isNull _x)) then {			
					_injured = _x;
					if (_needradio) then {_medic groupChat format["Keep calm %1, I will heal you.", (name _injured)];};
				};
			} foreach _units;
			_units = _units - _deads;
		};
		sleep 5;
	};

	if(!alive _medic) exitWith{};
	
	//we have an injured, stop him
	if ((!isPlayer _injured) and (_medic!=_injured)) then {
		_injured disableAI "MOVE";
		_injured setUnitPos "down";
	};
	if (_medic != _injured) then {
		//medic go for him
		_medic doMove (position _injured);
		while {(_medic distance _injured > 10) and (alive _injured) and (!isNull _injured)} do {		
			sleep 1;
			_medic doMove (position _injured);
			if(!alive _medic) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};
		};
	};
	
	if(!alive _medic) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};
	
	//when medic is close enough to the injured...
	//...and injured is still alive
	if ((alive _injured) and (!isNull _injured) and (alive _medic)) then {	
		//stop the medic
		//_medic disableAI "MOVE";
		//_medic setUnitPos "middle";
		sleep 1;
		//HEAL the injured
		// ******************************
		_medic allowDamage false;
		_medic action ["HealSoldier", _injured];
		_medic playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 9;
		_injured setVariable [QGVAR(pain), 0, true];
		_injured setVariable [QGVAR(morphine), 0, true];
		_injured setVariable [QGVAR(bloodVolume), 100, true];
		_injured setVariable ["ACE_isUnconscious", false, true];
		_injured setvariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];
		_injured setvariable [QGVAR(openWounds), [], true];
		_injured setvariable [QGVAR(bandagedWounds), [], true];
		_injured setVariable [QGVAR(internalWounds), [], true];
		_injured setvariable [QGVAR(lastUniqueWoundID), 1, true];
		_injured setVariable [QGVAR(heartRate), 80];
		_injured setvariable [QGVAR(heartRateAdjustments), []];
		_injured setvariable [QGVAR(bloodPressure), [80, 120]];
		_injured setVariable [QGVAR(peripheralResistance), 100];
		_injured setVariable [QGVAR(fractures), [], true];
		_injured setvariable [QGVAR(triageLevel), 0, true];
		_injured setvariable [QGVAR(triageCard), [], true];
		_injured setVariable [QGVAR(salineIVVolume), 0, true];
		_injured setVariable [QGVAR(plasmaIVVolume), 0, true];
		_injured setVariable [QGVAR(bloodIVVolume), 0, true];
		_injured setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];
		_injured setvariable [QGVAR(airwayStatus), 100];
		_injured setVariable [QGVAR(airwayOccluded), false];
		_injured setvariable [QGVAR(airwayCollapsed), false];
		_injured setvariable [QGVAR(addedToUnitLoop), false, true];
		_injured setvariable [QGVAR(inCardiacArrest), false, true];
		_injured setvariable [QGVAR(hasLostBlood), 0, true];
		_injured setvariable [QGVAR(isBleeding), false, true];
		_injured setvariable [QGVAR(hasPain), false, true];
		_injured setvariable [QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives), true];
		_injured setvariable [QGVAR(painSuppress), 0, true];
		_injured setDamage 0;
		// ******************************
		//wait until injured is healed or dead
		waitUntil { !(_injured getvariable [QGVAR(isBleeding), false]) or (!alive _injured) };
		sleep 3;
		if (_medic != _injured) then {
			if (_needradio) then {_medic groupChat format["OK %1, you are ready to fight.", (name _injured)];};
		};
		_medic allowDamage true;
		//healed soldier is ready to fight
		_injured enableAI "MOVE";
		_injured setUnitPos "auto";
	};
	//we are ready for looking a new injured
	_injured = objNull;
	//set the medic to ready to looking for a new injured
	_medic enableAI "MOVE";
	_medic setUnitPos "auto";
	//doMove stops the medic, so we have to command him to follow his leader
	_medic doMove (leader group _medic);
	if(!alive _medic) exitWith{_injured enableAI "MOVE"; _injured setUnitPos "auto";};
};
