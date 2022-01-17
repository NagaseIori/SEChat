/// @description Insert description here
// You can write your code in this editor

in_chat = false;
sound_index = -1;
sound_name = "";
for (var i=0; i<global.fmod_numbins; i++)
{
    avgBin[i] = 1;
}
bar_height = 100;
sep = objChat.sep;
surf = surface_create(1000, 150);
hue = irandom(255);
hue_shift = 0;
rainbow = false;
