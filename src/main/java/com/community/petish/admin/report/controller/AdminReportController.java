package com.community.petish.admin.report.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.dto.response.CommentPageDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.dog.gatherboard.service.DogGatherCommentService;
import com.community.petish.community.dog.gatherboard.service.DogGatherService;

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
	
	@Autowired
	private DogGatherService dogGatherService; 
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;
	
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

		dogMissingReportList = reportService.getBoardReportList(board_id,post_id);
		mv.addObject("dto", dto);
		mv.addObject("commentCount", commentCount);
		mv.addObject("dogMissingReportList", dogMissingReportList);
		mv.setViewName("petish/admin/report/report_missingboard");
		
		return mv;
	}
	
	@RequestMapping(value="/dog/gatherboard/{board_id}/{post_id}", produces="application/json;charset=UTF-8")
	public ModelAndView getDoggatherReport(@PathVariable Long board_id,@PathVariable Long post_id,Criteria cri, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();

		int res = dogGatherService.updateViewCount(post_id);
		System.out.println("UpdateViewCountRes="+res);
		
		ModelAndView result = new ModelAndView();
		
		if(res != 0) {			
			System.out.println("조회수 업데이트 성공!");
			DogGatherPostVO post = dogGatherService.getDogGatherPost(post_id);
			String dogSpecies = dogGatherService.getDogSpecies(post.getSPECIES_ID());
			String writer = dogGatherService.getUserNickName(post.getUSER_ID());
			Long sizeID = dogGatherService.getDogSizeID(post.getSPECIES_ID());
			int commentCnt = dogGatherCommentService.getCommentCnt(post_id);
			int participantCount = dogGatherService.getDogGatherParticipantCount(post_id);
			List<ReportResponseDTO> dogGatherReportList = new ArrayList<ReportResponseDTO>();
			dogGatherReportList = reportService.getBoardReportList(board_id,post_id);
			result.addObject("dogGatherReportList", dogGatherReportList);
			result.addObject("participantCount",participantCount);
			result.addObject("post",post);
			result.addObject("writer",writer);
			result.addObject("dogSpecies",dogSpecies);
			result.addObject("sizeID",sizeID);
			result.addObject("pageMaker", new CommentPageDTO(cri, commentCnt));
			
			List<DogGatherParticipantDTO> participantDTOList = dogGatherService.getDogGatherParticipantList(post_id);

			System.out.println("participantList="+participantDTOList);
			result.addObject("participantList",participantDTOList);
			result.setViewName("petish/admin/report/report_gatherboard");
		}
		else {
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 게시글입니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		return result;
		
	}

}