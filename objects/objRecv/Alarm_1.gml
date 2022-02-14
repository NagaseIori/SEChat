/// @description Health Pack
var _sock = available_socket();
if(_sock>=0 && h_last_pos == recv_pos) {
	socket_file_prog(_sock, file_id, recv_pos, "resend");
	alarm[1] = health_time*5*room_speed;
	//chat_msg("HEALTH"+string(recv_pos));
}
else {
	alarm[1] = health_time*room_speed;
}
h_last_pos = recv_pos;