// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_disconnect(_sock){
	var _map = ds_map_create();
	_map[? "type"] = "disconnect";
	_map[? "ID"] = global.UUID;
	socket_map(_sock, _map, 1);
	ds_map_destroy(_map);
}