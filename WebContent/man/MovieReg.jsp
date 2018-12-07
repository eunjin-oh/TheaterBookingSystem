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
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
  </head>
  <% String id = request.getParameter("id"); %>
  <body>
    <header id="header">
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
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	
	<div id="wrap" class="formCenter" >
        <b><font size="6" color="gray" >영화등록</font></b>    
          <br> <br>     
        <form method="post" action="MovieRegPro.jsp" enctype="Multipart/form-data">
           <table>
               <tr>
                   <td id="title">영화번호</td>
                   <td><input type="text" name="movieid" maxlength="10" required></td>
               </tr>                      
               <tr>
                   <td id="title">영화명</td>
                   <td><input type="text" name="moviename" maxlength="20" required></td>
               </tr>   
               <tr>
                   <td id="title">상영시간</td>
                   <td><input type="text" name="runtime" maxlength="10" required></td>
               </tr>                  
               <tr>
                   <td id="title">감독명</td>
                   <td><input type="text" name="director" maxlength="10" required> </td>
               </tr>
               <tr>
                   <td id="title">출연배우명</td>
                   <td><input type="text" name="actors" maxlength="10" required></td>
               </tr>        
               <tr>
                   <td id="title" required>상영등급</td>
                   <td>
                      <select name='rating'>
			          <option value='ALL'>전체관람가</option>
		              <option value='12'>12세관람가</option>
	                  <option value='15'>15세관람가</option>
			          <option value='18'>청소년관람불가</option>
			         </select>
                    </td>
                </tr>
                <tr>
                    <td id="title" required>주요정보</td>
                    <td><input type="text" name="etcinfo" maxlength="30"></td>
                </tr>
                <tr>
                <td id="title" required>이미지 등록</td>
                <td><input type="file" name="fileName"/></td>
                </tr>     
            </table>
            <br>
            <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="등록"/>
            <input type="button" onclick="location.href='MovieInfo.jsp?id=<%=id%>' " value="취소">
        </form>
    </div> 
</body>
</html>