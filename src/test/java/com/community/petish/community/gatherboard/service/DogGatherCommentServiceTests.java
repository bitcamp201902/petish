package com.community.petish.community.gatherboard.service;

import java.util.List;

import com.community.petish.community.dog.gatherboard.service.DogGatherCommentService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherCommentDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class DogGatherCommentServiceTests {
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;
	
	@Test
	public void testDogGatherDTOList() {
		Criteria cri = new Criteria();
		Long postID = 100L;
		List<DogGatherCommentDTO> list = dogGatherCommentService.getCommentList(cri, postID);
	}
}
