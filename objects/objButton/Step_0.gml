/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(surf)) {
	surf = surface_create(width, height);
} 
if(abs(n_alpha-alpha)>0.6*6/room_speed) n_alpha += sign(alpha-n_alpha)*0.6*6/room_speed;
