package com.community.petish.admin.question.mapper;

import java.util.List;

import com.community.petish.admin.question.domain.getQuestionListDTO;
import com.community.petish.admin.question.domain.questionResponseDTO;

public interface AdminQuestionMapper {
	Integer questionResponse(questionResponseDTO questionRes);
	List<getQuestionListDTO> getQuestionList();
}
