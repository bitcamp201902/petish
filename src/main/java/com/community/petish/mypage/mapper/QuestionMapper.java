package com.community.petish.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.QuestionResponseDTO;

public interface QuestionMapper {
	//1. 문의 등록
	public void insertQuestion(QuestionRequestDTO dto);
	//2-1. 문의 조회
	public ArrayList<QuestionResponseDTO> getQuestionList(Long num);
	//2-2. 문의조회+페이징
	public ArrayList<QuestionResponseDTO> getQuestionListWithPaging(Criteria cri);
	//3. 문의 삭제
	public void deleteQuestion(Long num);
	//4. 사용자의 삭제 안된 글 갯수 확인
	public int getUndeleted(Long user_id);
	//전체 문의 갯수 가져오기
	public int getQuestionCnt(Long user_id);

}
