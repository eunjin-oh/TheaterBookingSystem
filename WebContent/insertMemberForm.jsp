<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<h2>ȸ��������</h2>

	<form method="post" action="insertMemberPro.jsp">
		���̵� : <input type="text" name="id" maxlength="15"><br/>
		�н����� : <input type="password" name="passwd" maxlength="20"><br/>
		���� : <input type="text" name="name" maxlength="10"><br/>
		������� : <input type="text" name="birth" maxlength="10"><br/>
		�ּ� : <input type="text" name="address" maxlength="100"><br/>
		��ȭ��ȣ : <input type="text" name="phone" maxlength="12"><br/>
		<input type="submit" value="ȸ������">
		<input type="reset" value="�ٽ��Է�">	
	</form>
</body>
</html>