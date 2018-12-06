<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String theatername = request.getParameter("theatername");
	String theateraddress = request.getParameter("theateraddress");
	int theaterphone = Integer.parseInt(request.getParameter("theaterphone"));
	int screennumber = Integer.parseInt(request.getParameter("screennumber"));
	int seatnumber = Integer.parseInt(request.getParameter("seatnumber"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		//String sql = "select 영화관번호, 영화명 from 영화  where 영화번호=?";
		String sql = "select 영화관이름 from 영화관  where 영화관이름=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();
		
		//레코드 검색결과로 작업처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rName = rs.getString("영화관이름");
			if(theatername.equals(rName)){
				sql = "update 영화관 set 영화관이름 = ?, 영화관주소 = ?, 영화관전화번호 = ?, 상영관수 = ?, 총좌석수 = ? where 영화관이름 = ?";
				//System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, theatername);
				pstmt.setString(2, theateraddress);
				pstmt.setInt(3, theaterphone);
				pstmt.setInt(4, screennumber);
				pstmt.setInt(5, seatnumber);
				pstmt.setString(6, theatername);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 수정</title>
</head>
<body>
	영화 테이블의 레코드를 수정했습니다.
</body>
</html>
<%
			}else{// 패스워드가 일치하지 않을 경우
				out.println("영화이름이 틀렸습니다.");
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