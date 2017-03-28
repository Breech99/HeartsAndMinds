
private ["_color","_array"];

_color = [1,0.5,0,1];
_array = [
['\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa',_color, getPos btc_gear_object, 1.1, 1.1, 0, "Arsenal/Re-deploy", 1],
['\A3\Ui_f\data\Logos\a_64_ca.paa',_color, [getPos btc_gear_object select 0,getPos btc_gear_object select 1,(getPos btc_gear_object select 2) + 2], 1.1, 1.1, 0, "", 1],
//['\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa',_color, [getPos btc_create_object select 0,getPos btc_create_object select 1,(getPos btc_create_object select 2) + 5], 0.9, 0.9, 90, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa',_color, [getPos btc_create_object select 0,getPos btc_create_object select 1,(getPos btc_create_object select 2) + 2.5], 0.9, 0.9, 0, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa',_color, getPos btc_create_object, 0.9, 0.9, 0, "Rearm/Repair and Objects", 1]
];
if (!isNil "btc_helo_1") then {_array pushBack ['\A3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa',[0.7,0,0,1], getPos btc_helo_1, 1.1, 1.1, 0, "Respawnable", 1];};

sleep 8;
waitUntil {!isnull player};
waitUntil {alive player};

playMusic "intro_music";

[getMarkerPos "btc_base","NATO BASE: Loading-------------------------------------------------------------------------------------------",380,200,2,5,_array,0] spawn BIS_fnc_establishingShot; ///20,30,240,0

title = parsetext "<t size='2.0'>Tensions rise as troops arrive</t><br />As UN forces arrive in Tanoa attacks grow more frequent."; 
scroll = parsetext " ------ Military Units across Tanoa report Optila faction outbursts are on the rise - Another UN helicopter goes missing in the jungle - US Tank found at bottom of GeorgeTown Bay - Rabid squirrels on the attack! - Tanoan village is burnt to the ground...No evidence has been linked to UN Peacekeeping forces - Military Units across Tanoa report Optila faction outbursts are on the rise"; 
1 = [title,scroll] spawn BIS_fnc_AAN;

sleep 47;
(uinamespace getvariable "BIS_AAN") closedisplay 1;
