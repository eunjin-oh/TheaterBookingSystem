<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String theatername = request.getParameter("theatername");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 영화관이름 from 영화관 where 영화관이름=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();

		// 레코드의 검색 결과로 작업 처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rName = rs.getString("영화관이름");
			System.out.println("test");
			if(theatername.equals(rName)){// 패스워드가 일치하는 경우 수행
				sql = "delete from 영화관 where 영화관이름 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, theatername);
				pstmt.executeUpdate();
				System.out.println("test");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 삭제</title>
</head>
<body>
	영화를 삭제했습니다.
</body>
</html>
<%
			}else{// 패스워드가 일치하지 않을 경우
				out.println("영화명이 틀렸습니다.");
			}
		}else{//존재하지 않는 아이디인 경우
			out.println("존재하지않는 영화번호입니다.");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>