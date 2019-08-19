package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.QuestionPageDTO;
import com.community.petish.community.mypage.dto.response.QuestionResponseDTO;

public interface QuestionService {
		void insertQuestion(QuestionRequestDTO dto);

		ArrayList<QuestionResponseDTO> getQuestionList(Long user_id);

		QuestionPageDTO getQuestionListPaging(Criteria cri);

		void deleteQuestion(Long id);

		int getUndeleted(Long user_id);

}
