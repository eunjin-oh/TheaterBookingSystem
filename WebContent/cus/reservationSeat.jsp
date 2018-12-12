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
  <% String id = request.getParameter("id");
 	 String theatername = request.getParameter("theatername");
 	 int movieid = Integer.parseInt(request.getParameter("movieid"));	
 	 String rsvDate = request.getParameter("rsvDate");
 	 String ScreenNum = request.getParameter("ScreenNum");
 	 String MovieTime = request.getParameter("MovieTime");
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
	<div id="wrap" >
        <br><br>
        <b><font size="5" color="gray"> 좌석선택</font></b>        
        <form class="formCenter" action="">
         <table>
          <tr>
           <th>Screen</th>
          </tr>
          <tr>
           <%		
			Connection conn = null;
			PreparedStatement pstmt = null;
			String str = "";
			ResultSet rs = null;
			try {

				String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
				String dbId = "root";
				String dbPass = "admin";
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
				
				String sql = "select * from 상영관 where 영화관이름='"+theatername+"';";	
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					int SeatInt = rs.getInt("좌석수");				
				
				int SeatRow = SeatInt/10;
				int LeftSeat = SeatInt%10;
				for(int i =0; i<SeatRow; i++){
				%>
						<tr>				
				<%
					for(int j=0; j<10;j ++){
				%>
				 	<td><input type="checkbox" name ="seatNum" value="<%=j%>"><%=j%></td>
				<%
					}
				}
				for(int i =0; i<LeftSeat; i++){
					for(int j=0; j<10;j ++){
				%>
				 	<td><input type="checkbox" name ="seatNum" value="<%=j%>"><%=j%></td>
	<%
					}
				}
			}
		}
         catch (SQLException se) {
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
          		
          </tr>         
         </table>
         </form>
         </div>
        
</body>
</html>