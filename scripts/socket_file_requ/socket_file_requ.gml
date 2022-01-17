// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_file_requ(_sock, _fileid, _size, _filename){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "filerequ";
	temp_map[? "fileid"] = _fileid;
	temp_map[? "size"] = _size;
	temp_map[? "filename"] = _filename;
	temp_map[? "name"] = global.user_name;
	temp_map[? "ID"] = global.UUID;
	
	var res = socket_map(_sock, temp_map, 2);
	ds_map_destroy(temp_map);
	
	return res;
}