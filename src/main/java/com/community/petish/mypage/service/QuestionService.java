package com.community.petish.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.QuestionPageDTO;
import com.community.petish.mypage.dto.response.QuestionResponseDTO;


public interface QuestionService {
		//1. 문의 등록
		public void insertQuestion(QuestionRequestDTO dto);
		//2-1. 문의 조회
		public ArrayList<QuestionResponseDTO> getQuestionList(Long user_id);
		//2-2. 문의조회+페이징
		public QuestionPageDTO getQuestionListPaging(Criteria cri);
		//3. 문의 삭제
		public void deleteQuestion(Long id);
		//4. 사용자의 삭제 안된 글 갯수 확인
		public int getUndeleted(Long user_id);

}
