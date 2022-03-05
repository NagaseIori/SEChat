
switch(async_load[? "type"]) {
	case network_type_connect:
		global.client = async_load[? "socket"];
		socket_key(global.client);
		chat_msg("已连接客户端。(IP: "+async_load[? "ip"]+")", "System");
		break;
	case network_type_disconnect:
		global.client = undefined;
		chat_msg("已断开客户端。(IP: "+async_load[? "ip"]+")", "System");
		global.cli_UUID = "";
		break;
	case network_type_data:
		if(async_load[? "id"]==global.client) {
			socket_msg_read(async_load[? "buffer"], async_load[? "size"]);
		}
		break;
	default:
}