package com.community.petish.community.dog.missingboard.controller;

import java.util.HashMap;
import java.util.Map;

import com.community.petish.community.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.community.dog.missingboard.service.DogLostPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

//@RequestMapping("/dog/missingboard/*")
@RestController
@Slf4j
public class DogMissingboardRestController {
	
	@Autowired
	private DogLostPostService service;
	
	//게시글 등록	
	@RequestMapping(value="/POST", method = RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_UTF8_VALUE, produces="application/json;charet=UTF-8")
	@ResponseBody
	public Map<String, Object> register(@RequestBody DogLostPostRequestWriteDTO dto){
		
		log.info("글 작성 요청");
		
		log.info("===============================");
		log.info("register : " + dto);		
		
		if(dto.getAttachList() != null) {
			dto.getAttachList().forEach(attach -> log.info(attach.toString()));
		}		
		log.info("===============================");		
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장		
		//log.info("dto : " + dto.getDog_name());
		//log.info(dto.getDog_gender());		
		try {
			service.register(dto);
			retVal.put("res", "OK");

		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			e.printStackTrace();
		}		
		return retVal;
	}
	
	//게시글 수정
	@RequestMapping(value="/PUT", method = RequestMethod.PUT,  produces="application/json;charet=UTF-8")
	@ResponseBody
	public Map<String, Object> modify(@RequestBody DogLostPostRequestWriteDTO dto){
		
		log.info("글 수정 요청");
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		
		log.info("아이디!!! : " + dto.getId());
		log.info("수정 dog_SPECIES : " + dto.getSpecies_id());
		
		try {
			service.modify(dto);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			e.printStackTrace();
		}		
		
		return retVal;
	}
	
	
}
