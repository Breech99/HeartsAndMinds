params ["_from", "_to", "_isRuin"];
private _classname = typeOf _from;
private _malus = [btc_rep_malus_building_damaged, btc_rep_malus_building_destroyed] select _isRuin;

{
	if([_x select 0, _classname] call BIS_fnc_inString) exitWith {
		_malus = _malus * (_x select 1);
	};
} forEach btc_buildings_multipliers;

if (btc_debug) then {
	systemChat format [ "BuildingChanged: %1 to %2. Malus: %3",
	typeOf _from, typeOf _to, _malus ];
};