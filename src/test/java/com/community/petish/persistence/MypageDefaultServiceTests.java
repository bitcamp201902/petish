package com.community.petish.persistence;

import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.community.mypage.service.DefaultServiceImpl;


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
