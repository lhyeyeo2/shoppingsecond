package dbpkg;
import java.sql.*;

public class DBConnection {
	public DBConnection() {
		
	}
	public Connection getConnection() {
		String driver = "oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "hrdkorea";
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			/***** db 연결이 되었는지 확인하는 log *****/
//			if(conn!=null)
//				System.out.println("JDBC Connected!");
//			else 
//				System.out.println("JDBC Connect Fail!");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return null;
	}
	public void closeDBResource(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void closeDBResource(PreparedStatement pstmt, Connection conn) {
		if(pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}















