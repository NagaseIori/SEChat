/// @description Insert description here
// You can write your code in this editor

bfile_close(buff);

buffer_delete(temp_buff);

ds_map_delete(global.m_file, file_id);

audio_play_sound(sndComplete, 1, 0);