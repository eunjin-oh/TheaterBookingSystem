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
<link rel="stylesheet" type="text/css" href="style.css">
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
 <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">영화관추가 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=theatername%></font>가 추가되었습니다.
        <br>
      <a href="#" class="button" type="submit" onclick="move('addTheaterForm.jsp');"/>영화관추가</a>
      
    </div>
</body>
</html>