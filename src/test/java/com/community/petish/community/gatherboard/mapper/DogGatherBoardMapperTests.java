package com.community.petish.community.gatherboard.mapper;

import java.text.ParseException;
import java.util.List;

import com.community.petish.community.dog.gatherboard.mapper.DogGatherMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.dog.gatherboard.dto.request.DogGatherPostDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class DogGatherBoardMapperTests {
	
	@Autowired
  DogGatherMapper mapper;
	
	@Test
	public void testInsert() throws ParseException {
		DogGatherPostVO post = new DogGatherPostVO();
		String now = "2009/03/20 10:20"; // 형식을 지켜야 함
		
	
		StringBuffer sb = new StringBuffer();
		sb.append(now);
		sb.append(":00");
		sb.replace(4, 5, "-");
		sb.replace(7, 8, "-");

		log.info("sb.tostring======"+sb.toString());

		java.sql.Timestamp t = java.sql.Timestamp.valueOf(sb.toString());
		
		log.info("sb.tostring============"+sb.toString());
		log.info("time===================="+t);
		post.setTITLE("test");
		post.setCONTENT("test");
		post.setVIEW_COUNT(1);
		post.setPEOPLE_COUNT(2);
		post.setGATHERING_ADDRESS("서울");
		post.setGATHERING_DATE(t);
		post.setDELETED(0);
		post.setUSER_ID(mapper.getUserID("yeji"));
		post.setSPECIES_ID(mapper.getDogSpeciesID("말티즈"));
		post.setREGION_ID(mapper.getRegionID("서울"));
		
		mapper.insertDogGatherPost(post);
		
		log.info("post_gathring_Date======="+post.getGATHERING_DATE());
	}
	
	@Test
	public void testgetUserID() {
		DogGatherPostDTO dogGatherPostDTO = new DogGatherPostDTO();
		String USERNAME = "yeji";
		log.info("dto="+dogGatherPostDTO.toString()+"-----------------------------------");
		Long userID = mapper.getUserID(USERNAME);
		
		log.info("USER_ID=================="+userID);
	}
	
	@Test
	public void testSpeciesID() {
		DogGatherPostDTO dogGatherPostDTO = new DogGatherPostDTO();
		dogGatherPostDTO.setSPECIES("말티즈");
		log.info("dto="+dogGatherPostDTO.toString()+"-----------------------------------");
		Long speciesID = mapper.getDogSpeciesID(dogGatherPostDTO.getSPECIES());
		
		log.info("SPECIESid================"+speciesID);
	}
	
	@Test
	public void testDogSpecies() {
		Long dogSizeID = 1L;
		List<DogSpeciesVO> dogSpeciesList = mapper.getDogSpeciesList(dogSizeID);
		log.info("DOG_SPECIES_LIST========="+dogSpeciesList.toString());
	}
	
	@Test
	public void testGetDogGatherList() {
		List<DogGatherPostVO> dogGatherPostList = mapper.getDogGatherList();
		log.info("getDogGatherListTest====="+dogGatherPostList);
	}
	
	@Test
	public void testGetDogGatherPost() {
		DogGatherPostVO dogGatherPost = mapper.getDogGatherPost(1L);
		log.info("getDogGatherPost========="+dogGatherPost);
	}
	
	@Test
	public void testGetDogSpeciesName() {
		String dogSpecies = mapper.getDogSpecies(1L);
		log.info("getDogSpeciesName======="+dogSpecies);
	}
	
	@Test
	public void testCancelParticipant() {
		Long ID = 27L;
		Long POST_ID = 24L;
		DogGatherParticipantDTO dto = new DogGatherParticipantDTO();
		dto.setID(ID);
		dto.setPOST_ID(POST_ID);
		int res = mapper.cancelParticipant(dto);
		log.info("cancelParticipantRes="+res);
	}
	
	@Test
	public void testGetPostCount() {
		Criteria cri = new Criteria();
		int count = mapper.getDogGatherPostCount(cri);
		log.info("postCount="+count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<DogGatherListDTO> dogGatherDTOList = mapper.getListWithPaging(cri);
		log.info("paging="+dogGatherDTOList);
	}

}
