/// @description Insert description here
// You can write your code in this editor

file_dnd_set_files(file_dnd_pattern, file_dnd_allowfiles, file_dnd_allowdirs, file_dnd_allowmulti);
file_dnd_filelist = file_dnd_get_files();
var _sock = available_socket();
if(file_dnd_filelist != "") {
	file_dnd_set_enabled(false);
	var ext = filename_ext(file_dnd_filelist);
	//chat_msg("System: 已读取到文件 "+file_dnd_filelist);
	switch(ext) {
		case ".png":
		case ".jpg":
		case ".jpeg":
		case ".jfif":
			var _spr = sprite_add(file_dnd_filelist, 1, 0, 0, 0, 0);
			chat_img(global.user_name+":", _spr);
			
			if(_sock>=0)
				socket_img(file_dnd_filelist, _sock);
			
			break;
		case ".mp3":
		case ".ogg":
		case ".flac":
		case ".wav":
		case ".midi":
		case ".mod":
		case ".s3m":
			if(_sock>=0)
				send_file(_sock, file_dnd_filelist);
			chat_music(global.user_name+":", file_dnd_filelist, false);
			break;
		default:
			if(_sock>=0)
				send_file(_sock, file_dnd_filelist);
			else
				chat_msg("System: 未连接服务器或客户端，无法发送文件。");
			break;
	}
	file_dnd_filelist="";
	file_dnd_set_enabled(true);
}

if(!surface_exists(surf))
	surf=surface_create(width, height);

if(global.Focusing == 0) {
	
	if(mouse_check_button_pressed(mb_right)) {
		keyboard_string += clipboard_get_text();
	}
	
	if(string_length(keyboard_string)>max_length)
		keyboard_string = msg_now;
	else
		msg_now = keyboard_string;
	
	
	if(keyboard_check_pressed(vk_enter)) {
		if(msg_now!="") {
			chat_msg(global.user_name + ": " + msg_now, sha1_string_unicode(msg_now));
			
			if(_sock>=0)
				socket_msg(msg_now, _sock);
			
			keyboard_string = "";
			msg_now = "";
		}
	}
	
	
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var i = max(tot_line-screen_lines-below, 0), j = 14, nsep = sep, mi = i+min(tot_line, screen_lines);
// draw_set_font(fZpix14);
// draw_set_color(global.fr_col);
// draw_set_alpha(1.0);
// draw_set_valign(fa_center);
// draw_set_halign(fa_left);
type_line[tot_line] = undefined;

while(i<mi) {
	var _text = "";
	switch(type_line[i]) {
		case "text":
			// draw_text(0, j, show_hash ? hash_line[i] : msg_line[i]);
			_text = show_hash ? hash_line[i] : msg_line[i];
			j+=nsep;
			i++;
			break;
		case "image":
			// draw_text(0, j, msg_line[i]);
			_text = msg_line[i];
			j+=nsep;
			draw_sprite(spr_line[i], 0, 0, j);
			j+=nsep*num_line[i];
			i+=num_line[i]+1;
			break;
		case "music":
			var _inst = spr_line[i];
			// draw_text(0, j, msg_line[i]);
			_text = msg_line[i];
			j+=nsep;
			_inst.x = x;
			_inst.y = j+y;
			_inst.in_chat = true;
			instance_activate_object(_inst);
			j+=nsep*(num_line[i]-1);
			i+=num_line[i];
			break;
		case "file":
			var _inst = spr_line[i];
			var _bar_length = 500;
			var _bar_height = 5;
			var k = j+nsep/3*2;
			if(num_line[i]=="recv") {
				if(instance_exists(_inst)) {
					var _spd = " (SPD. "+string(_inst.est_spd/1024/1024)+"MB/s)";
					var _siz = " (SIZ. "+string(_inst.recv_pos/1024/1024)+"/"+string(_inst.recv_siz/1024/1024)+"MB)";
					// draw_text(0, j, msg_line[i]+" 接收文件 "+file_line[i]+_spd+_siz);
					_text = msg_line[i]+" 接收文件 "+file_line[i]+_spd+_siz;
					//draw_text(0, j+nsep, ascii_prog(_inst.recv_pos/_inst.recv_siz, _bar_length));
					draw_set_alpha(0.6);
					draw_rectangle(0, k, _bar_length, k+_bar_height, false);
					draw_set_alpha(1.0);
					draw_rectangle(0, k, _bar_length*_inst.recv_pos/_inst.recv_siz, k+_bar_height, false);
				}
				else {
					// draw_text(0, j, msg_line[i]+" 文件 "+file_line[i]+" 接收完毕。");
					_text = msg_line[i]+" 文件 "+file_line[i]+" 接收完毕。"
					//draw_text(0, j+nsep, ascii_prog(1.0, _bar_length));
					draw_rectangle(0, k, _bar_length, k+_bar_height, false);
				}
			}
			else if(num_line[i]=="sent") {
				if(instance_exists(_inst)) {
					var _spd = " (SPD. "+string(_inst.est_spd/1024/1024)+"MB/s)";
					var _siz = " (SIZ. "+string(_inst.sent_pos/1024/1024)+"/"+string(_inst.buff_siz/1024/1024)+"MB)";
					// draw_text(0, j, msg_line[i]+" 发送文件 "+file_line[i]+_spd+_siz);
					_text = msg_line[i]+" 发送文件 "+file_line[i]+_spd+_siz;
					//draw_text(0, j+nsep, ascii_prog(_inst.sent_pos/_inst.buff_siz, _bar_length));
					draw_set_alpha(0.6);
					draw_rectangle(0, k, _bar_length, k+_bar_height, false);
					draw_set_alpha(1.0);
					draw_rectangle(0, k, _bar_length*_inst.sent_pos/_inst.buff_siz, k+_bar_height, false);
				}
				else {
					// draw_text(0, j, msg_line[i]+" 文件 "+file_line[i]+" 发送完毕。");
					_text = msg_line[i]+" 文件 "+file_line[i]+" 发送完毕。";
					//draw_text(0, j+nsep, ascii_prog(1.0, _bar_length));
					draw_rectangle(0, k, _bar_length, k+_bar_height, false);
				}
			}
			j+=nsep*2;
			i+=2;
			break;
		default:
			i--;
			j-=nsep;
			break;
	}
	
	// Draw the text
	scribble(_text)
	.blend(global.fr_col, 1.0)
	.align(fa_left, fa_center)
	.draw(0, j);
}

draw_reset();
surface_reset_target();