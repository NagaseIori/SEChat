// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_msg(_str, _sock){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "text";
	temp_map[? "name"] = global.user_name;
	temp_map[? "text"] = _str;
	temp_map[? "hash"] = sha1_string_unicode(_str);
	temp_map[? "ID"] = global.UUID;
	
	var res = socket_map(_sock, temp_map, 1);
	ds_map_destroy(temp_map);
	
	return res;
}