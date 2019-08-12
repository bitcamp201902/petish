package com.community.petish.admin.dog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.service.DogGatherService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/dog")
@Log4j
public class AdminDogController {

	@Autowired
	private DogGatherService dogGatherService;
	
	@RequestMapping(value="/gatherboard")
	public ModelAndView dogGatherboard() {
		ModelAndView result = new ModelAndView();
		result.setViewName("petish/admin/dog/gatherboard");
		return result;
	}
	
	@RequestMapping(value="/gatherboardList", method= RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String dogGatherBoardList() {
		Criteria cri = new Criteria();
		log.info("admin dog gatherboard pageNum="+cri.getPageNum());
		List<DogGatherListDTO> dogGatherDTOList = dogGatherService.getListWithPaging(cri);
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();		
		try {
			log.info("adminDogGatherDTOList="+dogGatherDTOList);
			str = mapper.writeValueAsString(dogGatherDTOList);
			log.info("str="+str);
		}
		catch(Exception e) {
			log.info("admin dog gather mapper():"+e.getMessage());
		}
		
		return str;
	}
}
