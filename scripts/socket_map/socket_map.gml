// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function socket_map(_sock, temp_map, _rc4){
	if(!rsa_check()) {
		chat_msg("System: 未检测到 RSA 密钥文件。请断开连接后重新生成密钥。");
		instance_destroy(objServer);
		instance_destroy(objClient);
		return;
	}
	
	var temp_buffer = buffer_create(1024, buffer_grow, 1);
	buffer_write(temp_buffer, buffer_u8, _rc4);
	if(_rc4==1) {
		/* Encrypt private key */
		global.rc4_key=random_string(32);
		var _encbuff = buffer_create(256, buffer_fixed, 1);
		buffer_write(_encbuff, buffer_string, global.rc4_key);
		var _encbuff2 = rsa_encrypt(_encbuff, "cli_pub.pem");
		
		buffer_write(temp_buffer, buffer_u32, buffer_get_size(_encbuff2));
		buffer_copy(_encbuff2, 0, buffer_get_size(_encbuff2), temp_buffer, buffer_tell(temp_buffer));
		buffer_seek(temp_buffer, buffer_seek_relative, buffer_get_size(_encbuff2));
		buffer_delete(_encbuff);
		buffer_delete(_encbuff2);
	}
	else {
		buffer_write(temp_buffer, buffer_u32, 0);
	}
	var _offset = buffer_tell(temp_buffer);
	buffer_write(temp_buffer, buffer_text, json_encode(temp_map));
	
	var length = buffer_get_size(temp_buffer);
	if(_rc4) rc4_buff(temp_buffer, global.rc4_key, _offset, length-_offset);
	//rc4_buff(temp_buffer, "SLSB", 0, length);
	var res = network_send_packet(_sock, temp_buffer, length);
	
	buffer_delete(temp_buffer);
	return res; 
}