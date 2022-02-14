
/*
	scrRSA
	Use RSA for part of the encrypted transfer.
*/

///@desc Check RSA component integrity.
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

///@desc Use RSA to decrypt buffer.
function rsa_decrypt(_buff){
	var _exedir = "openssl_x86\\bin\\openssl.exe";
	var _input = working_directory + "temp1";
	var _output = working_directory + "temp_res1";
	var _key = working_directory + "key.pem";
	buffer_save(_buff, add_pref(_input));
	
	if(!file_exists(_key)) {
		show_error("System: PRIVATE KEY NOT FOUND."+string(buffer_get_size(_buff)), true);
		return -1;
	}
	
	execute_program(_exedir, "rsautl -decrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_key) + "-out " +
					add_quote(_output), true);
	
	if(!file_exists(_output)) {
		show_error("System: RSA DECRYPTION FAILED."+string(buffer_get_size(_buff)), true);
		return -1;
	}
	
	var _buf = buffer_load(add_pref(_output));
	file_delete(_input);
	file_delete(_output);
	return _buf;
}

///@desc Use RSA to encrypt buffer.
function rsa_encrypt(_buff, _pubfile){
	var _exedir = "openssl_x86\\bin\\openssl.exe";
	var _input = working_directory + "temp1";
	var _output = working_directory + "temp_res1";
	var _pubkey = working_directory + _pubfile;
	buffer_save(_buff, add_pref(_input));
	
	if(!file_exists(_pubkey)) {
		show_error("System: PUBLIC KEY NOT FOUND.", true);
		return -1;
	}
	
	execute_program(_exedir,"rsautl -encrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_pubkey) + "-pubin -out " +
					add_quote(_output), true);
	
	if(!file_exists(_output)) {
		show_error("System: RSA ENCRYPTION FAILED.", true);
		return -1;
	}
	
	var _buf = buffer_load(add_pref(_output));
	if(buffer_get_size(_buf)==0) {
		show_error("System: RSA ENCRYPTION FAILED. (BUF)", true);
	}
	file_delete(_input);
	file_delete(_output);
	return _buf;
}

///@desc Generate the key for RSA encryption.
function rsa_generate_key(_bit) {
	if(available_socket()>=0) {
		chat_msg("System: [Error] 未断开连接，无法更新RSA密钥。");
		return;
	}
	// var _exedir = working_directory + "openssl_x86\\bin\\openssl.exe";
	var _exedir = "openssl_x86\\bin\\openssl.exe";
	var _output = working_directory + "key.pem";
	var _puboutput = working_directory + "pub.pem";
	execute_program(_exedir, "genrsa -out \""+_output+"\" "+string(_bit), true);
	execute_program(_exedir, "rsa -in \""+_output+"\" -pubout -out \""+ _puboutput + "\"", true);
	if(file_exists(_output) && file_exists(_puboutput))
		chat_msg("System: RSA 密钥已生成。");
	else
		chat_msg("System: RSA 密钥生成失败。");
}