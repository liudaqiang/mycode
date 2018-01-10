package com.lq.mycode.common;

import java.util.HashMap;
import java.util.Map;

/**
 * 特殊实体类型转换
 * @author l.q
 *
 */
public class ParamChangeCommon {
	
	public final static Map<String,String> map = new HashMap<>(); 
	public final static Map<String,String> sqlMap = new HashMap<>();
	static{
		map.put("FINAL_STRING", "String");
		map.put("FINAL_LONG", "Long");
		map.put("FINAL_INTEGER", "Integer");
		map.put("FINAL_BOOLEAN", "Boolean");
		map.put("FINAL_DOUBLE", "Double");
		map.put("FINAL_FLOAT", "Float");
		map.put("FINAL_DATE", "java.util.Date");
		map.put("FINAL_LIST", "java.util.List");
	}
	static{
		sqlMap.put("String", "VARCHAR");
		sqlMap.put("Integer", "INT");
		sqlMap.put("Double", "DOUBLE");
		sqlMap.put("Date", "DATE");
		sqlMap.put("Float", "FLOAT");
		sqlMap.put("Boolean", "BOOLEAN");
	}
}
