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
		
		String sql = "delete from 영화관 where 영화관이름 = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		pstmt.executeUpdate();

=======
		String sql = "select �쁺�솕愿��씠由� from �쁺�솕愿� where �쁺�솕愿��씠由�=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();
		// �젅肄붾뱶�쓽 寃��깋 寃곌낵濡� �옉�뾽 泥섎━
		if(rs.next()){ //湲곗〈�뿉 �븘�씠�뵒媛� 議댁옱�븯�뒗 寃쎌슦 �닔�뻾
			String rName = rs.getString("�쁺�솕愿��씠由�");		
			if(theatername.equals(rName)){// �뙣�뒪�썙�뱶媛� �씪移섑븯�뒗 寃쎌슦 �닔�뻾
				sql = "delete from �쁺�솕愿� where �쁺�솕愿��씠由� = ?";
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
	<title>영화관 삭제</title>
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
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	영화관을 삭제했습니다.
</body>
</html>
<%

=======
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	�쁺�솕愿��쓣 �궘�젣�뻽�뒿�땲�떎.
</body>
</html>
<%
			}else{// �뙣�뒪�썙�뱶媛� �씪移섑븯吏� �븡�쓣 寃쎌슦
				out.println("�쁺�솕愿��씠 ����졇�뒿�땲�떎.");
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