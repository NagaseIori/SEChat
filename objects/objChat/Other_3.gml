/// @description Insert description here
// You can write your code in this editor

save_settings();

// FMOD Unload
FMODGMS_Chan_StopChannel(global.fmod_channel);
FMODGMS_Chan_RemoveChannel(global.fmod_channel);
FMODGMS_Sys_Close();