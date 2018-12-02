<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
<html>
   <head>
   <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="script.js" type="text/javascript"></script>
<style rel="stylesheet">
body {
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
   background: #596778;
}
</style>
</head>
<body>
<form class="signUp" id="signupForm" method = "post" action="cookieLoginPro.jsp">
   <h1 class="signUpTitle">영화 예약 시스템</h1>
      <input type="text" class="signUpInput" name = "id" placeholder="아이디" autofocus required maxlength = "12">
      	<input type="password" class="signUpInput" name = "passwd" maxlength="12" placeholder="비밀번호" required>
      	 회원<input type="radio" name="login" value="cus" value="cus">
   		관리자<input type="radio" name="login"  value="man" value="man">
   		  <input type="submit" value="로그인" class="signUpButton">
   <a href="#" class="button" type="submit" onclick="move('JoinForm.jsp');"/>회원가입</a>
	</form>
</body>
</html>