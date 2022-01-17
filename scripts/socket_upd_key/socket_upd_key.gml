// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_upd_key(_sock){
	var null_m = ds_map_create();
	null_m[? "type"] = "UUID";
	null_m[? "UUID"] = global.UUID;
	socket_map(_sock, null_m, 1);
	ds_map_destroy(null_m);
}