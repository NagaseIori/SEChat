/// @description 

if(async_load[? "id"]==client_sock) {
	switch(async_load[? "type"]) {
		case network_type_disconnect:
			chat_msg("System: 服务器已断开。(IP: "+ip+")");
			global.cli_UUID = "";
			instance_destroy();
			break;
		case network_type_data:
			socket_msg_read(async_load[? "buffer"], async_load[? "size"]);
			break;
		default:
	}
}