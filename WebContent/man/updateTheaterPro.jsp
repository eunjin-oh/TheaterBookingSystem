<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String theatername = request.getParameter("theatername");
	String theateraddress = request.getParameter("theateraddress");
	int theaterphone = Integer.parseInt(request.getParameter("theaterphone"));
	int screennumber = Integer.parseInt(request.getParameter("screennumber"));
	int seatnumber = Integer.parseInt(request.getParameter("seatnumber"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		//String sql = "select ��ȭ����ȣ, ��ȭ�� from ��ȭ  where ��ȭ��ȣ=?";
		String sql = "select ��ȭ���̸� from ��ȭ��  where ��ȭ���̸�=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,theatername);
		rs = pstmt.executeQuery();
		
		//���ڵ� �˻������ �۾�ó��
		if(rs.next()){ //������ ���̵� �����ϴ� ��� ����
			String rName = rs.getString("��ȭ���̸�");
			if(theatername.equals(rName)){
				sql = "update ��ȭ�� set ��ȭ���̸� = ?, ��ȭ���ּ� = ?, ��ȭ����ȭ��ȣ = ?, �󿵰��� = ?, ���¼��� = ? where ��ȭ���̸� = ?";
				//System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, theatername);
				pstmt.setString(2, theateraddress);
				pstmt.setInt(3, theaterphone);
				pstmt.setInt(4, screennumber);
				pstmt.setInt(5, seatnumber);
				pstmt.setString(6, theatername);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ڵ� ����</title>
</head>
<body>
	��ȭ ���̺��� ���ڵ带 �����߽��ϴ�.
</body>
</html>
<%
			}else{// �н����尡 ��ġ���� ���� ���
				out.println("��ȭ�̸��� Ʋ�Ƚ��ϴ�.");
			}
		}else{//�������� �ʴ� ���̵��� ���
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