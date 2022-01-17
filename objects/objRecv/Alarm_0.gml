/// @description Insert description here
// You can write your code in this editor

est_spd = max(0, recv_pos-last_pos)/(current_time/1000-last_time);
last_time = current_time/1000;
last_pos = recv_pos;

alarm[0] = spd_time*room_speed;
