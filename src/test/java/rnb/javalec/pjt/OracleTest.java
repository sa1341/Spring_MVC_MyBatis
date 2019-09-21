package rnb.javalec.pjt;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleTest {
	
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:TestDB";
	
	private static final String USER = "user1";
	
	private static final String PW = "user1";
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		
		try {
			
			Connection con = DriverManager.getConnection(URL, USER, PW);
			System.out.println(con);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		 
		
	}
	
}
