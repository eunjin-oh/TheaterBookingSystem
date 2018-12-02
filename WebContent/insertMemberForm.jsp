<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입폼</h2>

	<form method="post" action="insertMemberPro.jsp">
		아이디 : <input type="text" name="id" maxlength="15"><br/>
		패스워드 : <input type="password" name="passwd" maxlength="20"><br/>
		성명 : <input type="text" name="name" maxlength="10"><br/>
		생년월일 : <input type="text" name="birth" maxlength="10"><br/>
		주소 : <input type="text" name="address" maxlength="100"><br/>
		전화번호 : <input type="text" name="phone" maxlength="12"><br/>
		<input type="submit" value="회원가입">
		<input type="reset" value="다시입력">	
	</form>
</body>
</html>