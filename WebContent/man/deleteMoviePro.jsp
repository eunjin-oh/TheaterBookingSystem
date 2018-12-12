<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = request.getParameter("id");
	int movieid = Integer.parseInt(request.getParameter("movieid"));
	String moviename = request.getParameter("moviename");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "delete from ��ȭ where ��ȭ��ȣ = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieid);
<<<<<<< HEAD
		pstmt.executeUpdate();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��ȭ ����</title>
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
	��ȭ�� �����߽��ϴ�.
</body>
</html>
<%

=======
		rs = pstmt.executeQuery();
		
		// ���ڵ��� �˻� ����� �۾� ó��
		if(rs.next()){ //������ ���̵� �����ϴ� ��� ����
			int mId = rs.getInt("��ȭ��ȣ");
			String mName = rs.getString("��ȭ��");
			if(movieid==mId && moviename.equals(mName)){// �н����尡 ��ġ�ϴ� ��� ����
				sql = "delete *from ��ȭ where ��ȭ��ȣ = '"+mId+"';";
				pstmt = conn.prepareStatement(sql);			
				pstmt.executeUpdate();

			}else{// �н����尡 ��ġ���� ���� ���
				out.println("��ȭ���� Ʋ�Ƚ��ϴ�.");
			}
		}else{//�������� �ʴ� ���̵��� ���
			out.println("���������ʴ� ��ȭ��ȣ�Դϴ�.");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	
	<form action="MovieInfo.jsp" id="goInfo">
	<input type="hidden" name="id" value="<%=id%>">
	</form>
	<script>
	goInfo.submit();
	</script>
	
</body>
</html>
