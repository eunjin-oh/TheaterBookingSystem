<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html lang="ko">
  <head>
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
  </head>
  <% String id = request.getParameter("id");
	 String moviename = request.getParameter("moviename");
 	 String theatername = request.getParameter("theatername");
 	 int movieid = Integer.parseInt(request.getParameter("movieid"));	 
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
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>

 <div id="wrap" >
        <br><br>
        <b><font size="5" color="gray"> 영화 상영 날짜 선택</font></b>
        <form class="formCenter" action="reservationScreen.jsp">
         <table>
          <tr>
           <td id="title">날짜선택</td>
           <td><input type="date" name="rsvDate" min="2018-12-12" required></td>
          </tr>       
         </table>       
         <input type="hidden" name="id" value="<%=id%>">
         <input type="hidden" name="movieid" value="<%=movieid%>">
         <input type="hidden" name="theatername" value="<%=theatername%>">
         <input type="hidden" name="moviename" value="<%=moviename%>">      
         <input type="submit" value="다음">
         <input type="button" onclick="move('Movie.jsp?id=<%=id%>');" value="취소" />
        </form>
  </div>
</body>
</html>