package com.lq.mycode.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.lq.mycode.common.Attribute;
import com.lq.mycode.common.CodeCommon;
import com.lq.mycode.service.AutoCodeService;

import freemarker.template.TemplateException;
@Service
public class AutoCodeServiceImpl implements AutoCodeService{
	
	@Override
	public void getJAVACode(String className, String author, String packageName, String data, ServletContext path) {
		List<Attribute> list = new ArrayList<Attribute>();  
	    list = JSONObject.parseArray(data, Attribute.class);  
	    CodeCommon cc = new CodeCommon(packageName,className,author,path);
	    try {
	    	cc.entityGen(list);
	 	    cc.daoGen(list);
			cc.baseDaoGen();
			cc.serviceGen(list);
			cc.baseServiceGen();
			cc.serviceImplGen(list);
			cc.controllerGen(list);
			cc.mapperGen(list);
			cc.sqlGen(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
