package com.community.petish.admin.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.community.dog.missingboard.service.DogLostCommentService;
import com.community.petish.community.dog.missingboard.service.DogLostPostService;
import com.community.petish.community.report.dto.ReportResponseDTO;
import com.community.petish.community.report.service.ReportService;

@Controller
@RequestMapping("/admin/report")
public class AdminReportController {
	
	@Autowired
	public ReportService reportService;
	
	@Autowired
	private DogLostPostService dogLostPostService;
	@Autowired
	private DogLostCommentService dogLostCommentService;
	
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
	
	@RequestMapping(value="/dog/missingboard/{board_id}/{post_id}", produces="application/json;charset=UTF-8")
	public ModelAndView getDogmissingReport(@PathVariable Long board_id,@PathVariable Long post_id){
		ModelAndView mv = new ModelAndView();
		//댓글 수 조회
		int commentCount = dogLostCommentService.getCommentCnt(post_id);		
		//조회 수 갱신
		dogLostPostService.updateViewCount(post_id);
		//조회
		DogLostPostResponseDetailDTO dto = dogLostPostService.getPostDetail(post_id);
		List<ReportResponseDTO> dogMissingReportList = new ArrayList<ReportResponseDTO>();

		dogMissingReportList = reportService.getDogMissingReportList(board_id,post_id);
		mv.addObject("dto", dto);
		mv.addObject("commentCount", commentCount);
		mv.addObject("dogMissingReportList", dogMissingReportList);
		mv.setViewName("petish/admin/dog/missingboard");
		
		return mv;
	}
}