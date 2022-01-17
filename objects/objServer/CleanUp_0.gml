/// @description Insert description here
// You can write your code in this editor
if(global.client!=undefined) {
	socket_disconnect(global.client);
	network_destroy(global.client);
	global.client=undefined;
}

network_destroy(server_sock);
chat_msg("System: 服务器已停止运行。");