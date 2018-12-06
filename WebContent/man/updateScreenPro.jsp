<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = request.getParameter("id");
	int screenid = Integer.parseInt(request.getParameter("screenid"));
	int seatnumber = Integer.parseInt(request.getParameter("seatnumber"));
	String theatername = request.getParameter("theatername");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 상영관번호 from 상영관  where 상영관번호=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,screenid);
		rs = pstmt.executeQuery();
		
		//레코드 검색결과로 작업처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			int mId = rs.getInt("상영관번호");
			if(screenid==mId){
				sql = "update 상영관 set 좌석수 = ?, 영화관이름 = ? where 상영관번호 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, seatnumber);
				pstmt.setString(2, theatername);
				pstmt.setInt(3, screenid);

				System.out.println(seatnumber);
				System.out.println(theatername);
				System.out.println(screenid);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 수정</title>
</head>
<body>
<%
			}else{// 패스워드가 일치하지 않을 경우
				out.println("상영관번호가 일치하지 않습니다.");
			}
		}else{//존재하지 않는 아이디인 경우
			out.println("존재하지않는 상영관입니다.");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
	<form action="ScreenInfo.jsp" id="moveId"><input type="hidden" name="id" value="<%=id%>"></form>
	<script>
		moveId.submit();
	</script>
</body>
</html>
