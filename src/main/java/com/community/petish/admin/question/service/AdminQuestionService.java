package com.community.petish.admin.question.service;

import java.util.List;

import com.community.petish.admin.question.domain.getQuestionListDTO;
import com.community.petish.admin.question.domain.questionResponseDTO;

public interface AdminQuestionService {
	List<getQuestionListDTO> getQuestionList();
	Integer questionResponse(questionResponseDTO questionRes);
}
