package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBCUtil {

	//오라클 연결
	static final String driverName = "oracle.jdbc.driver.OracleDriver" ; 
	static	final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static	final String user = "nam";
	static	final String passwd = "1234";                        

	//연결하기
	public static Connection connect() {
		Connection conn=null;
		try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(url, user, passwd);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("   로그: connect() 수행완료");
		}
		return conn;
	}

	//연결해제하기
	public static void disconnect(Connection conn,PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("   로그: disconnect() 수행완료");
		}		
	}

}







