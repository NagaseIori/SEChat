/// @description 

ip = global.m_bar[? "Server Address"].contains;
port = global.m_bar[? "Server Port"].contains;

client_sock = undefined;

if(instance_exists(objServer)) {
	chat_msg("System: 服务器运行过程中无法与其他服务器建立连接。");
	instance_destroy();
	return;
}
if(ip == "" || port == "") {
	chat_msg("System: 请将地址，端口填写完整后连接服务器。");
	instance_destroy();
	
}
else {
	port = int64(port);
	ip = network_resolve(ip);

	client_sock = network_create_socket(network_socket_tcp);
	if(network_connect(client_sock, ip, port)<0) {
		chat_msg("System: [c_red]服务器连接超时。请检查地址，端口，防火墙设置后重试。[/c]");
		instance_destroy();
	}
	else {
		chat_msg("System: [c_green]已连接服务器。(IP: "+ip+")[/c]");
		socket_key(client_sock);
	}
}