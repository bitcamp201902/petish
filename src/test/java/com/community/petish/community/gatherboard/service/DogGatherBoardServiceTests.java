package com.community.petish.community.gatherboard.service;

import java.util.List;

import com.community.petish.community.dog.gatherboard.service.DogGatherService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class DogGatherBoardServiceTests {

	@Autowired
	private DogGatherService dogGatherService;
	
	
	@Test
	public void testDogSpecies() {
		Long dogSizeID = 1L;
		List<DogSpeciesVO> list = dogGatherService.getDogSpeciesList(dogSizeID);
		log.info("=============================================");
		log.info("DOG_SPECIES_LIST="+list.toString());
		log.info("=============================================");
	}
	
	@Test
	public void testParticipantDTOList() {
		List<DogGatherParticipantDTO> participantDTOList = dogGatherService.getDogGatherParticipantList(100L);
		log.info("ParticipantList="+participantDTOList);
	}
	
	@Test
	public void testListWithPaging() {
		Criteria cri = new Criteria();
		cri.setKeyword("예지");
		List<DogGatherListDTO> dogGatherDTOList = dogGatherService.getListWithPaging(cri);
	}
}
