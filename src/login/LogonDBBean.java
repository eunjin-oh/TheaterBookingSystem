package login;

import java.sql.*;

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean(){}
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}
	
	public void insertcustomer(LogonDataBean customer) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into 회원 values (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, customer.getId());
			pstmt.setString(2, customer.getPasswd());
			pstmt.setString(3, customer.getName());
			pstmt.setString(4, customer.getBirth());
			pstmt.setString(5, customer.getAddress());
			pstmt.setInt(6, customer.getPhone());
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
	}
	
	public int userCheck(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		String dbid = "";
		
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select 회원비밀번호 from 회원 where 회원아이디 = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("회원비밀번호");

				if(dbpasswd.equals(passwd)){	//비밀번호가 일치함					
					if(id.equals("admin")) {
						x = 2;	// when id is "admin"
						}else {
						x = 3;	//id isn't "admin"
						}
				}else {
					x = 0; //비밀번호 불일치
				}
			}else {
				x = -1; //id가 존재하지 않음
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
		return x;
	}
}