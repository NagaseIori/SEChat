// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_trigger(_id){
	switch(_id) {
		case "connect_server":
			if(!instance_exists(objClient))
				instance_create_depth(0, 0, 0, objClient);
			else
				chat_msg("System: 服务器已经连接！");
			break;
		case "disconnect_server":
			if(instance_exists(objClient)) {
				global.cli_UUID = "";
				chat_msg("System: 服务器已断开。(IP: "+objClient.ip+")");
				instance_destroy(objClient);
			}
			else
				chat_msg("System: 未连接服务器。");
			break;
		case "switch_hash":
			objChat.show_hash^=1;
			break;
		case "return":
			move_camera(0, 0);
			break;
		case "settings":
			move_camera(1366, 0);
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
				chat_msg("System: 服务器已经运行！");
			break;
		case "destroy_server":
			if(!instance_exists(objServer))
				chat_msg("System: 服务器未运行。");
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