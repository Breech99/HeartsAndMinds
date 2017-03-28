///////////////////////////////////////////////////////////////////////////////////////////////////
//  Simple Heli Door Script v1.03 by BangaBob edited for Huron 811thEAB                          //
//  Execute from any Taru init field:                                                           //
//  nul = [this] execVM "scripts\fn_heliDoors3.sqf";                                             //
//                                                                                               //
//  Inspired by Heli Door Open Script by Delta 1 Actual                                          //
//  http://www.armaholic.com/page.php?id=21969                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define THIS_FILE "fn_heliDoor3.sqf"
#include "x_setup.sqf"

private ["_veh","_alt","_speed"];

_veh = _this select 0;
if (!isServer || !(_veh isKindOf "O_Heli_Transport_04_F")) exitWith {};

while {alive _veh} do {
  sleep 0.5;
  _alt = getPos _veh select 2;
  _speed = (sqrt ((velocity _veh select 0)^2 + (velocity _veh select 1)^2 + (velocity _veh select 2)^2));
  if ((_alt < 1) && (_speed < 1)) then {
    _veh animateDoor ['Door_1_source',1]; 
    _veh animateDoor ['Door_2_source',1];	
    _veh animateDoor ['Door_3_source',1];
  } else {
    _veh animateDoor ['Door_1_source',0]; 
    _veh animateDoor ['Door_2_source',0];	
    _veh animateDoor ['Door_3_source',0];
  };
};