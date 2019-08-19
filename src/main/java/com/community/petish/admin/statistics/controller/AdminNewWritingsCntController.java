package com.community.petish.admin.statistics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.admin.statistics.service.AdminNewWritingsCntServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/admin/statistics/")
public class AdminNewWritingsCntController {
	
	@Autowired
	AdminNewWritingsCntServiceImpl adminNewWritingsCntServiceImpl;
	
	@GetMapping(value="/getAllNewWritingsCnt",
			produces = {	
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int getAllNewWritingsCnt(){
				log.info("getAllNewWritingsCnt");
				return adminNewWritingsCntServiceImpl.getAllNewWritings();
			}
	
	@GetMapping(value="/getDogNewWritingsCnt",
			produces = {	
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int getDogNewWritingsCnt(){
				log.info("getDogNewWritingsCnt");
				return adminNewWritingsCntServiceImpl.getDogNewWritings();
			}
	
	@GetMapping(value="/getCatNewWritingsCnt",
			produces = {	
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int getCatNewWritingsCnt(){
				log.info("getCatNewWritingsCnt");
				return adminNewWritingsCntServiceImpl.getCatNewWritings();
			}
}
