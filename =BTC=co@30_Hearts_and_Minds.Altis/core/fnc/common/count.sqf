
private _n = count _this;
_n + {_x call btc_fnc_count} forEach (_this select {(typeName _this) isEqualTo "ARRAY"})