/// @description Insert description here
// You can write your code in this editor

rec_pos = 0;
last_pos = 0;
h_last_pos = 0;
recv_pos = 0;
recv_siz = 0;
file_name = "";
file_id = "";
est_spd = 0;
last_time = current_time/1000
sender_name = "";

buffer = undefined;
no_save = false;

spd_time = 0.2;
health_time = 0.5;
alarm[0] = spd_time*room_speed;
alarm[1] = health_time*room_speed;