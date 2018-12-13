<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("modi_id");
	int movieid = Integer.parseInt(request.getParameter("modi_movieid"));
	String moviename = request.getParameter("modi_moviename");
	String runtime = request.getParameter("modi_runtime");
	String director = request.getParameter("modi_director");
	String actors = request.getParameter("modi_actors");
	String rating = request.getParameter("modi_rating");
	String etcinfo = request.getParameter("modi_etcinfo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select ��ȭ��ȣ, ��ȭ�� from ��ȭ  where ��ȭ��ȣ=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieid);
		rs = pstmt.executeQuery();
		

		if(rs.next()){
			int mId = rs.getInt("��ȭ��ȣ");
			String mName = rs.getString("��ȭ��");
			if(movieid==mId){
				sql = "update ��ȭ set ��ȭ�� = ?, �󿵽ð� = ?, ������ = ?, �⿬���� = ?, �󿵵�� = ?, �ֿ����� = ? where ��ȭ��ȣ = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, moviename);
				pstmt.setString(2, runtime);
				pstmt.setString(3, director);
				pstmt.setString(4, actors);
				pstmt.setString(5, rating);
				pstmt.setString(6, etcinfo);
				pstmt.setInt(7, movieid);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%
			}else{
				out.println("��ȭ�̸��� Ʋ�Ƚ��ϴ�.");
			}
		}else{
			out.println("���������ʴ� ��ȭ��ȣ�Դϴ�.");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

	<form action="MovieInfo.jsp" id="moveId"><input type="hidden" name="id" value="<%=id%>"></form>
	<script>
		moveId.submit();
	</script>
	</body>
</html>
