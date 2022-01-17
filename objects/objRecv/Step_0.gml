/// @description Insert description here
// You can write your code in this editor

var _sock = available_socket();
if(_sock<0) {
	chat_msg("System: 连接中断。文件传输终止。");
	instance_destroy();
	return;
}
else if(rec_pos != recv_pos) {
	socket_file_prog(_sock, file_id, recv_pos, "null");
}
rec_pos = recv_pos;
if(recv_pos == recv_siz) {
	var dir = "\\\\?\\" + program_directory + "Downloads\\" + file_name;
	
	if(!no_save) {
		bfile_close(buffer);
		file_rename(program_directory + "Downloads\\" + file_id, program_directory + "Downloads\\" + file_name);
		buffer = -1;
	}
	
	switch(filename_ext(file_name)) {
		case ".jpg":
		case ".jpeg":
		case ".png":
		case ".jfif":
			var _spr = sprite_add(dir, 1, 0, 0, 0, 0);
			chat_img(sender_name+":", _spr);
			break;
		case ".mp3":
		case ".ogg":
		case ".flac":
		case ".wav":
		case ".midi":
		case ".mod":
		case ".s3m":
			chat_music(global.user_name+":", dir, true);
			break;
	}
	
	alarm[0] = 0;
	instance_destroy();
}

else if(recv_pos > recv_siz) {
	chat_msg("System: FUCK");
	instance_destroy();
}