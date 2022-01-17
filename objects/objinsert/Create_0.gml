/// @description Insert description here
// You can write your code in this editor

global.Focusing = 0;

cursor = "";

alpha = 0.3;
n_alpha = 0.3;

timing = 0; // used for caculate steps

cursor_delay = 0.5 // (s)

alarm[1]= cursor_delay*room_speed; 

width *= 1366;

if(!is_string(contains))
	contains = string(contains);

// create surface
surf = surface_create(width, height);

if(ds_map_exists(global.m_bar, bar_id))
	show_error("Two same bar ids detected.", false);
global.m_bar [? bar_id] = id;