<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
    int phone = Integer.parseInt(request.getParameter("phone"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 회원아이디, 회원비밀번호 from 회원  where 회원아이디=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		//레코드 검색결과로 작업처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rId = rs.getString("회원아이디");
			String rPasswd = rs.getString("회원비밀번호");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "update 회원 set 회원이름 = ?, 생년월일 = ?, 회원주소 = ?, 회원연락처 = ? where 회원아이디 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, birth);
				pstmt.setString(3, address);
				pstmt.setInt(4, phone);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
</head>
<body>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<div id="wrap">
        <br><br>
        <b><font size="5" color="gray">수정 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"></font>수정이 완료되었습니다.
        <br><br><br>
        
        <form action="modifyInfo.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td><%=id%>
                    </td>
                </tr>                       
                <tr>
                    <td id="title">비밀번호</td>
                    <td><%=passwd%></td>
                </tr>   
                <tr>
                    <td id="title">이름</td>
                    <td><%=name%></td>
                </tr>                  
                <tr>
                    <td id="title">생년월일</td>
                    <td><%=birth%></tr>
                <tr>
                    <td id="title">주소</td>
                    <td><%=address%></td>
                </tr>        
                <tr>
                    <td id="title">연락처</td>
                    <td><%=phone%></td>
                </tr>
            </table>
            <br>
            </form>
      <a href="modifyInfo.jsp?id=<%=id%>" class="button" type="submit"/>돌아가기</a>
      
    </div>
</body>
</html>
<%
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>