package com.jsp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller2 {

	@RequestMapping("/firstjsp")
	public String hello1() {
		return"secondpage";
	}
	@RequestMapping("/process")
	public String hello2() {
		return"thirdpage";
	}
}
