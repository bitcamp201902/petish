package com.community.petish.community.mypet.post.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	@GetMapping
	public String mypetList(String keyword, Model model) {
		log.info("keyword : " + keyword);
		model.addAttribute("keyword", keyword);
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
