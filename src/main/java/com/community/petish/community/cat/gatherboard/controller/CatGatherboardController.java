package com.community.petish.community.cat.gatherboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/gatherboard/*")
public class CatGatherboardController {

	@RequestMapping("/list")
	public String dogGatherboardList() {
		return "petish/cat/gatherboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogGatherboardDetail() {
		return "petish/cat/gatherboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogGatherboardWriteForm() {
		return "petish/cat/gatherboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogGatherboardModifyForm() {
		return "petish/cat/gatherboard/modify_form";
	}
	
}
