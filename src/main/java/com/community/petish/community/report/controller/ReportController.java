package com.community.petish.community.report.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.community.report.domain.ReportVO;
import com.community.petish.community.report.dto.ReportRequestDTO;
import com.community.petish.community.report.dto.ReportResponseDTO;
import com.community.petish.community.report.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/report/*")
@RestController
@Slf4j

public class ReportController {
	
	@Autowired
  ReportService service;
	
	//신고 등록
	@RequestMapping(value="/new",
			method=RequestMethod.POST,
			produces="application/json;charet=UTF-8")
	@ResponseBody
	public Map<String, Object> insertReport(ReportRequestDTO dto){
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장		
		
		log.info("Report : " + dto);
		System.out.println(dto);
		
		try {
			int res = service.register(dto);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			e.printStackTrace();
		}		
		return retVal;
	}
	
	//신고 삭제
	@PutMapping(value="/{id}")
	public ResponseEntity<ReportVO> deleteReport(@PathVariable Long id){
		if(service.delete(id) == 1)
			return new ResponseEntity<ReportVO>(HttpStatus.OK);
		else	
			return new ResponseEntity<ReportVO>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//신고 리스트
	@GetMapping
	public Map<String, Object> getReportList(){
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		
		try {
			service.getReportList();
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			e.printStackTrace();
		}		
		return retVal;
	}
	
	//신고 조회
	@GetMapping(value="/{id}")
	public Map<String, Object> getReport(@PathVariable Long id){
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		
		try {
			ReportResponseDTO responseDTO = service.getReport(id);
			log.info("responseDTO" + responseDTO);
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