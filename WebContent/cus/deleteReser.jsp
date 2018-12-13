<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
  <%
  	String id = request.getParameter("id");
  	int resNum = Integer.parseInt(request.getParameter("resNum"));
  	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "delete *from 티켓 where 예매번호 = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,resNum);
		
  	
  	
  %>
</body>
</html>