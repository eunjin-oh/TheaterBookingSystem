<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

 <%  request.setCharacterEncoding("UTF-8");  %>
 <% 
    String moviename = request.getParameter("moviename");
	int movieid = Integer.parseInt(request.getParameter("movieid"));
    String runtime = request.getParameter("runtime");
    String director = request.getParameter("director");
    String actors = request.getParameter("actors");
    String rating = request.getParameter("rating");
    String etcinfo = request.getParameter("etcinfo");
    String filename1 = request.getParameter("fileName");
    String id = request.getParameter("id");
    
    System.out.println(movieid);
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
       String dbId = "root";
       String dbPass = "admin";
       
       
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       
       String sql = "insert into 영화 values(?,?,?,?,?,?,?,?,?)";
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setInt(1,movieid);
       pstmt.setString(2,moviename);
       pstmt.setString(3,runtime);
       pstmt.setString(4,director);
       pstmt.setString(5,actors);
       pstmt.setString(6,rating);
       pstmt.setString(7,etcinfo);
       pstmt.setInt(8,0);
       pstmt.setString(9,filename1);
       
       System.out.println(filename1);
       pstmt.executeUpdate();     
       
       str = "영화 테이블에 새로운 레코드를 추가했습니다.";
    }catch(Exception e) {
       e.printStackTrace();
       str = "영화 테이블에 새로운 레코드를 추가에 실패했습니다.";
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
 <%  request.setCharacterEncoding("UTF-8");  %>
 <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">영화추가 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=moviename%></font>가 추가되었습니다.
        
        <br>
         <input type="button" onclick="location.href='MovieReg.jsp?id=<%=id%>' " value="영화 추가하기">
         <input type="button" onclick="location.href='MovieInfo.jsp?id=<%=id%>' " value="등록확인하기">
      
    </div>
</body>
</html>
