package com.lq.mycode.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lq.mycode.common.LQStringUtils;
import com.lq.mycode.service.AutoCodeService;


@RequestMapping("/autoCode")
@Controller
public class AutoCodeController {
	@Autowired
	private AutoCodeService autoCodeService;
	
	@RequestMapping("getCodeAttr")
	public String getCodeAttr(){
		return "index";
	}

	@RequestMapping("getJAVACode")
	@ResponseBody
	public void getJAVACode(HttpServletRequest request){
		String className = LQStringUtils.firstTolowerCase(request.getParameter("className"));
		String author = request.getParameter("author");
		String packageName = request.getParameter("packageName");
		String data = request.getParameter("data");
		autoCodeService.getJAVACode(className, author, packageName, data, request.getSession().getServletContext());
	}
}
