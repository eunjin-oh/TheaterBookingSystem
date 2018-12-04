<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
    
<%
	String id = "";
	try{
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i=0;i<cookies.length;++i){
				if(cookies[i].getName().equals("id")){
					id = cookies[i].getValue();
				}
			}
			if(id.equals("")){
				response.sendRedirect("loginForm.jsp");
			}
		}else{
			response.sendRedirect("loginForm.jsp");
		}
	}catch(Exception e){}
%>
<!DOCTYPE html>
<html>
<head>
<title>메인</title>
</head>
<body>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>