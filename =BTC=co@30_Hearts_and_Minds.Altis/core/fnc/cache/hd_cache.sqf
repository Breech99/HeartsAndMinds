
private ["_cache","_damage","_ammo","_explosive","_cache"];

_cache = _this select 0;
_damage = _this select 2;
_ammo = _this select 4;

_explosive = (getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0);

if (isNil {_cache getVariable "btc_hd_cache"} && {_explosive} && {_damage > 0.6}) then {
	_cache setVariable ["btc_hd_cache",true];
	//Effects
	private ["_pos","_marker"];
	_pos = getposATL btc_cache_obj;
	"Bo_GBU12_LGB_MI10" createVehicle _pos;
	_pos spawn {sleep 2;"M_PG_AT" createVehicle _this;sleep 2;"M_Titan_AT" createVehicle _this;};
	
	_socv = "#particlesource" createVehicleLocal getPosATL _cache;
	_socv setParticleCircle [_size_rad+50, [-5, -5, 1]];
	_socv setParticleRandom [2, [0.25, 0.25, 0], [20, 20, -1], 0, 0.25, [0, 0, 0, 0.1], 100, 100];
	_socv setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.75], 0, 17, 7.9, 0.075, [2, 3, 10], [[0.01, 0.01, 0.01, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _jdam_bomb];
	_socv setDropInterval 0.001;
	[_socv] spawn {
	_de_sters = _this select 0;
	sleep 2;
	deleteVehicle _de_sters;
};
//val fum
_val_fum = "#particlesource" createVehicleLocal getPosATL _cache;
_val_fum setParticleCircle [_size_rad+10, [0, 0, 1]];
//_val_fum setParticleRandom [0, [0,0, 0], 0,0,0], 0, 0, [0, 0, 0, 0], 0, 0];
_val_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0.75], 0, 17, 7.9, 0.075, [20, 80, 100], [[0, 0, 0, 1], [0.2, 0.2, 0.2, 0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _jdam_bomb];
_val_fum setDropInterval 0.002;

[_val_fum] spawn {
	_de_sters_v = _this select 0;
	sleep 7;
	deleteVehicle _de_sters_v;
};

// flacari
_foc = "#particlesource" createVehicleLocal (getPosATL _cache);
_foc setParticleCircle [floor (_size_rad/5), [-5, -5, 1]];
_foc setParticleRandom [0, [0,0,0], [0,0,0], 0, 0, [0, 0, 0,0], 0, 0];
_foc setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0,0, 3], 40, 20, 7.9, 0.5, [30,25,5], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 0]], [0.02], 1, 0, "", "", _nap_bomb_sec];
_foc setDropInterval 0.01;

[_foc] spawn {
	_de_sters = _this select 0;
	sleep 7;
	deleteVehicle _de_sters;
};

sleep 3;

// fum negru
_fum_negru = "#particlesource" createVehicleLocal getPosATL _cache;
_fum_negru setParticleCircle [_size_rad/2,[0.2, 0.5, 5]];
_fum_negru setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_fum_negru setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 5], [0,0, 15], 5, 17, 13, 0.65, [25, 35, 50,70], [[0.5, 0.5, 0.5, 0.5], [0, 0, 0, 1], [0, 0, 0, 0.5], [0, 0, 0, 0]], [0.08], 0.1, 3, "", "", _nap_bomb_sec];
_fum_negru setDropInterval 0.1;

[_fum_negru] spawn {
	_de_sters = _this select 0;
	sleep 110;
	deleteVehicle _de_sters;
};


sleep 120;
deleteVehicle _nap_bomb_sec;

// vapori
_vapori_bmb = "#particlesource" createVehicleLocal getPosATL _cache;
_vapori_bmb setParticleCircle [0, [0, 0, 0]];
_vapori_bmb setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_vapori_bmb setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0], 0, 9.7, 7.9, 0, [50, 100, 200], [[1, 1, 1, 0.5],[1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _jdam_bomb];
_vapori_bmb setDropInterval 300;
enableCamShake true;
_power_sh = floor((50*100)/(player distance _cache));
addCamShake [_power_sh, 2, 50];

[_vapori_bmb] spawn {
	_de_sters = _this select 0;
	sleep 1.5;
	deleteVehicle _de_sters;
};

// scantei
_scantei = "#particlesource" createVehicleLocal getPosATL _cache;
_scantei setParticleCircle [_size_rad/2, [0, 0, 10]];
_scantei setParticleRandom [3, [0.25, 0.25, 0], [100, 100, 100], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_scantei setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 11, [0, 0, 0], [17, 17, 50], 0.3, 200, 5, 3, [1.5, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _jdam_bomb];
_scantei setDropInterval 0.01;	

[_scantei] spawn {
	_de_sters = _this select 0;
	sleep 1;
	deleteVehicle _de_sters;
};

/*
fumuri
*/

sleep 0.5;

_li_exp setLightBrightness 10;

[_li_exp,_cache] spawn {
	_lum_sters = _this select 0;
	_j_bomb = _this select 1;
	sleep 1;
	_u=20;
	while {_u>0} do {
	_lum_sters setLightBrightness _u;
	_lum_sters lightAttachObject [_cache, [random 200,random 200,random 200]];
	_u=_u-0.1;
	sleep 0.01;
	};
	sleep 0.01;
	deleteVehicle _lum_sters;
};
enableCamShake false;
	[_pos] call btc_fnc_deaf_earringing;
	deleteVehicle btc_cache_obj;
	_marker = createmarker [format ["btc_cache_%1", btc_cache_n], btc_cache_pos];
	_marker setmarkertype "hd_destroy";
	_marker setMarkerText format ["Cached %1 destroyed", btc_cache_n];
	_marker setMarkerSize [1, 1];
	_marker setMarkerColor "ColorRed";
	if (btc_debug_log) then	{
		diag_log format ["CACHE DESTROYED: ID %1 POS %2",btc_cache_n,btc_cache_pos];
	};	
	btc_rep_bonus_cache spawn btc_fnc_rep_change;
	
	btc_cache_pos = [];
	btc_cache_n = btc_cache_n + 1;
	btc_cache_obj = objNull;
	btc_cache_info = btc_info_cache_def;
	{deleteMarker _x} foreach btc_cache_markers;
	btc_cache_markers = [];
	
	//Notification
	[0] remoteExec["btc_fnc_showhint", 0];
	
	[]spawn {[] call btc_fnc_cache_find_pos;};
} else {0};