<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>레코드 수정</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">영화관정보수정</font></b>
        <br><br><br>
        
        <form method="post" action="updateTheaterPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화관이름</td>
                    <td>
                        <input type="text" name="theatername" maxlength="10">    
                    </td>
                </tr>                      
                <tr>
                    <td id="title">영화관주소</td>
                    <td>
                        <input type="text" name="theateraddress" maxlength="100">
                    </td>
                </tr>   
                <tr>
                    <td id="title">영화관전화번호</td>
                    <td>
                        <input type="text" name="theaterphone" maxlength="12">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">상영관 수</td>
                    <td>                
                        <input type="text" name="screennumber" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">총 좌석수</td>
                    <td>
                        <input type="text" name="seatnumber" maxlength="10">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="수정"/>  <input type="button" value="취소">
        </form>
</body>
</html>