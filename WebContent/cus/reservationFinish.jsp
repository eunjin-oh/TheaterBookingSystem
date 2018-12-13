<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
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
 	 String rsvDate = request.getParameter("rsvDate");
 	 int ScreenNum = Integer.parseInt(request.getParameter("ScreenNum"));
 	 String MovieTime = request.getParameter("MovieTime");
 	 String[] seatNum = request.getParameterValues("seatNum");
 	
 	 int count =0;
 	 for(int i=0; i<seatNum.length; i++){
 		 count++;
 	 }
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
	Random r = new Random(); 
	int resNum = r.nextInt(100000); 

%>
	<div id="wrap" >
        <br><br>
        <b><font size="5" color="gray">예약완료</font></b>             
         <table width="500">
        	 <tr>
            <td id="title">예매번호</td>
            <td><%=resNum%></td>
           </tr> 
            <tr>
            <td id="title">영화관이름</td>
            <td><%=theatername%></td>
           </tr> 
           <tr>
            <td id="title">영화이름</td>
            <td><%=moviename%></td>
           </tr>                 
            <tr>
            <td id="title">상영관번호</td>
            <td><%=ScreenNum%></td>
           </tr> 
             <tr>
            <td id="title">상영날짜</td>
            <td><%=rsvDate%></td>
           </tr> 
            <tr>
            <td id="title">상영시작시간</td>          
            <td><%=MovieTime%></td>         
           </tr> 
             <tr>
            <td id="title">좌석번호</td>
           <td>
            <%        
            for(String seat : seatNum){            
            out.print(seat+"<br>");
            }
            %>        
            </td>
           </tr>            
            <tr>
            <td id="title">매수</td>          
            <td><%=count%></td>         
           </tr> 
          </table>        
          <br>
      <input type="button"  onclick="move('Movie.jsp?id=<%=id%>');" value="확인"/>                   
         </div>    
  <% String seatList = Arrays.toString(seatNum);
 	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "insert into 티켓 values(?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, resNum);
		pstmt.setString(2, id);
		pstmt.setInt(3, movieid);
		pstmt.setString(4, moviename);
		pstmt.setInt(5, ScreenNum);
		pstmt.setString(6, rsvDate);
		pstmt.setString(7, MovieTime);	
		pstmt.setString(8, seatList);
		pstmt.setInt(9, count);	
		pstmt.setInt(10, count*9000);	
		pstmt.setString(11, theatername);	
		
		pstmt.executeUpdate();				
			
		String sql2 = "insert into 좌석 values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql2);
    for(String seat : seatNum){  	
			pstmt.setString(1,seat);
			pstmt.setInt(2, resNum);
			pstmt.setInt(3, ScreenNum);
			pstmt.setString(4, "YES");	
			pstmt.executeUpdate();
	   }		
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
</body>
</html>