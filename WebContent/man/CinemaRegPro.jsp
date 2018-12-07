<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
 <% 
 	String theatername = request.getParameter("theatername");
 	String theateraddress = request.getParameter("theateraddress");
 	int theaterphone = Integer.parseInt(request.getParameter("theaterphone"));
 	int screennumber = Integer.parseInt(request.getParameter("screennumber"));
 	int seatnumber = Integer.parseInt(request.getParameter("seatnumber"));
 	String id = request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
       String dbId = "root";
       String dbPass = "admin";
       
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       
       String sql = "insert into 영화관 values(?,?,?,?,?)";
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setString(1,theatername);
       pstmt.setString(2,theateraddress);
       pstmt.setInt(3,theaterphone);
       pstmt.setInt(4,screennumber);
       pstmt.setInt(5,seatnumber);
       pstmt.executeUpdate();
       
       str = "영화관 테이블에 새로운 레코드를 추가했습니다.";
    }catch(Exception e) {
       e.printStackTrace();
       str = "영화관 테이블에 새로운 레코드를 추가에 실패했습니다.";
    }finally {
       if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
       if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
 	<script src="script.js" type="text/javascript"></script>
<style rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입확인</title>
<style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>

 <%  request.setCharacterEncoding("UTF-8");  %>
 	<header id="header">
      <div class="navbar">
        <a href="../manMain.jsp?id=<%=id%>">관리자</a>
        <div class="dropdown">
          <button class="dropbtn">영화관관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">영화관 정보</a>
            <a href="CinemaReg.jsp?id=<%=id%>">영화관 등록</a>
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
            <a href="ScreenInfo.jsp?id=<%=id%>">상영관 정보</a>
            <a href="ScreenReg.jsp?id=<%=id%>">상영관 등록</a>
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
 <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">영화관추가 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=theatername%></font>가 추가되었습니다.
        <br>
      <a href="CinemaReg.jsp?id=<%=id%>" class="button" type="submit"/>영화관추가</a>
      
    </div>
</body>
</html>