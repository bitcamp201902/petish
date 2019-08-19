package com.community.petish.community.admin.statistics;

import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.admin.statistics.mapper.AdminNewWritingsCntMapper;
import com.community.petish.community.gatherboard.service.DogGatherBoardServiceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class AdminNewWritingsCntTests {
	@Setter(onMethod_ =@Autowired)
	private AdminNewWritingsCntMapper adminNewWritingsCntMapper;
	@Test
	public void testMapper() {
		log.info(adminNewWritingsCntMapper);
	}
}
