<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*" %>
<%@page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
	String theatername = request.getParameter("theatername");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
<<<<<<< HEAD
		
		String sql = "delete from ¿µÈ­°ü where ¿µÈ­°üÀÌ¸§ = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		pstmt.executeUpdate();

=======
		String sql = "select ì˜í™”ê´€ì´ë¦„ from ì˜í™”ê´€ where ì˜í™”ê´€ì´ë¦„=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();
		// ë ˆì½”ë“œì˜ ê²€ìƒ‰ ê²°ê³¼ë¡œ ìž‘ì—… ì²˜ë¦¬
		if(rs.next()){ //ê¸°ì¡´ì— ì•„ì´ë””ê°€ ì¡´ìž¬í•˜ëŠ” ê²½ìš° ìˆ˜í–‰
			String rName = rs.getString("ì˜í™”ê´€ì´ë¦„");		
			if(theatername.equals(rName)){// íŒ¨ìŠ¤ì›Œë“œê°€ ì¼ì¹˜í•˜ëŠ” ê²½ìš° ìˆ˜í–‰
				sql = "delete from ì˜í™”ê´€ where ì˜í™”ê´€ì´ë¦„ = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, theatername);
				pstmt.executeUpdate();
			
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<<<<<<< HEAD
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>¿µÈ­°ü »èÁ¦</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="../script.js" type="text/javascript"></script>
</head>
<% 
	String id = request.getParameter("id");
%>
	<style>
	table{
	    border:3px solid lightgrey;
	    width: 60%;
		padding: 20px;
		text-align: center;
		margin: auto;
	}
	</style>
  <body>
    <header id="header">
      <div class="navbar">
        <a href="../manMain.jsp?id=<%=id%>">°ü¸®ÀÚ</a>
        <div class="dropdown">
          <button class="dropbtn">¿µÈ­°ü°ü¸®
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">¿µÈ­°üÁ¤º¸</a>
            <a href="CinemaReg.jsp?id=<%=id%>">¿µÈ­°üµî·Ï</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">¿µÈ­°ü¸®
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="MovieInfo.jsp?id=<%=id%>">¿µÈ­Á¤º¸</a>
            <a href="MovieReg.jsp?id=<%=id%>">¿µÈ­µî·Ï</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">»ó¿µ°ü¸®
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="ScreenInfo.jsp?id=<%=id%>">»ó¿µ°üÁ¤º¸</a>
            <a href="ScreenReg.jsp?id=<%=id%>">»ó¿µ°üµî·Ï</a>
            <a href="FilmReg.jsp?id=<%=id%>">»ó¿µ¿µÈ­µî·Ï</a>
            <a href="FilmDelete.jsp?id=<%=id%>">»ó¿µ¿µÈ­»èÁ¦</a>
          </div>
   		</div>
         <div class="dropdown">
          <button class="dropbtn">°í°´°ü¸®
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="MemInfo.jsp?id=<%=id%>">VIPÁ¤º¸</a>
            </div>       
            </div>
          <div class="dropdown">
          <button class="dropbtn">Æ¼ÄÏ
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="ticketIssue.jsp?id=<%=id%>">Æ¼ÄÏ¹ßÇà</a>
            </div>       
            </div>
    </header>
	<b><%=id %></b>´ÔÀÌ ·Î±×ÀÎ ÇÏ¼Ì½À´Ï´Ù.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="·Î±×¾Æ¿ô">
	</form>
	¿µÈ­°üÀ» »èÁ¦Çß½À´Ï´Ù.
</body>
</html>
<%

=======
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	ì˜í™”ê´€ì„ ì‚­ì œí–ˆìŠµë‹ˆë‹¤.
</body>
</html>
<%
			}else{// íŒ¨ìŠ¤ì›Œë“œê°€ ì¼ì¹˜í•˜ì§€ ì•Šì„ ê²½ìš°
				out.println("ì˜í™”ê´€ì´ í‹€ë ¸ìŠµë‹ˆë‹¤.");
			}
		}
>>>>>>> 21951d60b21f9bf3a9aba78c19a38f193c8e7c26
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>