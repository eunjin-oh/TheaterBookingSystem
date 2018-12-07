<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
</head>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String modi_passwd = request.getParameter("modi_passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		pstmt = conn.prepareStatement("select 회원비밀번호 from 회원 where 회원아이디 = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String dbpasswd = rs.getString("회원비밀번호");
			if(dbpasswd.equals(passwd)){
			%><form action="modifyInfoForm.jsp" id="moveId">
				<input type="hidden" name="id" value="<%=id%>"/>
				<input type="hidden" name="modi_passwd" value="<%=modi_passwd%>"/>
				<input type="hidden" name="name" value="<%=name%>"/>
				<input type="hidden" name="birth" value="<%=birth%>"/>
				<input type="hidden" name="address" value="<%=address%>"/>
				<input type="hidden" name="phone" value="<%=phone%>"/>
				<script>
					moveId.submit();
				</script>				
		<%}else{
				%>
				<script>
					alert("비밀번호가 맞지 않습니다.");	
					history.go(-1);
				</script>	
		<%} 
	}
}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	} %>
	</form>	
</body>
</html>
