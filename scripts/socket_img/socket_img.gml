// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_img(_str, _sock){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "image";
	temp_map[? "name"] = global.user_name;
	temp_map[? "text"] = filename_name(_str);
	temp_map[? "hash"] = "<NULL>";
	temp_map[? "ID"] = global.UUID;
	
	var temp_buffer = buffer_load(_str);
	
	if(buffer_get_size(temp_buffer)>2*1024*1024) {
		send_file(_sock, _str);
		buffer_delete(temp_buffer);
		ds_map_destroy(temp_map);
		return 1;
	}
	
	var temp_str = buffer_base64_encode(temp_buffer, 0, buffer_get_size(temp_buffer));
	temp_map[? "file"] = temp_str;
	buffer_delete(temp_buffer);
	
	var res = socket_map(_sock, temp_map, 2);
	ds_map_destroy(temp_map);
	
	return res;
}