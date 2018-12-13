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
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<div id="wrap">
        <br><br>
        <b><font size="5" color="gray" style="text-align:center;">예약정보</font></b>           
   </div>    
    	<table border="1" width="1200" class="formCenter" >	
    	<tr>
			<td>예매번호</td>
			<td>영화번호</td>
			<td>상영관번호</td>
			<td>좌석번호</td>
			<td>상영시작시간</td>
			<td>상영일</td>			
			<td>영화관이름</td>
			<td>영화명</td>
			<td>매수</td>
			<td>가격</td>
			<td>삭제</td>
			<td>결제</td>
		</tr>
        
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
      String name = "'"+id+"'";
      String sql = "select * from 티켓 where 회원아이디="+name+";";
   
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
         int resNum = rs.getInt("예매번호");       
         int movieid= rs.getInt("영화번호");
         int ScreenNum = rs.getInt("상영관번호");
         String seatNum = rs.getString("좌석번호");
         String MovieTime = rs.getString("상영시작시간");
         String rsvDate = rs.getString("상영일");
         int count = rs.getInt("매수");
         int cost = rs.getInt("가격");
         String theatername = rs.getString("영화관이름");    
         String moviename = rs.getString("영화명");        
   %>
        	<tr>
	            <td><%=resNum%></td>        
	            <td><%=movieid%></td>         
	            <td><%=ScreenNum%></td>         
	            <td><%=seatNum%></td>        
			    <td><%=MovieTime%></td>       	               
	            <td><%=rsvDate%></td>                  	                        	           
	            <td><%=theatername%></td>            	           
	            <td><%=moviename%></td>         	                   
	            <td><%=count%></td>                	                    
	            <td><%=cost%></td>                    	                    
	            <td><a href="deleteReser.jsp?id=<%=id%>&resNum=<%=resNum%>">삭제</a></td> 
	            <td><a href="">결제</a></td>        
           </tr>  
               
          <%}
      }catch (SQLException se) {
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
 </table>    
</body>
 
</html>