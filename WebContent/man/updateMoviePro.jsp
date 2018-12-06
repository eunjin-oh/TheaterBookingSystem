<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	int movieid = Integer.parseInt(request.getParameter("movieid"));
	String moviename = request.getParameter("moviename");
	String runtime = request.getParameter("runtime");
	String director = request.getParameter("director");
	String actors = request.getParameter("actors");
	String rating = request.getParameter("rating");
	String etcinfo = request.getParameter("etcinfo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 영화번호, 영화명 from 영화  where 영화번호=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieid);
		rs = pstmt.executeQuery();
		
		//레코드 검색결과로 작업처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			int mId = rs.getInt("영화번호");
			String mName = rs.getString("영화명");
			if(movieid==mId && moviename.equals(mName)){
				sql = "update 영화 set 영화명 = ?, 상영시간 = ?, 감독명 = ?, 출연배우명 = ?, 상영등급 = ?, 주요정보 = ? where 영화번호 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, moviename);
				pstmt.setString(2, runtime);
				pstmt.setString(3, director);
				pstmt.setString(4, actors);
				pstmt.setString(5, rating);
				pstmt.setString(6, etcinfo);
				pstmt.setInt(7, movieid);
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