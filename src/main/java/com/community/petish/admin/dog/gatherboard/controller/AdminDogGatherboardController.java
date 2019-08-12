package com.community.petish.admin.dog.gatherboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.admin.dog.gatherboard.dto.response.AdminDogGatherboardListDTO;
import com.community.petish.admin.dog.gatherboard.dto.response.AdminPostPageDTO;
import com.community.petish.admin.dog.gatherboard.service.AdminDogGatherboardService;
import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.service.DogGatherService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/dog/gatherboard")
@Log4j
public class AdminDogGatherboardController {

	@Autowired
	private AdminDogGatherboardService adminDogGatherboardService;
	
	@Autowired
	private DogGatherService dogGatherService;
	
	@RequestMapping(value="")
	public ModelAndView dogGatherboard(Criteria cri) {
		ModelAndView result = new ModelAndView();
		
		int postCount = adminDogGatherboardService.getDogGatherboardPostCount();
		result.addObject("pageMaker", new AdminPostPageDTO(cri, postCount));
		result.setViewName("petish/admin/dog/gatherboard");
		return result;
	}
	
	@RequestMapping(value="/gatherboardList", method= RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String dogGatherBoardList(Criteria cri) {
		log.info("admin dog gatherboard pageNum="+cri.getPageNum());
		List<AdminDogGatherboardListDTO> dogGatherDTOList = adminDogGatherboardService.getListWithPaging(cri);
		
		for(int i=0; i<dogGatherDTOList.size(); i++) {
			AdminDogGatherboardListDTO dogGatherListDTO = dogGatherDTOList.get(i);
			int dogGatherPostCount = adminDogGatherboardService.getDogGatherboardPostCount();
			dogGatherListDTO.setCOUNT(dogGatherPostCount);
		}
		
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
	
	//게시물 복구
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
	    value = "restorePost/{id}",
	    consumes = "application/json",
	    produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> restoreComment(@PathVariable("id") Long postID) {

	  System.out.println("restore="+postID);

	  return adminDogGatherboardService.restoreDogGatherPost(postID) == 1
	      ? new ResponseEntity<>("success", HttpStatus.OK)
	      : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	//게시물 삭제
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
	    value = "removePost/{id}",
	    consumes = "application/json",
	    produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeComment(@PathVariable("id") Long postID) {

	  System.out.println("remove="+postID);

	  return dogGatherService.deleteDogGatherPost(postID) == 1
	      ? new ResponseEntity<>("success", HttpStatus.OK)
	      : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
}