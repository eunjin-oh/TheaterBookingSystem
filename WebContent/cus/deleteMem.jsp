<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%
	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		String sql = "delete from 회원 where 회원아이디= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
	<form action="../loginForm.jsp" id="moveId"></form>
	<script>
		moveId.submit();
	</script>
</body>
</html>
