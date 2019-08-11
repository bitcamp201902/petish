package com.community.petish.community.mypet.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	@GetMapping
	public String mypetList() {
		return "petish/community/mypet/index";
	}
	
	@RequestMapping("/write")
	public String writeForm() {
		return "petish/community/mypet/writeForm";
	}
	
	@RequestMapping("/modify")
	public String modifyForm() {
		return "petish/community/mypet/modifyForm";
	}
	
}
