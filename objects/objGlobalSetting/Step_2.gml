
var n_barid, foc=global.Focusing;

if(!foc && lastfoc) save_settings();
lastfoc = foc;

// Room_speed
n_barid = global.m_bar[? "FPS"];
if(instance_exists(n_barid) && foc != n_barid)
	room_speed = int64(n_barid.contains);

// User_name
n_barid = global.m_bar[? "Name"];
if(instance_exists(n_barid) && foc != n_barid) {
	if(n_barid.contains == "System")
		n_barid.contains = "metsyS";
	global.user_name = n_barid.contains;
}

// Private_Key
n_barid = global.m_bar[? "Server Key"];
if(instance_exists(n_barid) && foc != n_barid)
	global.pri_key = n_barid.contains;

// Server Address
n_barid = global.m_bar[? "Server Address"];
if(instance_exists(n_barid) && foc != n_barid)
	global.serv_addr = n_barid.contains;

// Server Port
n_barid = global.m_bar[? "Server Port"];
if(instance_exists(n_barid) && foc != n_barid)
	global.serv_port = n_barid.contains;

// Wheel Speed
n_barid = global.m_bar[? "Wheel Speed"];
if(instance_exists(n_barid) && foc != n_barid)
	global.wheel_speed = int64(n_barid.contains);

// Background Blur Radius
n_barid = global.m_bar[? "Background Blur Amount"];
if(instance_exists(n_barid) && foc != n_barid)
	global.bg_radius = real(n_barid.contains);

// Image Size
n_barid = global.m_bar[? "Image Size"];
if(instance_exists(n_barid) && foc != n_barid)
	global.img_lines = int64(n_barid.contains);
	

// Local Port
n_barid = global.m_bar[? "Local Port"];
if(instance_exists(n_barid) && foc != n_barid && global.local_port != int64(n_barid.contains)) {
	chat_msg("本地服务器端口已修改。", "System");
	global.local_port = int64(n_barid.contains);
	if(instance_exists(objServer)) {
		instance_destroy(objServer);
		instance_create_depth(0, 0, 0, objServer);
	}
	
}

if(global.fmod_is_playing && !FMODGMS_Chan_Get_Volume(global.fmod_channel)) {
	global.fmod_is_playing = 0;
}