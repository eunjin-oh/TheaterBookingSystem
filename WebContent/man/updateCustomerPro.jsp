<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String cusid = request.getParameter("cusid");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
    int phone = Integer.parseInt(request.getParameter("phone"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select ȸ�����̵�, ȸ����й�ȣ from ȸ��  where ȸ�����̵�=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,cusid);
		rs = pstmt.executeQuery();
		
		//���ڵ� �˻������ �۾�ó��
		if(rs.next()){ //������ ���̵� �����ϴ� ��� ����
			String rId = rs.getString("ȸ�����̵�");
			String rPasswd = rs.getString("ȸ����й�ȣ");
			if(cusid.equals(rId) && passwd.equals(rPasswd)){
				sql = "update ȸ�� set ȸ���̸� = ?, ������� = ?, ȸ���ּ� = ?, ȸ������ó = ? where ȸ�����̵� = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, birth);
				pstmt.setString(3, address);
				pstmt.setInt(4, phone);
				pstmt.setString(5, cusid);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ڵ� ����</title>
</head>
<body>
	member ���̺��� ���ڵ带 �����߽��ϴ�.
</body>
</html>
<%
			}else{// �н����尡 ��ġ���� ���� ���
				out.println("�н����尡 Ʋ�Ƚ��ϴ�.");
			}
		}else{//�������� �ʴ� ���̵��� ���
			out.println("���̵� Ʋ�Ƚ��ϴ�.");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>