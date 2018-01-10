package com.lq.mycode.service;

import javax.servlet.ServletContext;

public interface AutoCodeService {
	public void getJAVACode(String className,String author,String packageName,String data,ServletContext path);
}
