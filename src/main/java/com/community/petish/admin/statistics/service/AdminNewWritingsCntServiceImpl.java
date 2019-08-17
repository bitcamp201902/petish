package com.community.petish.admin.statistics.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.statistics.mapper.AdminNewWritingsCntMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class AdminNewWritingsCntServiceImpl implements AdminNewWritingsCntService{

	@Autowired
	AdminNewWritingsCntMapper adminNewWritingsCntMapper;
	@Override
	public int getAllNewWritings() {
		return adminNewWritingsCntMapper.getAllNewWritings();
	}
	
	@Override
	public int getDogNewWritings() {
		return adminNewWritingsCntMapper.getDogNewWritings();
	}
	
	@Override
	public int getCatNewWritings() {
		return adminNewWritingsCntMapper.getCatNewWritings();
	}
	

}
