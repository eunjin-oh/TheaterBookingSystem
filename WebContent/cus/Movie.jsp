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
	<center><h1>영화예매</h1>
<div class="w3-content w3-section" style="float:center" >
  <img class="mySlides" src="./photo/snsd.jpg" style="width: 700px; height: 400px;">
  <img class="mySlides" src="./photo/yourname.jpg" style="width: 700px; height: 400px;">
  <img class="mySlides" src="./photo/animal.png" style="width: 700px; height: 400px;">
</div>
</center>
<br><br><br><br>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<div id="dSub" style="text-align:center;">
<select name="day" class="day" id="findMovie" style="width: 10%; text-align:center; font-size:15px;">
		<option value="reserv">예매율순</option></select>
<center><input type="text" name="subject" placeholder="영화검색" onkeydown="enterKey()" style="width: 60%; text-align:center; font-size:40px;"></center>
</div><br>

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
	String sql = "select * from 영화";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>


<div id="wrapper">
			<div id="main">
				<div class="inner">							
					<section class="tiles">						
<% 
	while(rs.next()){
		int movieid = rs.getInt("영화번호");
		String moviename = rs.getString("영화명");
		String runtime = rs.getString("상영시간");
		String director = rs.getString("감독명");
		String actors = rs.getString("출연배우명");
		String rating = rs.getString("상영등급");
		String etcinfo = rs.getString("주요정보");
		String fileName = rs.getString("이미지");			

%>
						<article class="style2">
							<span class="image">
								<img src="./photo/<%=fileName%>" alt="" />
							</span>
							<a href="ShowInfo.jsp?movieid=<%=movieid%>">
								<div class="content">
								<h2><%=moviename%></h2>
									<p><%=etcinfo%></p>
								</div>
							</a>
						</article>	
<%}%>								
					</section>
				</div>
			</div>
		</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
<%
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
