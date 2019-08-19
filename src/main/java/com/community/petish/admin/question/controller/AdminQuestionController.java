package com.community.petish.admin.question.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.admin.question.domain.getQuestionListDTO;
import com.community.petish.admin.question.domain.questionResponseDTO;
import com.community.petish.admin.question.service.AdminQuestionService;

@Controller
@RequestMapping("/admin/question")
public class AdminQuestionController {
	@Autowired
	public AdminQuestionService questionService;
	
	@RequestMapping(produces="application/json;charset=UTF-8")
	public ModelAndView question() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/question");
		return mv;
	}
	
	@RequestMapping(value="/list", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getQuestionList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<getQuestionListDTO> questionList = new ArrayList<getQuestionListDTO>();
		questionList = questionService.getQuestionList();
		map.put("questionList", questionList);
		return map;
	}
	
	@RequestMapping(value="/response", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> questionResponse(@RequestBody questionResponseDTO questionRes){
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			Integer res = questionService.questionResponse(questionRes);
			retVal.put("res","OK");
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
}


