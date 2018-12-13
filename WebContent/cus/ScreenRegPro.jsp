<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
 <% 
    int screenid = Integer.parseInt(request.getParameter("screenid"));
 	int seatnumber = Integer.parseInt(request.getParameter("seatnumber"));
    String theatername = request.getParameter("theatername");
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
       
       String sql = "insert into 상영관 values(?,?,?)";
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setInt(1,screenid);
       pstmt.setInt(2,seatnumber);
       pstmt.setString(3,theatername);
       pstmt.executeUpdate();     
      
       for(int i =0; i<seatnumber; i++){
       String sql2 = "insert into 좌석 values(?,?,?)";
       pstmt = conn.prepareStatement(sql2);
       pstmt.setInt(1,i);
       pstmt.setInt(2,screenid);
       pstmt.setString(3,"NO");
       
       pstmt.executeUpdate();     
      }


       str = "상영관 테이블에 새로운 레코드를 추가했습니다.";
    }catch(Exception e) {
       e.printStackTrace();
       str = "상영관 테이블에 새로운 레코드를 추가에 실패했습니다.";
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
<title>상영관추가</title>
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
 <%  request.setCharacterEncoding("UTF-8");  %>
 <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">상영관추가 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=screenid%></font>가 추가되었습니다.
        <br>
      <a href="ScreenReg.jsp?id=<%=id%>" class="button" type="submit"/>상영관추가</a>
      
    </div>
</body>
</html>