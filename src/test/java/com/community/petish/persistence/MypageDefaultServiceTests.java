package com.community.petish.persistence;

import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

<<<<<<< HEAD
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.DefaultServiceImpl;
=======
import com.community.petish.community.mypage.service.DefaultServiceImpl;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageDefaultServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private DefaultServiceImpl service;

	// service 주입 test
	@Test
	public void testMapper() {
		log.info(service);
		assertNull(service);
	}
	
//	@Test
//	public void testGetList() {
//		service.getMyWritingsWithPaging(new Criteria(2,10,1)).forEach(list -> log.info(list));
//	}

}
