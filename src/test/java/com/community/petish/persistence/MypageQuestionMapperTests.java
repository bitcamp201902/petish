package com.community.petish.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.mypage.dto.response.QuestionResponseDTO;
import com.community.petish.mypage.mapper.QuestionMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageQuestionMapperTests {
	@Setter(onMethod_ =@Autowired)
	private QuestionMapper mapper;
 
	//mapper 주입 test
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	//create test => 성공
	@Test
	public void testInsert() {
		QuestionRequestDTO dto = new QuestionRequestDTO();
		dto.setTitle("mapper insert test를 해봅시다");
		dto.setContent("과연 성공할 수 있을까요?");
		dto.setUser_id(1L);
		dto.setCategory_id(1);
		mapper.insertQuestion(dto);
		log.info(dto);
	}
	
	//read test => 성공
	@Test
	public void testRead() {
		ArrayList<QuestionResponseDTO> list= null; 
		log.info(list);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_id", new Integer(1));
		list = mapper.getQuestionList(1L);
		log.info(list);
	}
	
	//delete test => 성공
	@Test
	public void testDelete() {
		mapper.deleteQuestion(13L);
	}
}
