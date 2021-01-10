package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		try {
		String url="jdbc:oracle:thin:@localhost:1521:testdb";	//디비주소
		String id="jspproject";									//디비ID
		String pass="8533";										//디비PW
		Class.forName("oracle.jdbc.driver.OracleDriver");		//드라이버
		conn=DriverManager.getConnection(url,id,pass);
		conn.setAutoCommit(false);								//자동커밋X
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;											//conn return
	}
}
