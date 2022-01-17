/// @description Insert description here
// You can write your code in this editor

if(available_socket()<0) {
	chat_msg("System: 连接中断。文件传输终止。");
	instance_destroy();
	return;
}

if(status==1 && pos<buff_siz) {
	var i = 0;
	for (; i<times && pos<buff_siz && pos-sent_pos<tbuff_siz*times; i++) {
		//buffer_copy(buff, pos, min(buff_siz-pos, tbuff_siz), temp_buff, 0);
		bfile_read(buff, min(buff_siz-pos, tbuff_siz), buffer_get_address(temp_buff));
		socket_file(sock, file_name, file_id, temp_buff, min(buff_siz-pos, tbuff_siz), pos);
		pos += min(buff_siz-pos, tbuff_siz);
	}
}

if(sent_pos == buff_siz) {
	instance_destroy();
}