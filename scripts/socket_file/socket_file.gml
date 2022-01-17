// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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