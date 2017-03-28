///////////////////////////////////////////////////////////////////////////////////////////////////
//  Simple Heli Door Script v1.03 by BangaBob                                                    //
//  Execute from any GhostHawk init field:                                                       //
//  nul = [this] execVM "scripts\fn_heliDoors.sqf";                                              //
//                                                                                               //
//  Inspired by Heli Door Open Script by Delta 1 Actual                                          //
//  http://www.armaholic.com/page.php?id=21969                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define THIS_FILE "fn_heliDoor.sqf"
#include "x_setup.sqf"

private ["_veh","_alt","_speed"];

_veh = _this select 0;
if (!isServer || !(_veh isKindOf "Heli_Transport_01_base_F")) exitWith {};

while {alive _veh} do {
  sleep 0.5;
  _alt = getPos _veh select 2;
  _speed = (sqrt ((velocity _veh select 0)^2 + (velocity _veh select 1)^2 + (velocity _veh select 2)^2));
  if ((_alt < 36) && (_speed < 4)) then {
    _veh animateDoor ['door_R',1]; 
    _veh animateDoor ['door_L',1];
  } else {
    _veh animateDoor ['door_R',0]; 
    _veh animateDoor ['door_L',0];
  };
};