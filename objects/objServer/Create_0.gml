/// @description Insert description here
// You can write your code in this editor

server_sock = -1;

if(instance_exists(objClient)) {
	chat_msg("System: 与其它服务器建立连接过程中无法启动服务器。");
	instance_destroy();
	return;
}

server_sock = network_create_server(network_socket_tcp, global.local_port, 1);

if(server_sock < 0) {
	chat_msg("System: 端口已被占用。请尝试修改本地端口。");
	instance_destroy();
}
else {
	chat_msg("System: 服务器启动成功。(Port: "+string(global.local_port)+")");
}