package com.community.petish.persistence;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringJUnit4ClassRunner.class)
@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testMyBatis() {
		try ( SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();
		) {
			log.info(session);
			log.info(con);
		} catch ( SQLException e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testConnection() {
		
		try (Connection con = dataSource.getConnection() ) {
			log.info(con);
		} catch ( SQLException e ) {
			fail(e.getMessage());
		}
	}
	
}
