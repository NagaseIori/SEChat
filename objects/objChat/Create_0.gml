/// @description Insert description here
// You can write your code in this editor

tot_line = 0;
msg_line[0] = undefined;
hash_line[0] = undefined;
type_line[0] = undefined;
spr_line[0] = undefined;
num_line[0] = undefined;
file_line[0] = undefined;
sender_line[0] = undefined;

aim_below = 0;
lerp_spd = 0.1;
below = 0;
sep = 20;
img_line = 26;
height = 620
width = room_width

screen_lines = int64(floor((height-14)/(sep)))

cursor = "";
cursor_delay = 0.5 // (s)
alarm[0] = cursor_delay*room_speed;

show_hash = false;

msg_now = "";
max_length = 60;

surf = surface_create(width, height);
mid_div = 100; // division point between sender and msg
mid_div_org = mid_div;
mid_div_aim = mid_div; // adjustable
mid_blk = 10; // blank between sender and msg

// DND INIT
// set the dnd destination window to game window...
// pointer_null is the default for no window at all
file_dnd_set_hwnd(hwnd_main);

// enable file and/or folder drag and drop...
file_dnd_set_enabled(true);

// init dnd file list as empty...
file_dnd_filelist = "";

// allow dnd of format pattern...
// file_dnd_pattern = "*.png;*.jpg;*.jpeg;*.gif"; // image files
// file_dnd_pattern = "*.app;*.plugin;*.bundle";  // bundle dirs
file_dnd_pattern = "*.*"; // all files and dirs

// allow dnd of regular files?
file_dnd_allowfiles = true;

// allow dnd of directories?
file_dnd_allowdirs = false;

// allow dnd of multiple items?
file_dnd_allowmulti = true;