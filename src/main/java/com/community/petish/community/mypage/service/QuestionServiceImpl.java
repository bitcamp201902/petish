package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD:src/main/java/com/community/petish/mypage/service/QuestionServiceImpl.java
import com.community.petish.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.QuestionPageDTO;
import com.community.petish.mypage.dto.response.QuestionResponseDTO;
import com.community.petish.mypage.mapper.QuestionMapper;
=======
import com.community.petish.community.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.QuestionPageDTO;
import com.community.petish.community.mypage.dto.response.QuestionResponseDTO;
import com.community.petish.community.mypage.mapper.QuestionMapper;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/service/QuestionServiceImpl.java

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
