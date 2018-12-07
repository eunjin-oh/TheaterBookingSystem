<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
	String cusid = request.getParameter("cusid");
	String passwd = request.getParameter("passwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 회원아이디, 회원비밀번호 from 회원 where 회원아이디=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,cusid);
		rs = pstmt.executeQuery();
		
		// 레코드의 검색 결과로 작업 처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rId = rs.getString("회원아이디");
			String rPasswd = rs.getString("회원비밀번호");
			if(cusid.equals(rId) && passwd.equals(rPasswd)){// 패스워드가 일치하는 경우 수행
				sql = "delete from 회원 where 회원아이디 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cusid);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴</title>
</head>
<body>
	member 테이블의 레코드를 삭제했습니다.

<%
			}else{// 패스워드가 일치하지 않을 경우
				out.println("패스워드가 틀렸습니다.");
			}
		}else{//존재하지 않는 아이디인 경우
			out.println("아이디가 틀렸습니다.");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<form action="Customerinfo.jsp" class="go" name="id" value="<%=id%>"></form>
<script>
	go.submit();
</script>

</body>
</html>