package com.community.petish.admin.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.report.dto.ReportResponseDTO;
import com.community.petish.community.report.service.ReportService;

@Controller
@RequestMapping("/admin/report")
public class AdminReportController {
	
	@Autowired
	public ReportService reportService;
	
	@RequestMapping(produces="application/json;charset=UTF-8")
	public ModelAndView report() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/report");
		return mv;
	}
	
	@RequestMapping(value="/list", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getReportList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReportResponseDTO> reportList = new ArrayList<ReportResponseDTO>();
		reportList = reportService.getReportList();
		map.put("reportList", reportList);
		return map;
	}
}
