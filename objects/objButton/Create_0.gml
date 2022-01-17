/// @description Insert description here
// You can write your code in this editor

cursor = "";

alpha = 0.3;
n_alpha = 0.3;

// create surface
width*=1366;
surf = surface_create(width, height);

if(ds_map_exists(global.m_bar, bar_id))
	show_error("Two same bar ids detected.", false);
global.m_bar [? bar_id] = id;