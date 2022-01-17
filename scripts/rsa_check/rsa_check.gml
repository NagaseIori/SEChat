// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rsa_check() {
	var _exedir = working_directory + "openssl_x86\\bin\\openssl.exe";
	
	if(!file_exists(_exedir))
		show_error("RSA 加密组件受损。请检查文件完整性。", true);
	
	var _output = working_directory + "key.pem";
	var _puboutput = working_directory + "pub.pem";
	if(!file_exists(_output) || !file_exists(_puboutput))
		return 0;
	return 1;
}