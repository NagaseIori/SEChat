
server_sock = -1;

if(instance_exists(objClient)) {
	chat_msg("System: [c_red]与其它服务器建立连接过程中无法启动服务器。[/c]");
	instance_destroy();
	return;
}

server_sock = network_create_server(network_socket_tcp, global.local_port, 1);

if(server_sock < 0) {
	chat_msg("System: [c_red]端口已被占用。请尝试修改本地端口。[/c]");
	instance_destroy();
}
else {
	chat_msg("System: [c_green]服务器启动成功。[/c](Port: "+string(global.local_port)+")");
}