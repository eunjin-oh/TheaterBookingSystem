<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
</head>
<%
	String id = request.getParameter("id");
%>
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
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>	
<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from 회원 where 회원아이디='"+id+"';";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
				
		while(rs.next()){
			String passwd = rs.getString("회원비밀번호");
			String name = rs.getString("회원이름");
			String birth = rs.getString("생년월일");
			String address = rs.getString("회원주소");
			String phone = rs.getString("회원연락처");			
			System.out.println(passwd);
 %>
 
	<div id="wrap">
	<br><br>
        <b><font size="6" color="gray" >회원정보 수정</font></b>
        <br><br><br>      
        <form action="modifyInfoFinish.jsp" class="formCenter">
            <table >
                <tr>
                    <td id="title">아이디</td>
                    <td><input type="hidden" name="id" value="<%=id%>"><%=id%></td>
                </tr>                       
                <tr>
                    <td id="title">비밀번호</td>
                    <td><input type="text" name="modi_pass" value="<%=passwd%>" maxlength="20" required></td>
                </tr>   
                <tr>
                    <td id="title">이름</td>
                    <td><input type="text" name="modi_name" value="<%=name%>" maxlength="10" required></td>
                </tr>                  
                <tr>
                    <td id="title">생년월일</td>
                    <td><input type="date" name="modi_birth" value="<%=birth%>"  value="2018-12-02" min="1940-01-01" max="2018-12-31" required></td>
                 </tr>
                <tr>
                    <td id="title">주소</td>
                    <td><input type="text" name="modi_address" value="<%=address%>"  maxlength="100" required></td>
                </tr>        
                <tr>
                    <td id="title">연락처</td>
                   <td><input type="text" name="modi_phone" value="<%=phone%>"  maxlength="12" required></td>
                </tr>        
            </table>
            <br>
            <input type="submit" value="수정">
            <input type="button" onclick="location.href='modifyInfo.jsp?id=<%=id%>' " value="돌아가기">       
            </form>     
           </div>
<%
		}
	}catch(Exception e){
				e.printStackTrace();
	}finally{
	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
</body>
</html>