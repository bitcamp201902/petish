package com.community.petish.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.mypage.mapper.MypageUserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {

	@Setter(onMethod_ =@Autowired)
	private MypageUserMapper mapper;
 
	//mapper 주입 test
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testUpdate() {
		UserModifyRequestDTO_Mypage dto = new UserModifyRequestDTO_Mypage();
		dto.setAddress("아놔");
		dto.setId(1L);
		dto.setNickname("땡이누나");
		dto.setPassword("1234567");
		mapper.modifyUserInfo(dto);
		log.info(dto);
	}
}
