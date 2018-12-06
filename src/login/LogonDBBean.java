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
					"insert into ȸ�� values (?, ?, ?, ?, ?, ?)");
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
					"select ȸ����й�ȣ from ȸ�� where ȸ�����̵� = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("ȸ����й�ȣ");

				if(dbpasswd.equals(passwd)){	//��й�ȣ�� ��ġ��					
					if(id.equals("admin")) {
						x = 2;	// when id is "admin"
						}else {
						x = 3;	//id isn't "admin"
						}
				}else {
					x = 0; //��й�ȣ ����ġ
				}
			}else {
				x = -1; //id�� �������� ����
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