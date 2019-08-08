package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.QuestionPageDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionMapper questionMapper;
	
	//1. 문의 등록
	@Override
	public void insertQuestion(QuestionRequestDTO dto) {
		questionMapper.insertQuestion(dto);
	}

	//2-1. 문의 조회
	@Override
	public ArrayList<QuestionResponseDTO> getQuestionList(Long user_id) {
		ArrayList list = questionMapper.getQuestionList(user_id);
		return list;
	}

	//2-2. 문의조회+페이징
	@Override
	public QuestionPageDTO getQuestionListPaging(Criteria cri){
		return new QuestionPageDTO(
				questionMapper.getQuestionCnt(cri.getUser_id()),
				questionMapper.getQuestionListWithPaging(cri));
	}
	
	//3. 문의 삭제
	@Override
	public void deleteQuestion(Long id) {
		
		questionMapper.deleteQuestion(id);
	}

	//4. 사용자의 삭제 안된 글 갯수 확인
	@Override
	public int getUndeleted(Long user_id) {
		int undeleted = questionMapper.getUndeleted(user_id);
		return undeleted;
	}

}
