// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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