// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rsa_generate_key(_bit) {
	if(available_socket()>=0) {
		chat_msg("System: [Error] 未断开连接，无法更新RSA密钥。");
		return;
	}
	var _exedir = working_directory + "openssl_x86\\bin\\openssl.exe";
	var _output = working_directory + "key.pem";
	var _puboutput = working_directory + "pub.pem";
	execute_shell("\""+_exedir+"\" genrsa -out \""+_output+"\" "+string(_bit), true);
	execute_shell("\""+_exedir+"\" rsa -in \""+_output+"\" -pubout -out \""+ _puboutput + "\"", true);
	if(file_exists(_output) && file_exists(_puboutput))
		chat_msg("System: RSA 密钥已生成。");
	else
		chat_msg("System: RSA 密钥生成失败。");
}