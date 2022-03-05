// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function export_history(){
	var _cur = date_current_datetime();
	var _sug_file = "Chat ";
	_sug_file+=string(date_get_year(_cur))+"-";
	_sug_file+=string(date_get_month(_cur))+"-";
	_sug_file+=string(date_get_day(_cur))+"-";
	_sug_file+=string(date_get_hour(_cur))+"-";
	_sug_file+=string(date_get_minute(_cur))+"-";
	_sug_file+=string(date_get_second(_cur))+".txt";
	
	var _filename = get_save_filename_ext("文本文档|*.txt", _sug_file, program_directory, "导出聊天历史至");
	if(_filename == "") return;
	var _file = file_text_open_write("\\\\?\\"+_filename);
	if(_file<0) {
		chat_msg("创建文件失败。请更改文件路径重试。", "System");
		return;
	}
	
	var i = 0, len = objChat.tot_line;
	while(i<len) {
		switch(objChat.type_line[i]) {
			case "text":
				file_text_write_string(_file, objChat.msg_line[i]);
				file_text_writeln(_file);
				i++;
				break;
			case "image":
				file_text_write_string(_file, objChat.msg_line[i]+" [image]");
				file_text_writeln(_file);
				i+=objChat.num_line[i]+1;
				break;
			case "file":
				file_text_write_string(_file, objChat.msg_line[i]+" [file] "+objChat.file_line[i]);
				file_text_writeln(_file);
				i+=2;
				break;
			case "music":
				file_text_write_string(_file, objChat.msg_line[i]+" [music]");
				file_text_writeln(_file);
				i+=objChat.num_line[i];
				break;
			default:
				break;
		}
	}
	file_text_close(_file);
	
	chat_msg("聊天历史已导出至 " + _filename, "System");
}