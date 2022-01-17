/// @description Draw on Surface
// You can write your code in this editor

/* Update Spectrum */
FMODGMS_Sys_Update();
//FMODGMS_FFT_Normalize();
var i;
for (i=0; i<global.fmod_numbins; i++) {
    avgBin[i] = clamp(FMODGMS_FFT_Get_BinValue(i)*2.5,0,1);
	if(global.fmod_sound_index!=sound_index || !global.fmod_is_playing)
		avgBin[i] = 0;
} 
hue_shift = 0;
hue = (hue+1) mod 256;

/* Surface Check */
if(!surface_exists(surf))
	surf = surface_create(1000, 150);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_set_color(global.fr_col);
draw_set_halign(fa_left)
draw_set_valign(fa_center);
draw_set_font(fZpix14);
draw_set_alpha(1.0);

// Sound Name Draw
var _ny = sep/2;
if(rainbow) shift_hue(16);
draw_text(0, _ny, sound_name);

// Spectrum Draw
_ny+=sep/2+bar_height;
if(rainbow) shift_hue(16);
for (i=0; i<global.fmod_numbins; i++)
    {
        draw_set_alpha(lerp(0.85, 1.0, avgBin[i]));
        draw_rectangle(i*5+1,_ny-avgBin[i]*bar_height,i*5+4,_ny,false);
    }
	
// Seek Bar Draw & Check
_ny+=sep/2;
var len = FMODGMS_Snd_Get_Length(sound_index);
var height = 5;
if(rainbow) shift_hue(16);
draw_set_alpha(0.7);
draw_rectangle(0, _ny-height/2, 300, _ny+height/2, false);
if(mouse_check_button_pressed(mb_left)) {
	if(mouse_inbound(x, y+_ny-height/2, 300, height) && global.fmod_is_playing && global.fmod_sound_index == sound_index) {
		FMODGMS_Chan_Set_Position(global.fmod_channel, len*(mouse_x-x)/300);
	}
} 
if(global.fmod_sound_index == sound_index) {
	draw_set_alpha(1.0);
	draw_rectangle(0, _ny-height/2,(FMODGMS_Chan_Get_Position(global.fmod_channel) / len) * 300, _ny+height/2,false);
}
if(debug_mode)
	draw_text(300, _ny, global.fmod_is_playing?"YES":"NO");

// Control Button Draw & Check
if(rainbow) shift_hue(16);
if(global.fmod_is_playing && !global.fmod_is_paused && global.fmod_sound_index == sound_index) {
	draw_sprite_ext(sprMusicControlPause, 0, 350, _ny, 1, 1, 0, draw_get_color(), 1);
	if(mouse_check_button_pressed(mb_left)) {
		if(mouse_inbound(x+350-12, y+_ny-12, 24, 24)) {
			FMODGMS_Chan_PauseChannel(global.fmod_channel);
			global.fmod_is_paused = 1;
		}
	} 
}
else {
	draw_sprite_ext(sprMusicControlPlay, 0, 350, _ny, 1, 1, 0, draw_get_color(), 1);
	if(mouse_check_button_pressed(mb_left)) {
		if(mouse_inbound(x+350-12, y+_ny-12, 24, 24)) {
			if(global.fmod_is_paused && global.fmod_sound_index == sound_index) {
				FMODGMS_Chan_ResumeChannel(global.fmod_channel);
				global.fmod_is_paused = 0;
			}
			else {
				fmod_stopchan();
				FMODGMS_Snd_PlaySound(sound_index, global.fmod_channel);
				global.fmod_is_playing = 1;
				global.fmod_is_paused = 0;
				global.fmod_sound_index = sound_index;
			}
		}
	} 
	
}

draw_reset();
surface_reset_target();