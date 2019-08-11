package com.community.petish.admin.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/report")
public class AdminReportController {
	@RequestMapping(produces="application/json;charset=UTF-8")
	public ModelAndView report() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/report");
		return mv;
	}
}
