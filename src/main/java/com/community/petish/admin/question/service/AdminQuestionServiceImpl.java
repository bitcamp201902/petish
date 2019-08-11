package com.community.petish.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.question.domain.getQuestionListDTO;
import com.community.petish.admin.question.domain.questionResponseDTO;
import com.community.petish.admin.question.mapper.AdminQuestionMapper;

@Service("questionService")
public class AdminQuestionServiceImpl implements AdminQuestionService {

	@Autowired
	private AdminQuestionMapper questionMapper;
	
	@Override
	public List<getQuestionListDTO> getQuestionList() {
		List<getQuestionListDTO> questionList =null;
		questionList = questionMapper.getQuestionList();
		return questionList;
	}
	@Override
	public Integer questionResponse(questionResponseDTO questionRes) {
		Integer retVal = questionMapper.questionResponse(questionRes);
		
		return retVal;
	}

}
