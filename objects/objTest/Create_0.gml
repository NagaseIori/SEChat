/// @description Insert description here
// You can write your code in this editor

directory_create(program_directory + "下载");
var _file = bfile_open(program_directory + "下载\\SHIT");
show_debug_message(program_directory + " " + string(_file));
if(_file<0)
	show_error(string(_file), 1);
bfile_write_byte(_file, 20);
var _buf = buffer_create(1, buffer_fixed, 1);
bfile_close(_file);
bfile_open_read(program_directory + "下载\\SHIT");
if(_file<0)
	show_error(string(_file), 1);
bfile_read(_file, 1, buffer_get_address(_buf));
bfile_close(_file);
show_debug_message(buffer_read(_buf, buffer_u8));