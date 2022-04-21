function save_settings(){
	var _map = ds_map_create();
	_map[? "FPS"] = room_speed;
	_map[? "name"] = global.user_name;
	_map[? "loc_port"] = global.local_port;
	_map[? "pri_key"] = global.pri_key;
	_map[? "serv_addr"] = global.serv_addr;
	_map[? "serv_port"] = global.serv_port;
	_map[? "whl_spd"] = global.wheel_speed;
	_map[? "fr_col"] = global.fr_col;
	_map[? "bg_col"] = global.bg_col;
	_map[? "bg_type"] = global.bg_type;
	_map[? "bg_file"] = global.bg_img_file;
	_map[? "bg_radius"] = global.bg_radius;
	_map[? "img_lines"] = global.img_lines;
	
	var _file = file_text_open_write("settings.ini");
	file_text_write_string(_file, json_encode(_map));
	file_text_close(_file);
	
	ds_map_destroy(_map);
}

function load_settings(){
	var _map = ds_map_create();
	var _file = file_text_open_read("settings.ini");
	if(_file<0) return;
	_map = json_decode(file_text_read_string(_file));
	file_text_close(_file);
	room_speed = _map[? "FPS"];
	global.user_name = _map[? "name"];
	global.local_port = _map[? "loc_port"];
	global.pri_key = _map[? "pri_key"];
	global.serv_addr = _map[? "serv_addr"];
	global.serv_port = _map[? "serv_port"];
	global.wheel_speed = _map[? "whl_spd"];
	global.fr_col = map_ifload(_map, "fr_col", global.fr_col);
	if(ds_map_exists(_map, "bg_col"))
		global.bg_col = _map[? "bg_col"];
	if(ds_map_exists(_map, "bg_type"))
		global.bg_type = _map[? "bg_type"];
	if(ds_map_exists(_map, "bg_radius"))
		global.bg_radius = _map[? "bg_radius"];
	if(ds_map_exists(_map, "bg_file"))
		global.bg_img_file = _map[? "bg_file"];
	if(ds_map_exists(_map, "load_file"))
		global.bg_img_file = _map[? "bg_file"];
	global.img_lines = map_ifload(_map, "img_lines", global.img_lines);
	
	ds_map_destroy(_map);
}

function clear_history() {
	var i;
	fmod_stopchan();
	for(i=0; i<objChat.tot_line; i++) {
		switch(objChat.type_line[i]) {
			case "image":
				sprite_delete(objChat.spr_line[i]);
				objChat.type_line[i] = undefined;
				break;
			case "text":
				objChat.type_line[i] = undefined;
				break;
			case "file":
				objChat.type_line[i] = undefined;
				break;
			case "music":
				instance_destroy(objChat.spr_line[i]);
				objChat.type_line[i] = undefined;
				break;
			default:
				objChat.type_line[i] = undefined;
				
				break;
		}
	}
	objChat.tot_line = 0;
	objChat.below = 0;
}

function export_history(){
	var _cur = date_current_datetime();
	var _sug_file = "Chat ";
	_sug_file+=string(date_get_year(_cur))+"-";
	_sug_file+=string(date_get_month(_cur))+"-";
	_sug_file+=string(date_get_day(_cur))+"-";
	_sug_file+=string(date_get_hour(_cur))+"-";
	_sug_file+=string(date_get_minute(_cur))+"-";
	_sug_file+=string(date_get_second(_cur))+".txt";
	
	var _filename = get_save_filename_ext("文本文档|*.txt", _sug_file, program_directory, "导出聊天历史至");
	if(_filename == "") return;
	var _file = file_text_open_write("\\\\?\\"+_filename);
	if(_file<0) {
		chat_msg("创建文件失败。请更改文件路径重试。", "System");
		return;
	}
	
	with(objChat) {
		var i = 0, len = tot_line;
		while(i<len) {
			switch(type_line[i]) {
				case "text":
					file_text_write_string(_file, sender_line[i] + " : " +msg_line[i]);
					file_text_writeln(_file);
					i++;
					break;
				case "image":
					file_text_write_string(_file, sender_line[i] + " : " +msg_line[i]+" [image]");
					file_text_writeln(_file);
					i+=num_line[i];
					break;
				case "file":
					file_text_write_string(_file, sender_line[i] + " : " +msg_line[i]+" [file] "+file_line[i]);
					file_text_writeln(_file);
					i+=2;
					break;
				case "music":
					file_text_write_string(_file, sender_line[i] + " : " +msg_line[i]+" [music]");
					file_text_writeln(_file);
					i+=num_line[i];
					break;
				default:
					break;
			}
		}
	}
	file_text_close(_file);
	
	chat_msg("聊天历史已导出至 " + _filename, "System");
}

function button_trigger(_id){
	switch(_id) {
		case "connect_server":
			if(!instance_exists(objClient))
				instance_create_depth(0, 0, 0, objClient);
			else
				chat_msg("服务器已经连接！", "System");
			break;
		case "disconnect_server":
			if(instance_exists(objClient)) {
				global.cli_UUID = "";
				chat_msg("服务器已断开。(IP: "+objClient.ip+")", "System");
				instance_destroy(objClient);
			}
			else
				chat_msg("未连接服务器。", "System");
			break;
		case "switch_hash":
			objChat.show_hash^=1;
			break;
		case "return":
			move_camera(0, 0);
			break;
		case "settings":
			move_camera(1.0, 0);
			break;
		case "export_history":
			export_history();
			break;
		case "clear_history":
			clear_history();
			break;
		case "create_server":
			if(!instance_exists(objServer))
				instance_create_depth(0, 0, 0, objServer);
			else
				chat_msg("服务器已经运行！", "System");
			break;
		case "destroy_server":
			if(!instance_exists(objServer))
				chat_msg("服务器未运行。", "System");
			else
				instance_destroy(objServer);
			break;
		case "generate_key":
			rsa_generate_key(1024);
			var _str = random_string(30);
			clipboard_set_text(_str);
			global.pri_key = _str;
			global.m_bar[? "Server Key"].contains = _str;
			break;
		case "front_col":
			var _col = get_color_ext(global.fr_col, "Choose the front color");
			if(_col>=0)
				global.fr_col = _col;
			break;
		case "bg_col":
			var _col = get_color_ext(global.bg_col, "Choose the background color");
			if(_col<0) break;
			if(global.bg_type==1) {
				sprite_delete(objBackground.image_spr);
				objBackground.image_spr = -1;
			}
			global.bg_col = _col;
			global.bg_type = 0;
			break;
		case "bg_img":
			var _file = get_open_filename_ext("Image Files|*.png;*.jpeg;*.jpg;*.jfif", "", program_directory, "Choose the background image");
			if(_file=="") break;
			if(global.bg_type==1) {
				sprite_delete(objBackground.image_spr);
				objBackground.image_spr = -1;
			}
			global.bg_img_file = _file;
			global.bg_type = 1;
			break;
		default:
			break;
	}
}