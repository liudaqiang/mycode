package com.lq.mycode.common;

import java.util.ArrayList;

public class LQStringUtils {
	/**
	 * 第一个字符转大写
	 * @param name
	 * @return
	 */
	public static String captureName(String name) {
		char[] cs = name.toCharArray();
		cs[0] -= 32;
		if(String.valueOf(cs).toLowerCase().equals(name.toLowerCase())){
			return String.valueOf(cs);
		}else{
			return name;
		}
	}
	/**
	 * 第一个字符转小写
	 * @param str
	 * @return
	 */
	public static String firstTolowerCase(String str){
		char[] cs = str.toCharArray();
		cs[0] += 32;
		if(String.valueOf(cs).toLowerCase().equals(str.toLowerCase())){
			return String.valueOf(cs);
		}else{
			return str;
		}
	}
	/**
	 * 将字符串根据大写分割 生成数据库用字符串  如a_b
	 * @param str
	 * @return
	 */
    public static String strToSqlStr(String str) {
        ArrayList<String> rs = new ArrayList<String>();
        int index = 0;
        int len = str.length();
        for (int i = 1; i < len; i++) {
            if (Character.isUpperCase(str.charAt(i))) {
                rs.add(str.substring(index, i));
                index = i;
            }
        }
        String retStr = "";
        rs.add(str.substring(index, len).toLowerCase());
        for(int i=0;i<rs.size();i++){
        	if(i == 0){
        		retStr += rs.get(i);
        	}else{
        		retStr += "_"+rs.get(i);
        	}
        }
        return retStr;
    }
}
