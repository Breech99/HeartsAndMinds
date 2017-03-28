/*
V1.3.5 Script by: Ghost put this in an objects init line - ghst_halo = host1 addAction ["Halo", "ghst_halo.sqf", [(true,false),2500], 6, true, true, "","alive _target"];
*/

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;
_typehalo = _params select 0;//true for all group, false for player only.
_althalo = _params select 1;//altitude of halo jump
_altchute = _params select 2;//altitude for autochute deployment
_saveLoadOut = [_params, 3, false, [true]] call BIS_fnc_param;//save loadout

if (not alive _host) exitwith {
hint "Halo Not Available"; 
_host removeaction _id;
};

//save the backpack and its contents, also adds fake pack to front of unit
//[_saveLoadOut,_caller] spawn ghst_halo_ventralpack;
ghst_halo_ventralpack = {

	private ["_saveLoadOut","_caller","_altitude","_pack","_packclass","_magazines","_weapons","_items","_helmet","_packHolder"];
	
	_saveLoadOut = _this select 0;
	_caller = _this select 1;
	//_altitude = (getpos _caller select 2);
	_helmet = headgear _caller;

	if (_saveLoadOut and !(isnull (unitBackpack _caller)) and ((backpack _caller) != "b_parachute")) then {
		_pack = unitBackpack _caller;
		_packclass = typeOf _pack;
		_magazines = getMagazineCargo _pack;
		_weapons = getWeaponCargo _pack;
		_items = getItemCargo _pack;

		//if ((_altitude > 3040) and (_helmet != "H_CrewHelmetHeli_B")) then {
		if (_helmet != "H_CrewHelmetHeli_B") then {
			//(unitBackpack _caller) addItemCargoGlobal [_helmet, 1]
			_caller addHeadGear "H_CrewHelmetHeli_B";//add "halo" headgear
		};

		removeBackpack _caller; //remove the backpack
		_caller addBackpack "b_parachute"; //add the parachute

		_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
		_packHolder addBackpackCargoGlobal [_packclass, 1];

		waitUntil {animationState _caller == "HaloFreeFall_non"};
		_packHolder attachTo [_caller,[-0.12,-0.02,-0.74],"pelvis"]; 
		_packHolder setVectorDirAndUp [[0,-1,-0.05],[0,0,-1]];

		waitUntil {animationState _caller == "para_pilot"};
		_packHolder attachTo [vehicle _caller,[-0.07,0.67,-0.13],"pelvis"]; 
		_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];

		waitUntil {isTouchingGround _caller || (getPos _caller select 2) < 1};
		detach _packHolder;
		deleteVehicle _packHolder; //delete the backpack in front

		_pack = unitBackpack _caller;
		removeBackpack _caller; //remove the backpack
		deletevehicle _pack;
		_caller addBackpack _packclass; //return the backpack
		clearAllItemsFromBackpack _caller; //clear all gear from new backpack

		for "_i" from 0 to (count (_magazines select 0) - 1) do {
		(unitBackpack _caller) addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i]; //return the magazines
		};
		for "_i" from 0 to (count (_weapons select 0) - 1) do {
		(unitBackpack _caller) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
		};
		for "_i" from 0 to (count (_items select 0) - 1) do {
		(unitBackpack _caller) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
		};

		if !(isnil "_helmet") then {
		_caller addHeadGear _helmet;//add back original headgear
		};
	};/* else {
		if ((backpack _caller) != "b_parachute") then {_caller addBackpack "B_parachute"}; //add the parachute if unit has no backpack
		if ((headgear _caller) != "H_CrewHelmetHeli_B") then {
			//(unitBackpack _caller) addItemCargoGlobal [_helmet, 1]
			_caller addHeadGear "H_CrewHelmetHeli_B";//add "halo" headgear
		};
		waitUntil {isTouchingGround _caller || (getPos _caller select 2) < 1};
		_pack = unitBackpack _caller;
		removeBackpack _caller; //remove the backpack
		deletevehicle _pack;
		if !(isnil "_helmet") then {
		_caller addHeadGear _helmet;//add back original headgear
		};
	};*/
};

if (vehicle _caller == _caller) then {
//Unit(s) not in aircraft
	private ["_pos"];
	
	_caller groupchat "Left click on the map where you want to insert";

	openMap true;

	mapclick = false;

	onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

	waituntil {mapclick or !(visiblemap)};
	
	if !(visibleMap) exitwith {
		_caller groupchat "Im too scared to jump";
	};
	_pos = clickpos;

	if (_typehalo) then {
	
		_grp1 = group _caller;
		{
			_x setpos [_pos select 0, _pos select 1, _althalo];
			_x spawn bis_fnc_halo;
			[_saveLoadOut,_x] spawn ghst_halo_ventralpack;
		} foreach units _grp1;

	} else {
	
		_caller setpos [_pos select 0, _pos select 1, _althalo];
		_caller spawn bis_fnc_halo;
		[_saveLoadOut,_caller] spawn ghst_halo_ventralpack;
		
	};

} else {
//Unit(s) in aircraft
	
	if (_typehalo) then {
	
		_grp1 = group _caller;
		
		{
			_x allowdamage false;
			unassignVehicle (_x);
			(_x) action ["EJECT", vehicle _x];
			_x spawn bis_fnc_halo;
			sleep 0.5;
			_x allowdamage true;
			[_saveLoadOut,_x] spawn ghst_halo_ventralpack;
		} foreach units _grp1;

	} else {

		_caller allowdamage false;
		unassignVehicle (_caller);
		(_caller) action ["EJECT", vehicle _caller];
		_caller spawn bis_fnc_halo;
		sleep 0.5;
		_caller allowdamage true;
		[_saveLoadOut,_caller] spawn ghst_halo_ventralpack;

	};
};

if (getpos _caller select 2 > (_altchute + 100)) then {
sleep 1;

[_caller] spawn bis_fnc_halo;

openMap false;

_bis_fnc_halo_action = _caller addaction ["<t size='1.5' shadow='2' color='#ff0000'>Open Chute</t> <img size='3' color='#ff0000' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>","A3\functions_f\misc\fn_HALO.sqf",[],1,false,true,"Eject"];

sleep 5;

_caller groupchat "Have a nice trip";// and dont forget to open your chute!";

//auto open before impact
waituntil {(position _caller select 2) <= _altchute};

_caller removeaction _bis_fnc_halo_action;

if !((vehicle _caller) iskindof "ParachuteBase") then {

	_caller groupchat "Deploying Chute";

	[_caller] spawn bis_fnc_halo;

};
waituntil {(position _caller select 2) < 1.5};
deletevehicle (vehicle _caller);
_caller switchmove "AmovPercMstpSrasWrflDnon";
_caller setvelocity [0,0,0];
};
