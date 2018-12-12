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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
		<link rel="stylesheet" href="assets/css/main.css" />
	
<body>
<header>
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
            <a href="reservationInfo.jsp?id=<%=id%>">예약예매</a>
          </div>
   		</div>
   		</div>
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
<%   
   int movieid = Integer.parseInt(request.getParameter("movieid"));
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
      String dbId = "root";
      String dbPass = "admin";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      String sql = "select * from 영화 where 영화번호="+movieid+";";
   
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      while(rs.next()){
         String moviename = rs.getString("영화명");
         String runtime = rs.getString("상영시간");
         String director = rs.getString("감독명");
         String actors = rs.getString("출연배우명");
         String rating = rs.getString("상영등급");
         String etcinfo = rs.getString("주요정보");
         String fileName = rs.getString("이미지");         
   %>
   <div id="wrap">     
   <br><br>
            <b><font size="6" color="gray">영화정보</font></b>    
            <br><br>      
           <img src="photo/<%=fileName%>" width="350" height="500">
           <form action=""> 
            <br><br>
              <table>                       
            <tr>
               <td>영화번호</td>
               <td><%=movieid%></td>
            </tr>
            <tr>
               <td>영화이름</td>
               <td><%=moviename%></td>
            </tr>
            <tr>
               <td>상영시간</td>
               <td><%=runtime%></td>
            </tr>
            <tr>
               <td>감독명</td>
               <td><%=director%></td>
            </tr>
            <tr>
               <td>출연배우</td>
               <td><%=actors%></td>
            </tr>
            <tr>
               <td>상영등급</td>
               <td><%=rating%></td>
               
            </tr>
            <tr>
               <td>주요정보</td>
               <td rowspan="4"><%=etcinfo%></td>
            </tr>
         </table>      
         <a href="#" class="button" type="submit" onclick="move('reservationForm.jsp?movieid=<%=movieid%>');" />예매하기
         <a href="#" class="button" type="submit" onclick="move('Movie.jsp?id=<%=id%>');" />돌아가기
       </form>
   </div>
</body>
   <%
         }
            } catch (SQLException se) {
               System.out.println(se.getMessage());
            } finally {
               try {
                  if (rs != null)
                     rs.close();
                  if (pstmt != null)
                     pstmt.close();
                  if (conn != null)
                     conn.close();
               } catch (SQLException se) {
                  System.out.println(se.getMessage());
               }
            }
         %>
</html>