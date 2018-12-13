<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String type = request.getParameter("login");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);

	Cookie cookie = new Cookie("id", id);
	cookie.setMaxAge(20*60);
	response.addCookie(cookie);
	
	if(check==2){	
	%>
		<form action="manMain.jsp" id="moveId"><input type="hidden" name="id" value="<%=id%>"></form>
		<script>
			moveId.submit();
		</script>
	<%}else if(check == 3){%>
		<form action="cusMain.jsp" id="moveId"><input type="hidden" name="id" value="<%=id%>"></form>
		<script>
			moveId.submit();
		</script>	
	<%}else if(check == 0){%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%  }else{%>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
<%} %>