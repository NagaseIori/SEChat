/*
    scrFile
    Functions to send file.
*/

///@description Send a file.
function send_file(_sock, _filename){
	var inst = instance_create_depth(0, 0, 0, objSent);
	inst.file_name = filename_name(_filename);
	inst.buff = bfile_open_read(_filename);
	if(inst.buff<0) {
		chat_msg("System: 无法打开该文件。");
		instance_destroy(inst);
		return 0;
	}
	inst.buff_siz = file_size(_filename);
	inst.status = 1;
	inst.sock = _sock;
	inst.file_id = md5_file(_filename);
	global.m_file[? inst.file_id] = inst;
	socket_file_requ(_sock, inst.file_id, inst.buff_siz, inst.file_name);
	chat_file(global.user_name+":", inst, "sent");
}

///@description Receieve a file.
function recv_file(_fileid, _size, _filename, _username){
	var inst = instance_create_depth(0, 0, 0, objRecv);
	inst.recv_siz = _size;
	inst.file_name = _filename;
	
	inst.file_id = _fileid;
	inst.sender_name = _username;
	global.m_file_recv[? _fileid] = inst;
	chat_file(_username+":", inst, "recv");
	
	var dir = program_directory + "Downloads\\" + _filename;
	if(file_exists(dir) && md5_file(dir)==_fileid) {
		inst.recv_pos = _size;
		inst.no_save = true;
		socket_file_prog(available_socket(), _fileid, _size, "null");
	}
	else {
		dir = program_directory + "Downloads\\" + _fileid;
		inst.buffer = bfile_open(dir);
		if(inst.buffer<0)
			show_error("FILE OPEN FAILED."+string(inst.buffer), true);
	}
}