// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fmod_stopchan(){
	FMODGMS_Chan_StopChannel(global.fmod_channel);
	global.fmod_is_paused = 0;
	global.fmod_is_playing = 0;
	global.fmod_sound_index = -1;
}