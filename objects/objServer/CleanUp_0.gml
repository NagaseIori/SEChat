if(global.client!=undefined) {
	socket_disconnect(global.client);
	network_destroy(global.client);
	global.client=undefined;
}

network_destroy(server_sock);
chat_msg("服务器已停止运行。", "System");