package com.community.petish.community.mypage.mapper;

import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.community.mypage.dto.response.QuestionResponseDTO;

import java.util.ArrayList;

public interface QuestionMapper {
	//1. 문의 등록
  void insertQuestion(QuestionRequestDTO dto);
	//2-1. 문의 조회
	ArrayList<QuestionResponseDTO> getQuestionList(Long num);
	//2-2. 문의조회+페이징
	ArrayList<QuestionResponseDTO> getQuestionListWithPaging(Criteria cri);
	//3. 문의 삭제
	void deleteQuestion(Long num);
	//4. 사용자의 삭제 안된 글 갯수 확인
	int getUndeleted(Long user_id);
	//전체 문의 갯수 가져오기
	int getQuestionCnt(Long user_id);

}
