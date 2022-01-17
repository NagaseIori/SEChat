/// @description Insert description here
// You can write your code in this editor

if(sound_index == global.fmod_sound_index && global.fmod_is_playing) {
	fmod_stopchan();
}
FMODGMS_Snd_Unload(sound_index);