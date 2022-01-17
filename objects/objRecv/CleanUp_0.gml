/// @description Insert description here
// You can write your code in this editor

if(buffer>=0)
	bfile_close(buffer);

if(file_exists(program_directory + "Downloads\\" + file_id))
	file_delete(program_directory + "Downloads\\" + file_id);
ds_map_delete(global.m_file_recv, file_id);

audio_play_sound(sndComplete, 1, 0);