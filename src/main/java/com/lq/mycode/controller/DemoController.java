package com.lq.mycode.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
//这是一次测试的提交
@RestController
public class DemoController {
	@RequestMapping("/demo")
	public String demo(){
		return "aa";
	}
}
