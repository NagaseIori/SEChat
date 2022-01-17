  /// @description Insert description here
// You can write your code in this editor

switch(async_load[? "type"]) {
	case network_type_connect:
		global.client = async_load[? "socket"];
		socket_key(global.client);
		chat_msg("System: 已连接客户端。(IP: "+async_load[? "ip"]+")");
		break;
	case network_type_disconnect:
		global.client = undefined;
		chat_msg("System: 已断开客户端。(IP: "+async_load[? "ip"]+")");
		global.cli_UUID = "";
		break;
	case network_type_data:
		if(async_load[? "id"]==global.client) {
			socket_msg_read(async_load[? "buffer"], async_load[? "size"]);
		}
		break;
	default:
}