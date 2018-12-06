<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
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
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select ȸ�����̵�, ȸ����й�ȣ from ȸ��  where ȸ�����̵�=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		//���ڵ� �˻������ �۾�ó��
		if(rs.next()){ //������ ���̵� �����ϴ� ��� ����
			String rId = rs.getString("ȸ�����̵�");
			String rPasswd = rs.getString("ȸ����й�ȣ");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "update ȸ�� set ȸ���̸� = ?, ������� = ?, ȸ���ּ� = ?, ȸ������ó = ? where ȸ�����̵� = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, birth);
				pstmt.setString(3, address);
				pstmt.setInt(4, phone);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
</head>
<body>
	<b><%=id %></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
	<div id="wrap">
        <br><br>
        <b><font size="5" color="gray">���� ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="blue"></font>������ �Ϸ�Ǿ����ϴ�.
        <br><br><br>
        
        <form action="modifyInfo.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td><%=id%>
                    </td>
                </tr>                       
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td><%=passwd%></td>
                </tr>   
                <tr>
                    <td id="title">�̸�</td>
                    <td><%=name%></td>
                </tr>                  
                <tr>
                    <td id="title">�������</td>
                    <td><%=birth%></tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td><%=address%></td>
                </tr>        
                <tr>
                    <td id="title">����ó</td>
                    <td><%=phone%></td>
                </tr>
            </table>
            <br>
            </form>
      <a href="modifyInfo.jsp?id=<%=id%>" class="button" type="submit"/>���ư���</a>
      
    </div>
</body>
</html>
<%
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>