// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function available_socket(){
	if(global.client != undefined)
		return global.client;
	else if(instance_exists(objClient))
		return objClient.client_sock;
	else
		return -1;
}