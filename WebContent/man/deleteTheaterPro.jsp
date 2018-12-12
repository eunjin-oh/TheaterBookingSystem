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
		
		String sql = "delete from ��ȭ�� where ��ȭ���̸� = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		pstmt.executeUpdate();

=======
		String sql = "select 영화관이름 from 영화관 where 영화관이름=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();
		// 레코드의 검색 결과로 작업 처리
		if(rs.next()){ //기존에 아이디가 존재하는 경우 수행
			String rName = rs.getString("영화관이름");		
			if(theatername.equals(rName)){// 패스워드가 일치하는 경우 수행
				sql = "delete from 영화관 where 영화관이름 = ?";
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
	<title>��ȭ�� ����</title>
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
        <a href="../manMain.jsp?id=<%=id%>">������</a>
        <div class="dropdown">
          <button class="dropbtn">��ȭ������
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">��ȭ������</a>
            <a href="CinemaReg.jsp?id=<%=id%>">��ȭ�����</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">��ȭ����
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="MovieInfo.jsp?id=<%=id%>">��ȭ����</a>
            <a href="MovieReg.jsp?id=<%=id%>">��ȭ���</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">�󿵰���
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="ScreenInfo.jsp?id=<%=id%>">�󿵰�����</a>
            <a href="ScreenReg.jsp?id=<%=id%>">�󿵰����</a>
            <a href="FilmReg.jsp?id=<%=id%>">�󿵿�ȭ���</a>
            <a href="FilmDelete.jsp?id=<%=id%>">�󿵿�ȭ����</a>
          </div>
   		</div>
         <div class="dropdown">
          <button class="dropbtn">������
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="MemInfo.jsp?id=<%=id%>">VIP����</a>
            </div>       
            </div>
          <div class="dropdown">
          <button class="dropbtn">Ƽ��
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="ticketIssue.jsp?id=<%=id%>">Ƽ�Ϲ���</a>
            </div>       
            </div>
    </header>
	<b><%=id %></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
	��ȭ���� �����߽��ϴ�.
</body>
</html>
<%

=======
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	영화관을 삭제했습니다.
</body>
</html>
<%
			}else{// 패스워드가 일치하지 않을 경우
				out.println("영화관이 틀렸습니다.");
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