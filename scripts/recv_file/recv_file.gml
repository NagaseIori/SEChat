// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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