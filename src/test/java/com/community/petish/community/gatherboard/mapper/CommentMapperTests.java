package com.community.petish.community.gatherboard.mapper;

import java.util.List;

import com.community.petish.community.dog.gatherboard.mapper.DogGatherCommentMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherCommentDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class CommentMapperTests {
	
	@Autowired
  DogGatherCommentMapper mapper;
	
	@Test
	public void testInsert() throws Exception {
		DogGatherCommentVO commentVO = new DogGatherCommentVO();
		commentVO.setCONTENT("testComment");
		commentVO.setPOST_ID(19L);
		commentVO.setUSER_ID(1L);
		
		log.info("CommentVO="+commentVO.toString());
	}
	
	@Test
	public void testGet() throws Exception {
		mapper.getComment(1L);
	}
	
	@Test
	public void testGetList() throws Exception {
		Criteria cri = new Criteria();
		List<DogGatherCommentDTO> commentVO = mapper.getCommentList(cri, 98L);
	}
}
