package com.community.petish.persistence;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
	
		try { 
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
	
		} catch ( ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try (Connection con =
					DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:XE",
							"petish",
							"petish")) {
			log.info(con);
		} catch (SQLException e) {
			
			fail(e.getMessage());			
		
		}
		
	}
	
}
