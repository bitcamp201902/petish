package com.community.petish.community.mapper;

import com.community.petish.community.mypet.post.mapper.MypetPostMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.log4j.Log4j;

@Log4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
public class MypetPostMapperTest {

	@Autowired
  MypetPostMapper mypetPostMapper;
	
	@Test
	void saveTest() {
	
	}
	
}
