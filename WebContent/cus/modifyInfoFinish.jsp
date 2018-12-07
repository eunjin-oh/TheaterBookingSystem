<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
   
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
  </head>
  <% String id = request.getParameter("id"); %>
  <body>
    <header id="header">
      <div class="navbar">
        <a href="../cusMain.jsp?id=<%=id%>">회원</a>
        <div class="dropdown">
          <button class="dropbtn">My Page
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="modifyInfo.jsp?id=<%=id%>">정보수정</a>
            <a href="withdraw.jsp?id=<%=id%>">회원탈퇴</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">영화
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="Movie.jsp?id=<%=id%>">영화예매</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">예약현황
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="reservationInfo.jsp?id=<%=id%>">예약정보</a>
          </div>
   		</div>
   		</div>
    </header>
<%	
	String passwd = request.getParameter("modi_passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
    String phone = request.getParameter("phone");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select 회원아이디  from 회원  where 회원아이디=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		//레코드 검색결과로 작업처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rId = rs.getString("회원아이디");
			if(id.equals(rId)){
				sql = "update 회원 set 회원비밀번호= ?,회원이름 = ?, 생년월일 = ?, 회원주소 = ?, 회원연락처 = ? where 회원아이디 = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, passwd);
				pstmt.setString(2, name);
				pstmt.setString(3, birth);
				pstmt.setString(4, address);
				pstmt.setString(5, phone);
				pstmt.setString(6, id);
				pstmt.executeUpdate();
%>

<body>
	<b><%=id%></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">		
	</form>	
	<%}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
	<div id="wrap" >
        <br><br>
        <b><font size="5" color="gray">수정 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"></font>수정이 완료되었습니다.
        <br><br><br>       
            <table class="formCenter">
                <tr>
                    <td id="title">아이디</td>
                    <td><%=id%></td>
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
            <br><br><br><br>
            <br><br><br><br>
            <br><br><br><br>
      <a href="modifyInfo.jsp?id=<%=id%>" class="button" type="submit">돌아가기</a>    
    </div>
</body>
</html>
