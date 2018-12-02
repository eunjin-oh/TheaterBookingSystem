<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
   <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원탈퇴</font></b>
        <br><br><br>
        
        <form method="post" action="deleteTestPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="15">    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="passwd" maxlength="20">
                    </td>
                </tr>   
            </table>
            <br>
            <input type="submit" value="탈퇴"/>  <input type="button" value="취소">
        </form>
</body>
</html>