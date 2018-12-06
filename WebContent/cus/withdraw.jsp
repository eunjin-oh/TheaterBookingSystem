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
            <a href="Movie.jsp?id=<%=id%>">영화정보</a>
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
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원탈퇴</font></b>
        <br><br><br>    
          <font color="blue"><%=id%></font>님, 탈퇴하시겠습니까?
        <br><br><br><br><br>        
         <a href="deleteMem.jsp?=<%=id%>" class="button">탈퇴</a>
         <a href="../cusMain.jsp?id=<%=id%>" class="button">취소</a>
    </div>
</body>
</html>