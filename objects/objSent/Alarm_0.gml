/// @description Insert description here
// You can write your code in this editor

est_spd = max(0, sent_pos-last_sent_pos)/(current_time/1000-last_time);
last_time = current_time/1000;

last_sent_pos = sent_pos;

alarm[0] = speed_time*room_speed;