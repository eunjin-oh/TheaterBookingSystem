<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
<<<<<<< HEAD
     <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="../style.css">
     <script src="../script.js" type="text/javascript"></script>
=======
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
  </head>
<body>

 <%  request.setCharacterEncoding("UTF-8");  
<<<<<<< HEAD
   String id = request.getParameter("id");
 %>
    <header id="header">
=======
	String id = request.getParameter("id");
 %>
 	<header id="header">
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
      <div class="navbar">
        <a href="../manMain.jsp?id=<%=id%>">관리자</a>
        <div class="dropdown">
          <button class="dropbtn">영화관관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">영화관정보</a>
            <a href="CinemaReg.jsp?id=<%=id%>">영화관등록</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">영화관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="MovieInfo.jsp?id=<%=id%>">영화정보</a>
            <a href="MovieReg.jsp?id=<%=id%>">영화등록</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">상영관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="ScreenInfo.jsp?id=<%=id%>">상영관정보</a>
            <a href="ScreenReg.jsp?id=<%=id%>">상영관등록</a>
            <a href="FilmReg.jsp?id=<%=id%>">상영영화등록</a>
            <a href="FilmDelete.jsp?id=<%=id%>">상영영화삭제</a>
          </div>
         </div>
               <div class="dropdown">
          <button class="dropbtn">고객관리
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="MemInfo.jsp?id=<%=id%>">VIP정보</a>
            </div>       
            </div>
          <div class="dropdown">
          <button class="dropbtn">티켓
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="ticketIssue.jsp?id=<%=id%>">티켓발행</a>
            </div>       
            </div>
    </header>
<<<<<<< HEAD
   <b><%=id %></b>님이 로그인 하셨습니다.
   <form method="post" action="../cookieLogout.jsp">
      <input type="submit" value="로그아웃">
   </form>
    <div id="wrap" >
=======
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
 	<div id="wrap" >
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
        <b><font size="6" color="gray">영화관등록</font></b>
        <br><br>
       <form action="CinemaRegPro.jsp">
        <table>
<<<<<<< HEAD
           <tr>
           <td id="title">영화관이름</td>
           <td><input type="text" name="theatername" maxlength="10" required></td>
           </tr>
         <tr>
            <td id="title">영화관주소</td>
             <td><input type="text" name="theateraddress" maxlength="100" required></td>
         </tr>
           <tr>
            <td id="title">영화관전화번호</td>
             <td><input type="text" name="theaterphone" maxlength="12" required></td>
         </tr>
           <tr>
            <td id="title">상영관수</td>
             <td><input type="text" name="screennumber" maxlength="10" required></td>
         </tr>
           <tr>
            <td id="title">총좌석수</td>
             <td><input type="text" name="seatnumber" maxlength="10" required></td>
=======
       	 <tr>
        	<td id="title">영화관이름</td>
        	<td><input type="text" name="theatername" maxlength="10" required></td>
       	 </tr>
         <tr>
      		<td id="title">영화관주소</td>
       		<td><input type="text" name="theateraddress" maxlength="100" required></td>
         </tr>
           <tr>
      		<td id="title">영화관전화번호</td>
       		<td><input type="text" name="theaterphone" maxlength="12" required></td>
         </tr>
           <tr>
      		<td id="title">상영관수</td>
       		<td><input type="text" name="screennumber" maxlength="10" required></td>
         </tr>
           <tr>
      		<td id="title">총좌석수</td>
       		<td><input type="text" name="seatnumber" maxlength="10" required></td>
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
         </tr>
         </table>
         <input type="hidden" name="id" value="<%=id%>">   
           <input type="submit" value="등록하기">
<<<<<<< HEAD
         <input type="button" onclick="move('CinemaInfo.jsp');" value="돌아가기"/>       
=======
         <input type="button" onclick="move('CinemaInfo.jsp');" value="돌아가기"/>    	
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
      </form>
    </div>
</body>
</html>