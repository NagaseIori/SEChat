// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_key(_sock){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "key";
	var _buff = buffer_load(add_pref(working_directory + "pub.pem"));
	temp_map[? "key"] = buffer_base64_encode(_buff, 0, buffer_get_size(_buff));
	
	var res = socket_map(_sock, temp_map, 0);
	ds_map_destroy(temp_map);
	buffer_delete(_buff);
	
	return res;
}