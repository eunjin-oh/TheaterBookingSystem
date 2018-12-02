<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
    <title>회원가입 화면</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray" >회원가입</font></b>
        <br><br><br>
        
        <form method="post" action="JoinPro.jsp" class="formCenter">
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
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="10">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">생년월일</td>
                    <td>
                        <input type="date" name="birth" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" maxlength="100" name="address"/>
                    </td>
                </tr>        
                <tr>
                    <td id="title">연락처</td>
                    <td>
                        <input type="text" maxlength="12" name="phone"/>
                    </td>
                </tr>

            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>
</body>
</html>