
///@desc Key part of sending messages. Send the message through socket.
function socket_msg(_str, _sock){
	var temp_map = ds_map_create();
	temp_map[? "type"] = "text";
	temp_map[? "name"] = global.user_name;
	temp_map[? "text"] = _str;
	temp_map[? "hash"] = sha1_string_unicode(_str);
	temp_map[? "ID"] = global.UUID;
	
	var res = socket_map(_sock, temp_map, 1);
	ds_map_destroy(temp_map);
	
	return res;
}

///@desc Key part of receiving messages.
function socket_msg_read(_buffer, _size) {
	
	var _rc4 = buffer_read(_buffer, buffer_u8);
	var _keysize = buffer_read(_buffer, buffer_u32);
	
	//chat_msg("RECV: " + string(_rc4) + " " + string(_keysize));
	
	if(_rc4==1) {
		/* Decrypt Key */
		if(_keysize<0 || _keysize>256) return;
		var _decbuff = buffer_create(_keysize, buffer_fixed, 1);
		buffer_copy(_buffer, buffer_tell(_buffer), _keysize, _decbuff, 0);
		var _decbuff2 = rsa_decrypt(_decbuff);
		buffer_seek(_buffer, buffer_seek_relative, _keysize);
		global.last_rc4_key = buffer_read(_decbuff2, buffer_string);
		rc4_buff(_buffer, global.last_rc4_key, buffer_tell(_buffer), _size-buffer_tell(_buffer));
		buffer_delete(_decbuff);
		buffer_delete(_decbuff2);
	}
	else if(_rc4==2) {
		rc4_buff(_buffer, global.last_rc4_key, buffer_tell(_buffer), _size-buffer_tell(_buffer));
	}
	else if(_rc4==3) {
		rc4_buff(_buffer, global.last_rc4_key, 5, _size-5);
		var _fileid = buffer_read(_buffer, buffer_string);
		var _uuid = buffer_read(_buffer, buffer_string);
		var _filepos = buffer_read(_buffer, buffer_u32);
		var _filesiz = buffer_read(_buffer, buffer_u32);
		
		if(_uuid != global.cli_UUID) return;
		//var t_buff = buffer_create(_filesiz, buffer_fixed, 1);
		
		if(!ds_map_exists(global.m_file_recv, _fileid)) return;
		var _inst = global.m_file_recv[? _fileid];
		if(_filepos != _inst.recv_pos) {
			socket_file_prog(available_socket(), _inst.file_id, _inst.recv_pos, "resend");
			return;
		}
		//for(var ii = 0; ii<_filesiz; ii++)
		//	bfile_write_byte(_inst.buffer, buffer_read(_buffer, buffer_u8));
		
		bfile_write_instant(_inst.buffer, _filesiz, buffer_get_address(_buffer), buffer_tell(_buffer));
		//buffer_copy(_buffer, buffer_tell(_buffer), _filesiz, _inst.buffer, _inst.recv_pos);
		//chat_msg("NYA?" + string(_filepos) + " " + string(_filesiz) + " " + string(_inst.recv_pos));
		_inst.recv_pos+=_filesiz;
		//socket_file_prog(available_socket(), _inst.file_id, _inst.recv_pos, "null");
		//buffer_delete(t_buff);
		return;
		
		
	}
	var _str = buffer_read(_buffer, buffer_text);
	var _map = json_decode(_str);
	if(_map<0) {
		//show_error("Map can't decode.", false);
		return;
	}
	//chat_msg(_map[? "type"]);
	
	// Identification check
	if(global.cli_UUID != "") {
		if(!ds_map_exists(_map, "ID")) return;
		else if(_map[? "ID"] != global.cli_UUID) return;
	}
	
	switch(_map[? "type"]) {
		case "text":
			chat_msg(_map[? "name"]+": "+_map[? "text"], _map[? "hash"]);
			break;
		case "image":
			var temp_buffer = buffer_base64_decode(_map[? "file"]);
			var dir = "\\\\?\\" + program_directory + "Downloads\\" + _map[? "text"];
			buffer_save(temp_buffer, dir);
			buffer_delete(temp_buffer);
			var _spr = sprite_add(dir, 1, 0, 0, 0, 0);
			chat_img(_map[? "name"]+":", _spr);
			break;
		case "fileprog":
			if(!ds_map_exists(global.m_file, _map[? "fileid"])) break;
			var _inst = global.m_file[? _map[? "fileid"]];
			_inst.sent_pos = _map[? "size"];
			//chat_msg("RECVPROG"+string(_inst.sent_pos)+" "+string(_inst.pos));
			if(_map[? "status"]=="resend") {
				objSent.alarm[1] = 1;
			}
			break;
		case "filerequ":
			recv_file(_map[? "fileid"], _map[? "size"], _map[? "filename"], _map[? "name"]);
			break;
		case "key":
			//chat_msg("Received.");
			var _buff = buffer_base64_decode(_map[? "key"]);
			buffer_save(_buff, add_pref(working_directory + "cli_pub.pem"));
			buffer_delete(_buff);
			socket_upd_key(available_socket());
			break;
		case "disconnect":
			chat_msg("System: 服务器已断开。(IP: "+objClient.ip+")");
			global.cli_UUID = "";
			instance_destroy(objClient);
			break;
		case "UUID":
			if(global.cli_UUID != "") break;
			global.cli_UUID = _map[? "UUID"];
			break;
	}
	
	//buffer_delete(_buffer);
	ds_map_destroy(_map);
}

///@desc Send file through socket.
function socket_file(_sock, _filename, _fileid, _buff, _size, _pos){
	var t_buff = buffer_create(objSent.tbuff_siz+256, buffer_fixed, 1);
	buffer_write(t_buff, buffer_u8, 3);
	buffer_write(t_buff, buffer_u32, 0);
	buffer_write(t_buff, buffer_string, _fileid);
	buffer_write(t_buff, buffer_string, global.UUID);
	buffer_write(t_buff, buffer_u32, _pos);
	buffer_write(t_buff, buffer_u32, _size);
	var _length = _size+buffer_tell(t_buff);
	buffer_copy(_buff, 0, _size, t_buff, buffer_tell(t_buff));
	rc4_buff(t_buff, global.rc4_key, 5, _length - 5);
	var res = network_send_packet(_sock, t_buff, _length);
	
	buffer_delete(t_buff);
	return res;
}

///@desc Send file tranferring progress through socket.
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

///@desc Send file transfer request through socket.
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

///@desc Send small image through socket.
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

///@desc Send public key through socket.
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

///@desc Send UUID through socket.
function socket_upd_key(_sock){
	var null_m = ds_map_create();
	null_m[? "type"] = "UUID";
	null_m[? "UUID"] = global.UUID;
	socket_map(_sock, null_m, 1);
	ds_map_destroy(null_m);
}

///@desc Send the defined GMS2 map package as buffer through socket.
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
	var res = network_send_packet(_sock, temp_buffer, length);
	
	buffer_delete(temp_buffer);
	return res; 
}

///@desc Send the socket disconnection request through socket.
function socket_disconnect(_sock){
	var _map = ds_map_create();
	_map[? "type"] = "disconnect";
	_map[? "ID"] = global.UUID;
	socket_map(_sock, _map, 1);
	ds_map_destroy(_map);
}