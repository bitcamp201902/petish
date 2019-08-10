package com.community.petish.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.mypage.dto.request.MessageRequestDTO;
import com.community.petish.mypage.dto.response.MessageResponseDTO;
import com.community.petish.mypage.mapper.MessageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageMessageMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;

	// mapper 주입 test
	@Test
	public void testMapper() {
		log.info(mapper);
	}

//	// create test => 성공
//	@Test
//	public void testInsert() {
//		MessageRequestDTO dto = new MessageRequestDTO();
//		dto.setTitle("message mapper insert test 제목5");
//		dto.setContent("message mapper insert test 내용5");
//		dto.setSender_id(1);
//		dto.setReceiver_id(2);
//		mapper.writeMessage(dto);
//		log.info(dto);
//	}
//
//	// read test => 성공
//	@Test
//	public void testRead() {
//		ArrayList<MessageResponseDTO> list = null;
//		log.info(list);
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("user_id", new Integer(1));
//		list = mapper.getReceivedMessageList(1);
//		log.info(list);
//		list = mapper.getSentMessageList(1);
//		log.info(list);
//	}
	// delete test => 성공
	@Test
	public void testDelete() {
		mapper.deleteMessage(4L);
	}

	@Test
	public void testReadDetail() {
		MessageResponseDTO dto = mapper.receivedMessageDetail(6L);
		log.info(dto);
		log.info(dto.getNickname());
	}
}
