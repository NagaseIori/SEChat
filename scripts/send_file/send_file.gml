// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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