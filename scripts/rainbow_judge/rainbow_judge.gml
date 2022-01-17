// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rainbow_judge(_str){
	if(string_count("NEO", _str)==2 && string_count("SKY", _str)==1 && string_count("MAP", _str)==1)
		return 1;
	if(string_count("虹色", _str)==1 && (string_count("Passions", _str)==1 || string_count("passions", _str)==1))
		return 1;
}