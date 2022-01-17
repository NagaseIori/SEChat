// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_file_prog(_sock, _fileid, _size, _status){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "fileprog";
	temp_map[? "fileid"] = _fileid;
	temp_map[? "size"] = _size;
	temp_map[? "status"] = _status;
	temp_map[? "ID"] = global.UUID;
	
	var res = socket_map(_sock, temp_map, 2);
	ds_map_destroy(temp_map);
	
	return res;
}