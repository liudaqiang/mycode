package com.lq.mycode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//这是一次测试的提交111
@Controller
public class DemoController {
	@RequestMapping("/demo")
	public String demo(){
		return "demo";
	}
}
