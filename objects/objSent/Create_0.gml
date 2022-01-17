/// @description Insert description here
// You can write your code in this editor

file_name = "";
buff = undefined;
buff_siz = 0;
pos = 0;
sent_pos = 0;
file_id = 0;
status = 0; // 0 not running  1 running 2 done
tbuff_siz = 20*1024; // temp_buff size
times = 16;
sock = undefined; 
last_sent_pos = 0;
last_time = current_time/1000;
est_spd = 0;

speed_time = 0.2 // (s)

temp_buff = buffer_create(tbuff_siz, buffer_fixed, 1);

alarm[0] = speed_time*room_speed;